<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_req_approve".
 *
 * @property int $approve_id
 * @property int|null $request_id
 * @property string|null $approver
 * @property string|null $approve_date
 * @property string|null $comment
 */
class EnReqApprove extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_req_approve';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['request_id'], 'integer'],
            [['approve_date'], 'safe'],
            [['comment'], 'string'],
            [['approver'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'approve_id' => Yii::t('app', 'Approve ID'),
            'request_id' => Yii::t('app', 'Request ID'),
            'approver' => Yii::t('app', 'Approver'),
            'approve_date' => Yii::t('app', 'Approve Date'),
            'comment' => Yii::t('app', 'Comment'),
        ];
    }
}
