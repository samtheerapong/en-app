<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_wo_list".
 *
 * @property int $id
 * @property int|null $workorder_id
 *
 * @property EnWo $workorder
 */
class EnWoList extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_wo_list';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['workorder_id'], 'integer'],
            [['workorder_id'], 'exist', 'skipOnError' => true, 'targetClass' => EnWo::class, 'targetAttribute' => ['workorder_id' => 'workorder_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'workorder_id' => Yii::t('app', 'Workorder ID'),
        ];
    }

    /**
     * Gets query for [[Workorder]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWorkorder()
    {
        return $this->hasOne(EnWo::class, ['workorder_id' => 'workorder_id']);
    }
}
