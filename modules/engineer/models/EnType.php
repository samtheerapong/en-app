<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_type".
 *
 * @property int $type_id
 * @property string $code รหัส
 * @property string $name ชื่อ
 * @property string|null $detail รายละเอียด
 * @property string|null $color สี
 * @property int|null $avtive สถานะ
 *
 * @property EnWo[] $enWos
 */
class EnType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_type';
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
            'type_id' => Yii::t('app', 'Type ID'),
            'code' => Yii::t('app', 'รหัส'),
            'name' => Yii::t('app', 'ชื่อ'),
            'detail' => Yii::t('app', 'รายละเอียด'),
            'color' => Yii::t('app', 'สี'),
            'avtive' => Yii::t('app', 'สถานะ'),
        ];
    }

    /**
     * Gets query for [[EnWos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getType0()
    {
        return $this->hasMany(EnWo::class, ['work_type_id' => 'type_id']);
    }
}
