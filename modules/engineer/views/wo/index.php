<?php

use app\modules\engineer\models\Wo;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\search\WoSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Wos');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="wo-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Wo'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'rp_id',
            'title',
            'description:ntext',
            'work_code',
            //'work_date',
            //'machine_id',
            //'location',
            //'work_type_id',
            //'work_start',
            //'work_end',
            //'ref:ntext',
            //'category_id',
            //'work_method:ntext',
            //'service_date',
            //'frequency',
            //'remask:ntext',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Wo $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
