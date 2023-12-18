<?php

use kartik\grid\GridView;
use yii\helpers\Html;

$this->title = $model->repair_code;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Rps'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
\yii\web\YiiAsset::register($this);
?>
<div class="rp-view">
    <div style="display: flex; justify-content: space-between;">
        <p>
            <?= Html::a('<i class="fas fa-chevron-left"></i> ' . Yii::t('app', 'Go Back'), ['index'], ['class' => 'btn btn-primary']) ?>
        </p>

        <p style="text-align: right;">
            <?= Html::a('<i class="fas fa-edit"></i> ' . Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-info']) ?>

            <?= Html::a('<i class="fas fa-trash"></i> ' . Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ]) ?>

        </p>
    </div>

    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) . ' | ' . $model->request_title ?>
        </div>
        <div class="card-body table-responsive">
            <div class="row">
                <div class="col-md-12">
                    <?= $this->render('_view', [
                        'model' => $model,
                    ]) ?>
                </div>
                <div class="col-md-12">

                    <?= GridView::widget([
                        'dataProvider' => new \yii\data\ActiveDataProvider([
                            'query' => $model->getLists(),
                        ]),
                        'summary' => '',
                        'columns' => [
                            [
                                'class' => 'yii\grid\SerialColumn',
                                'contentOptions' => ['class' => 'text-center', 'style' => 'width:45px;'], //กำหนด ความกว้างของ #
                            ],

                            
                            [
                                'attribute' => 'detail_list',
                                'format' => 'html',
                                'value' => function ($model) {
                                    $detail = $model->detail_list;
                                    $remask = $model->remask;
                                    $badge = ($remask !== null && $remask !== '') ? '<span class="badge badge-warning">' . $remask . '</span>' : '';
                                    return $detail . '   ' . $badge;
                                },
                            ],
                            // 'request_date',
                            [
                                'attribute' => 'request_date',
                                'format' => 'html',
                                'headerOptions' => ['style' => 'width:150px;'],
                                'value' => function ($model) {
                                    return $model->request_date ? Yii::$app->formatter->asDate($model->request_date) : 'N/A';
                                },
                            ],
                            // 'broken_date',
                            [
                                'attribute' => 'broken_date',
                                'format' => 'html',
                                'headerOptions' => ['style' => 'width:150px;'],
                                'value' => function ($model) {
                                    return $model->broken_date ? Yii::$app->formatter->asDate($model->broken_date) : 'N/A';
                                },
                            ],
                            // 'amount',
                            [
                                'attribute' => 'amount',
                                'format' => 'html',
                                'contentOptions' => ['class' => 'text-center','style' => 'width:60px;'],
                                'value' => function ($model) {
                                    return $model->amount ? $model->amount : 'N/A';
                                },
                            ],
                            // 'location',
                            [
                                'attribute' => 'location',
                                'format' => 'html',
                                'headerOptions' => ['style' => 'width:200px;'],
                                'value' => function ($model) {
                                    return $model->location ? $model->location0->name : 'N/A';
                                },
                            ],
                            // 'image:ntext',
                            // 'remask:ntext',

                        ],
                    ]); ?>
                </div>
            </div>
        </div>