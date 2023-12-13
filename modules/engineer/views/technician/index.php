<?php

use app\modules\engineer\models\Technician;
use kartik\widgets\Select2;
use yii\bootstrap5\LinkPager;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use kartik\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\search\TechnicianSearch $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Technicians');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="technician-index">

    <div style="display: flex; justify-content: space-between;">
        <p>
            <?= Html::a('<i class="fa fa-circle-plus"></i> ' . Yii::t('app', 'Create New'), ['create'], ['class' => 'btn btn-success']) ?>
        </p>

        <p style="text-align: right;">
            <?= Html::a('<i class="fa-solid fa-retweet"></i> ' . Yii::t('app', 'Card List'), ['card'], ['class' => 'btn btn-primary']) ?>
            <?= Html::a('<i class="fa fa-screwdriver-wrench"></i> ' . Yii::t('app', 'Configs'), ['/engineer/default/setings-menu'], ['class' => 'btn btn-warning']) ?>
        </p>
    </div>

    <?php // echo $this->render('_search', ['model' => $searchModel]); 
    ?>
    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body table-responsive">
            <?= GridView::widget([
                'dataProvider' => $dataProvider,
                'filterModel' => $searchModel,
                'pager' => [
                    'class' => LinkPager::class,
                    'options' => ['class' => 'pagination justify-content-center m-1'],
                    'maxButtonCount' => 5,
                    'firstPageLabel' => Yii::t('app', 'First'),
                    'lastPageLabel' => Yii::t('app', 'Last'),
                    'options' => ['class' => 'pagination justify-content-center'],
                    'linkContainerOptions' => ['class' => 'page-item'],
                    'linkOptions' => ['class' => 'page-link'],
                ],
                'columns' => [
                    [
                        'class' => 'yii\grid\SerialColumn',
                        'contentOptions' => ['style' => 'width:40px;'],
                    ],

                    // 'id',
                    // 'photo',
                    [
                        'attribute' => 'photo',
                        'contentOptions' => ['style' => 'width:120px;'], // Set the width of the column
                        'format' => 'raw',
                        'value' => function ($model) {
                            $imageUrl = '@web/uploads/technician/' . $model->photo;
                            $noAvatar = '@web/images/avatar.png';
                            return $model->photo
                                ? Html::a(Html::img($imageUrl, ['height' => '100px']), ['view', 'id' => $model->id])
                                : Html::a(Html::img($noAvatar, ['height' => '100px']), ['view', 'id' => $model->id]);
                        },
                        'filter' => false,
                    ],


                    [
                        'attribute' => 'name',
                        'format' => 'html',
                        'value' => function ($model) {
                            return $model->name;
                        },
                    ],
                    // 'tel',
                    [
                        'attribute' => 'tel',
                        'format' => 'html',
                        'value' => function ($model) {
                            return $model->tel;
                        },
                    ],
                    // 'head',
                    [
                        'attribute' => 'head',
                        'format' => 'html',
                        'value' => function ($model) {
                            return $model->head ? $model->head0->thai_name : Yii::t('app', 'N/A');
                        },
                    ],
                    // 'active',
                    [
                        'attribute' => 'active',
                        'format' => 'html',
                        'contentOptions' => ['style' => 'width:100px;'],
                        'value' => function ($model) {
                            return $model->active === 1 ? '<span class="badge" style="background-color:#1A5D1A">Yes</span>' : '<span class="badge" style="background-color:#FE0000">No</span>';
                        },
                        'filter' => Select2::widget([
                            'model' => $searchModel,
                            'attribute' => 'active',
                            'data' => ['1' => 'Yes', '0' => 'No'],
                            'options' => ['placeholder' => Yii::t('app', 'Select...')],
                            'pluginOptions' => [
                                'allowClear' => true
                            ],
                        ])
                    ],
                    [
                        'class' => 'kartik\grid\ActionColumn',
                        'headerOptions' => ['style' => 'width:250px;'],
                        'contentOptions' => ['class' => 'text-center'],
                        'buttonOptions' => ['class' => 'btn btn-outline-dark btn-sm'],
                        'template' => '<div class="btn-group btn-group-xs" role="group">{view} {update} {delete}</div>',

                    ],
                ],
            ]); ?>

        </div>
    </div>
</div>