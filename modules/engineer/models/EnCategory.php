<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_category".
 *
 * @property int $category_id
 * @property string $code รหัส
 * @property string $name ชื่อ
 * @property string|null $detail รายละเอียด
 * @property string|null $color สี
 * @property int|null $avtive สถานะ
 *
 * @property EnWo[] $enWos
 */
class EnCategory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_category';
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
            'category_id' => Yii::t('app', 'Category ID'),
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
    public function getEnWos()
    {
        return $this->hasMany(EnWo::class, ['category_id' => 'category_id']);
    }
}
