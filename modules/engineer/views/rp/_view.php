<?php

use yii\widgets\DetailView;

?>
<div class="rp-view">
    <?= DetailView::widget([
        'model' => $model,
        'template' => '<tr><th style="width: 200px;">{label}</th><td> {value}</td></tr>',
        'attributes' => [
            [
                'attribute' => 'repair_code',
                'format' => 'html',
                'value' => function ($model) {
                    return $model->repair_code ? $model->repair_code : 'N/A';
                },
            ],
            [
                'attribute' => 'request_title',
                'format' => 'html',
                'value' => function ($model) {
                    return $model->request_title ? $model->request_title : 'N/A';
                },
            ],
            // 'priority',
            [
                'attribute' => 'priority',
                'format' => 'html',
                'value' => function ($model) {
                    return $model->priority ? '<span class="badge" style="background-color:' . $model->priority0->color . ';"><b>' . $model->priority0->name . '</b></span>' : 'N/A';
                },
            ],
            // 'urgency',
            [
                'attribute' => 'urgency',
                'format' => 'html',
                'value' => function ($model) {
                    return $model->urgency ? '<span class="badge" style="background-color:' . $model->urgency0->color . ';"><b>' . $model->urgency0->name . '</b></span>' : 'N/A';
                },

            ],
            'created_date:date',
            // 'request_by',
            [
                'attribute' => 'request_by',
                'format' => 'html',
                'value' => function ($model) {
                    return $model->request_by ? $model->requestBy->thai_name : 'N/A';
                },
            ],
            // 'department',
            [
                'attribute' => 'department',
                'format' => 'html',
                'value' => function ($model) {
                    return  $model->department ? $model->department0->name : 'N/A';
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
                    return  $model->created_by ? $model->createdBy->thai_name : 'N/A';
                },
            ],
            // 'updated_by',
            [
                'attribute' => 'updated_by',
                'format' => 'html',
                'value' => function ($model) {
                    return $model->updated_by ? $model->updatedBy->thai_name : 'N/A';
                },
            ],
            // 'en_status_id',

        ],
    ]) ?>

</div>