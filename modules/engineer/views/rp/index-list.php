<?php

use app\modules\engineer\models\RpList;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\search\RpListSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

// $this->title = Yii::t('app', 'Rp Lists');
// $this->params['breadcrumbs'][] = $this->title;
?>
<div class="rp-list-index">

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        // 'filterModel' => $searchModel,
        'columns' => [
            [
                'class' => 'yii\grid\SerialColumn',
                'contentOptions' => ['style' => 'width:40px;'],
            ],

            // 'id',
            // 'request_id',
            // 'detail_list',
            [
                'attribute' => 'detail_list',
                'format' => 'html',
                'value' => function ($model) {
                    return $model->detail_list;
                },
            ],
            // 'request_date:date',
            [
                'attribute' => 'request_date',
                'format' => 'date',
                'contentOptions' => ['style' => 'width:150px;'],
                'value' => function ($model) {
                    return $model->request_date;
                },
            ],
            // 'broken_date:date',
            [
                'attribute' => 'broken_date',
                'format' => 'date',
                'contentOptions' => ['style' => 'width:150px;'],
                'value' => function ($model) {
                    return $model->broken_date;
                },
            ],
            // 'amount',
            [
                'attribute' => 'amount',
                'format' => 'html',
                'contentOptions' => ['style' => 'width:80px;'],
                'value' => function ($model) {
                    return $model->amount;
                },
            ],
            // 'location',
            [
                'attribute' => 'location',
                'format' => 'html',
                'contentOptions' => ['style' => 'width:200px;'],
                'value' => function ($model) {
                    return $model->location0->name;
                },
            ],
            // 'image:ntext',
            // 'remask:ntext',
            [
                'attribute' => 'remask',
                'format' => 'html',
                'contentOptions' => ['style' => 'width:15%;'],
                'value' => function ($model) {
                    return $model->remask;
                },
            ],
            // [
            //     'class' => ActionColumn::className(),
            //     'urlCreator' => function ($action, RpList $model, $key, $index, $column) {
            //         return Url::toRoute([$action, 'id' => $model->id]);
            //      }
            // ],
        ],
    ]); ?>


</div>