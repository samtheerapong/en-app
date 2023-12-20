<?php

namespace app\modules\ex\controllers;

use app\models\Model;
use app\modules\ex\models\CatalogOption;
use app\modules\ex\models\CatalogOptionSearch;
use app\modules\ex\models\OptionValue;
use Exception;
use kartik\widgets\ActiveForm;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\helpers\ArrayHelper;
use yii\web\Response;

/**
 * CatalogOptionController implements the CRUD actions for CatalogOption model.
 */
class CatalogOptionController extends Controller
{
    /**
     * @inheritDoc
     */
    public function behaviors()
    {
        return array_merge(
            parent::behaviors(),
            [
                'verbs' => [
                    'class' => VerbFilter::className(),
                    'actions' => [
                        'delete' => ['POST'],
                    ],
                ],
            ]
        );
    }

    /**
     * Lists all CatalogOption models.
     *
     * @return string
     */
    public function actionIndex()
    {
        $searchModel = new CatalogOptionSearch();
        $dataProvider = $searchModel->search($this->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single CatalogOption model.
     * @param int $id ID
     * @return string
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new CatalogOption model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return string|\yii\web\Response
     */
    public function actionCreate()
    {
        $modelCatalogOption = new CatalogOption;
        $modelsOptionValue = [new OptionValue];
        if ($modelCatalogOption->load(Yii::$app->request->post())) {

            $modelsOptionValue = Model::createMultiple(OptionValue::classname());
            Model::loadMultiple($modelsOptionValue, Yii::$app->request->post());
            foreach ($modelsOptionValue as $index => $modelOptionValue) {
                $modelOptionValue->sort_order = $index;
                $modelOptionValue->img = \yii\web\UploadedFile::getInstance($modelOptionValue, "[{$index}]img");
            }

            // ajax validation
            if (Yii::$app->request->isAjax) {
                Yii::$app->response->format = Response::FORMAT_JSON;
                return ArrayHelper::merge(
                    ActiveForm::validateMultiple($modelsOptionValue),
                    ActiveForm::validate($modelCatalogOption)
                );
            }

            // validate all models
            $valid = $modelCatalogOption->validate();
            $valid = Model::validateMultiple($modelsOptionValue) && $valid;

            if ($valid) {
                $transaction = \Yii::$app->db->beginTransaction();
                try {
                    if ($flag = $modelCatalogOption->save(false)) {
                        foreach ($modelsOptionValue as $modelOptionValue) {
                            $modelOptionValue->catalog_option_id = $modelCatalogOption->id;

                            if (($flag = $modelOptionValue->save(false)) === false) {
                                $transaction->rollBack();
                                break;
                            }
                        }
                    }
                    if ($flag) {
                        $transaction->commit();
                        return $this->redirect(['view', 'id' => $modelCatalogOption->id]);
                    }
                } catch (Exception $e) {
                    $transaction->rollBack();
                }
            }
        }

        return $this->render('create', [
            'modelCatalogOption' => $modelCatalogOption,
            'modelsOptionValue' => (empty($modelsOptionValue)) ? [new OptionValue] : $modelsOptionValue
        ]);
    }

    /**
     * Updates an existing CatalogOption model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param int $id ID
     * @return string|\yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($this->request->isPost && $model->load($this->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->id]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing CatalogOption model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param int $id ID
     * @return \yii\web\Response
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the CatalogOption model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param int $id ID
     * @return CatalogOption the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = CatalogOption::findOne(['id' => $id])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
