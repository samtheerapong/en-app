<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_wo_approve".
 *
 * @property int $id
 * @property int|null $wo_id
 * @property string|null $approver
 * @property string|null $approve_date
 * @property string|null $comment
 *
 * @property Wo $wo
 */
class WoApprove extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_wo_approve';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['wo_id'], 'integer'],
            [['approve_date'], 'safe'],
            [['comment'], 'string'],
            [['approver'], 'string', 'max' => 255],
            [['wo_id'], 'exist', 'skipOnError' => true, 'targetClass' => Wo::class, 'targetAttribute' => ['wo_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'wo_id' => Yii::t('app', 'Wo ID'),
            'approver' => Yii::t('app', 'Approver'),
            'approve_date' => Yii::t('app', 'Approve Date'),
            'comment' => Yii::t('app', 'Comment'),
        ];
    }

    /**
     * Gets query for [[Wo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWo()
    {
        return $this->hasOne(Wo::class, ['id' => 'wo_id']);
    }
}
