<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\Warehouse $model */

$this->title = Yii::t('app', 'Create Warehouse');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Warehouses'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="warehouse-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
