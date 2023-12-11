<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_technician".
 *
 * @property int $technician_id
 * @property string|null $name ชื่อ-สกุล
 * @property string|null $photo รูปภาพ
 * @property string|null $tel เบอร์ติดต่อ
 * @property int|null $active สถานะ
 *
 * @property EnWo[] $enWos
 * @property EnWo[] $enWos0
 */
class EnTechnician extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_technician';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['active'], 'integer'],
            [['name', 'photo'], 'string', 'max' => 255],
            [['tel'], 'string', 'max' => 45],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'technician_id' => Yii::t('app', 'Technician ID'),
            'name' => Yii::t('app', 'ชื่อ-สกุล'),
            'photo' => Yii::t('app', 'รูปภาพ'),
            'tel' => Yii::t('app', 'เบอร์ติดต่อ'),
            'active' => Yii::t('app', 'สถานะ'),
        ];
    }

    /**
     * Gets query for [[EnWos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnWos()
    {
        return $this->hasMany(EnWo::class, ['rechecker' => 'technician_id']);
    }

    /**
     * Gets query for [[EnWos0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnWos0()
    {
        return $this->hasMany(EnWo::class, ['checker' => 'technician_id']);
    }
}
