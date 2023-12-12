<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\Urgency $model */

$this->title = Yii::t('app', 'Create Urgency');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Urgencies'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="urgency-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
