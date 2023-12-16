<?php

use app\modules\nfc\models\Location;
use kartik\widgets\DatePicker;
use kartik\widgets\Select2;
use wbraganca\dynamicform\DynamicFormWidget;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\widgets\DetailView;

?>

<div class="moromi-form-addlist">



    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body table-responsive">
            <div class="row">
                <div class="col-md-4">
                    <?= $this->render('_view', [
                        'model' => $model,
                    ]) ?>
                </div>

                <div class="col-md-8">
                    <?php $form = ActiveForm::begin(['id' => 'dynamic-form',]); ?>
                    <?php
                    DynamicFormWidget::begin([
                        'widgetContainer' => 'dynamicform_wrapper',
                        'widgetBody' => '.container-items',
                        'widgetItem' => '.item',
                        'limit' => 20,
                        'min' => 1,
                        'insertButton' => '.add-item',
                        'deleteButton' => '.remove-item',
                        'model' => $modelsItem[0],
                        'formId' => 'dynamic-form',
                        'formFields' => [
                            'request_id',
                            'detail_list',
                            'request_date',
                            'broken_date',
                            'amount',
                            'location',
                            'image',
                            'remask',
                        ],
                    ]);
                    ?>

                    <div class="row">
                        <div class="container-items">
                            <?php foreach ($modelsItem as $i => $modelitem) : ?>
                                <div class="item card">
                                    <div class="card-header text-white bg-info">
                                        <div class="card-title float-left">
                                            <div class="float-left">
                                                <?= Yii::t('app', 'Lists') ?>
                                            </div>
                                        </div>
                                        <div class="float-right">
                                            <button type="button" class="add-item btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?= Yii::t('app', 'Add') ?></button>
                                            <button type="button" class="remove-item btn btn-danger btn-sm"><i class="fa fa-minus"></i> <?= Yii::t('app', 'Remove') ?></button>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="card-body">
                                        <?php
                                        // necessary for update action.
                                        if (!$modelitem->isNewRecord) {
                                            echo Html::activeHiddenInput($modelitem, "[{$i}]id");
                                        }
                                        ?>
                                        <div class="row">
                                            <?= $form->field($modelitem, '[{$i}]request_id')->hiddenInput()->label(false) ?>
                                            <div class="col-md-9">
                                                <?= $form->field($modelitem, '[{$i}]detail_list')->textInput() ?>
                                            </div>
                                            <div class="col-md-3">
                                                <?= $form->field($modelitem, '[{$i}]amount')->textInput(['maxlength' => true, 'type' => 'number', 'value' => '1']) ?>
                                            </div>
                                            <div class="col-md-6">
                                                <?= $form->field($modelitem, 'request_date')->widget(DatePicker::class, []); ?>
                                            </div>
                                            <div class="col-md-6">
                                                <?= $form->field($modelitem, 'broken_date')->widget(DatePicker::class, []); ?>
                                            </div>

                                            <div class="col-md-12">
                                                <?= $form->field($modelitem, 'location')->widget(Select2::class, [
                                                    'language' => 'th',
                                                    'data' => ArrayHelper::map(Location::find()->all(), 'id', 'name'),
                                                    'options' => ['placeholder' => Yii::t('app', 'Select...')],
                                                    'pluginOptions' => [
                                                        'allowClear' => true
                                                    ],
                                                ]);
                                                ?>
                                            </div>
                                            <div class="col-md-12">
                                                <?= $form->field($modelitem, '[{$i}]remask')->textInput() ?>
                                            </div>
                                            <div class="col-md-12">
                                                <?= $form->field($modelitem, '[{$i}]image')->fileInput() ?>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        </div>

                    <?php endforeach; ?>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="d-grid gap-2">
                        <?= Html::submitButton('<i class="fas fa-save"></i> ' . Yii::t('app', 'Save'), ['class' => 'btn btn-success btn-lg']) ?>
                    </div>
                </div>
                <?php DynamicFormWidget::end(); ?>
                <?php ActiveForm::end(); ?>
            </div>

        </div>
    </div>