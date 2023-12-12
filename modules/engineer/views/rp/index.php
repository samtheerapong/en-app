<?php

use app\modules\engineer\models\Rp;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\search\RpSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Rps');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rp-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Rp'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'repair_code',
            'priority',
            'urgency',
            'created_date',
            //'request_by',
            //'department',
            //'request_title',
            //'remask:ntext',
            //'created_at',
            //'updated_at',
            //'created_by',
            //'updated_by',
            //'en_status_id',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Rp $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
