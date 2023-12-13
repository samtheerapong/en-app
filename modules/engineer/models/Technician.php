<?php

namespace app\modules\engineer\models;

use app\models\User;
use Yii;

/**
 * This is the model class for table "en_technician".
 *
 * @property int $id
 * @property string|null $photo รูปภาพ
 * @property string|null $tel เบอร์ติดต่อ
 * @property int|null $active สถานะ
 * @property string|null $name ชื่อ-สกุล
 * @property int|null $head หัวหน้า
 *
 * @property Actor[] $enActors
 */
class Technician extends \yii\db\ActiveRecord
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
            [['active', 'head'], 'integer'],
            [['photo', 'name'], 'string', 'max' => 255],
            [['tel'], 'string', 'max' => 45],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'photo' => Yii::t('app', 'รูปภาพ'),
            'tel' => Yii::t('app', 'เบอร์ติดต่อ'),
            'active' => Yii::t('app', 'สถานะ'),
            'name' => Yii::t('app', 'ชื่อ-สกุล'),
            'head' => Yii::t('app', 'หัวหน้า'),
        ];
    }

    /**
     * Gets query for [[EnActors]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getActors0()
    {
        return $this->hasMany(Actor::class, ['technician_id' => 'id']);
    }

    public function getHead0()
    {
        return $this->hasOne(User::class, ['id' => 'head']);
    }
}
