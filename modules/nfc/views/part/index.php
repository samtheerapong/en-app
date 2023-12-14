<?php

use app\modules\nfc\models\Part;
use yii\helpers\Html;
use yii\helpers\Url;
use yii\grid\ActionColumn;
use yii\grid\GridView;

/** @var yii\web\View $this */
/** @var app\modules\nfc\models\search\PartSearcn $searchModel */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = Yii::t('app', 'Parts');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="part-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a(Yii::t('app', 'Create Part'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'photo:ntext',
            'code',
            'name',
            'name_en',
            //'old_code',
            //'description:ntext',
            //'en_part_doc_id',
            //'en_part_group_id',
            //'en_part_type_id',
            //'unit_lg',
            //'unit_sm',
            //'serial_no',
            //'price',
            //'cost',
            //'status',
            //'last_date',
            //'remask:ntext',
            //'imported',
            [
                'class' => ActionColumn::className(),
                'urlCreator' => function ($action, Part $model, $key, $index, $column) {
                    return Url::toRoute([$action, 'id' => $model->id]);
                 }
            ],
        ],
    ]); ?>


</div>
