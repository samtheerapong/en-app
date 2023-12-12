<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\engineer\models\Rp $model */

$this->title = Yii::t('app', 'Create Rp');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Rps'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="rp-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
