<?php

use yii\helpers\Html;

/** @var yii\web\View $this */
/** @var app\modules\ex\models\CatalogOption $model */

$this->title = Yii::t('app', 'Create Catalog Option');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Catalog Options'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="catalog-option-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'modelCatalogOption' => $modelCatalogOption,
        'modelsOptionValue' => $modelsOptionValue
    ]) ?>

</div>
