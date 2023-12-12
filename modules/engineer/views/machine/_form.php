<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\Machine $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="machine-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'machine_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'machine_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'last_repair')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
