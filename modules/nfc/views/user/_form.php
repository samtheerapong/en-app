<?php

use app\models\User;
use app\modules\authen\models\User as ModelsUser;
use app\modules\authen\models\UserRoles;
use app\modules\authen\models\UserRules;
use app\modules\nfc\models\Department;
use yii\helpers\ArrayHelper;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/** @var yii\web\View $this */
/** @var app\models\User $model */
/** @var yii\widgets\ActiveForm $form */
?>

<div class="user-form">

    <?php $form = ActiveForm::begin(); ?>
    
    <div class="card border-secondary">
        <div class="card-header text-white bg-secondary">
            <?= Html::encode($this->title) ?>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'username')->textInput() ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'password_hash')->passwordInput() ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <?= $form->field($model, 'thai_name')->textInput() ?>
                </div>
                <div class="col-md-6">
                    <?= $form->field($model, 'email')->textInput() ?>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <?= $form->field($model, 'role_id')->dropDownList(
                        ArrayHelper::map(UserRoles::find()->all(), 'id', 'name'),
                        [
                            'prompt' => Yii::t('app', 'Select...'),
                            'options' => ['' => ['disabled' => true]], // Optional: Disable the prompt option
                            'required' => true, // Make the field required
                        ]
                    ) ?>
                </div>
                <div class="col-md-3">
                    <?= $form->field($model, 'rule_id')->dropDownList(
                        ArrayHelper::map(UserRules::find()->all(), 'id', 'name'),
                        [
                            'prompt' => Yii::t('app', 'Select...'),
                            'options' => ['' => ['disabled' => true]], // Optional: Disable the prompt option
                            'required' => true, // Make the field required
                        ]
                    ) ?>
                </div>
                <div class="col-md-3">
                    <?= $form->field($model, 'department_id')->dropDownList(
                        ArrayHelper::map(Department::find()->all(), 'id', 'name'),
                        [
                            'prompt' => Yii::t('app', 'Select...'),
                            'options' => ['' => ['disabled' => true]], // Optional: Disable the prompt option
                            'required' => true, // Make the field required
                        ]
                    ) ?>
                </div>
                <div class="col-md-3">
                    <?= $form->field($model, 'status')->dropDownList([
                        ModelsUser::STATUS_ACTIVE => Yii::t('app', 'Active'),
                        ModelsUser::STATUS_INACTIVE => Yii::t('app', 'Inactive'),
                        // User::STATUS_DELETED => Yii::t('app', 'Delete'),
                    ]) ?>
                </div>
            </div>

        </div>
        <div class="card-footer">
            <div class="form-group">
                <div class="d-grid gap-2">
                    <?= Html::submitButton('<i class="fas fa-save"></i> ' . Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
                </div>
            </div>

        </div>
    </div>

    <?php ActiveForm::end(); ?>

</div>