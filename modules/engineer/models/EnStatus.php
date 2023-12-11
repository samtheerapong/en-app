<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_status".
 *
 * @property int $status_id
 * @property string $code รหัส
 * @property string $name สถานะ
 * @property string|null $detail รายละเอียด
 * @property string|null $color สี
 * @property int|null $avtive สถานะ
 */
class EnStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['code', 'name'], 'required'],
            [['detail'], 'string'],
            [['avtive'], 'integer'],
            [['code', 'name', 'color'], 'string', 'max' => 255],
            [['code'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'status_id' => Yii::t('app', 'Status ID'),
            'code' => Yii::t('app', 'รหัส'),
            'name' => Yii::t('app', 'สถานะ'),
            'detail' => Yii::t('app', 'รายละเอียด'),
            'color' => Yii::t('app', 'สี'),
            'avtive' => Yii::t('app', 'สถานะ'),
        ];
    }
}
