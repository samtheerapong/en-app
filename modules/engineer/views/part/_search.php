<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\search\PartSearch $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="part-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'images') ?>

    <?= $form->field($model, 'code') ?>

    <?= $form->field($model, 'name') ?>

    <?= $form->field($model, 'name_en') ?>

    <?php // echo $form->field($model, 'old_code') ?>

    <?php // echo $form->field($model, 'description') ?>

    <?php // echo $form->field($model, 'en_part_doc_id') ?>

    <?php // echo $form->field($model, 'en_part_group_id') ?>

    <?php // echo $form->field($model, 'en_part_type_id') ?>

    <?php // echo $form->field($model, 'serial_no') ?>

    <?php // echo $form->field($model, 'unit') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'cos') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-outline-secondary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
