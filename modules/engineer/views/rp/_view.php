<?php

use yii\widgets\DetailView;

?>
<div class="rp-view">
    <?= DetailView::widget([
        'model' => $model,
        'template' => '<tr><th style="width: 200px;">{label}</th><td> {value}</td></tr>',
        'attributes' => [
            // 'id',
            'repair_code',
            'request_title',
            // 'priority',
            [
                'attribute' => 'priority',
                'format' => 'html',
                'value' => function ($model) {
                    return '<span class="badge" style="background-color:' . $model->priority0->color . ';"><b>' . $model->priority0->name . '</b></span>';
                },
            ],
            // 'urgency',
            [
                'attribute' => 'urgency',
                'format' => 'html',
                'value' => function ($model) {
                    return '<span class="badge" style="background-color:' . $model->urgency0->color . ';"><b>' . $model->urgency0->name . '</b></span>';
                },

            ],
            'created_date:date',
            // 'request_by',
            [
                'attribute' => 'request_by',
                'format' => 'html',
                'value' => function ($model) {
                    return  $model->requestBy->thai_name;
                },
            ],
            // 'department',
            [
                'attribute' => 'department',
                'format' => 'html',
                'value' => function ($model) {
                    return  $model->department0->name;
                },
            ],
            [
                'attribute' => 'en_status_id',
                'format' => 'html',
                'value' => function ($model) {
                    return  '<span class="badge" style="background-color:' . $model->status0->color . '; color: #FFFFFF;">' . $model->status0->name . '</span>';
                },
            ],
            'remask:ntext',
            'created_at:date',
            'updated_at:date',
            // 'created_by',

            [
                'attribute' => 'created_by',
                'format' => 'html',
                'value' => function ($model) {
                    return  $model->createdBy->thai_name;
                },
            ],
            // 'updated_by',
            [
                'attribute' => 'updated_by',
                'format' => 'html',
                'value' => function ($model) {
                    return  $model->updatedBy->thai_name;
                },
            ],
            // 'en_status_id',

        ],
    ]) ?>

</div>