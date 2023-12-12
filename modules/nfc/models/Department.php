<?php

namespace app\modules\nfc\models;

use app\modules\engineer\models\PartGroup;
use app\modules\engineer\models\PartType;
use app\modules\engineer\models\Rp;
use app\modules\engineer\models\Warehouse;
use Yii;

/**
 * This is the model class for table "department".
 *
 * @property int $id
 * @property string|null $code รหัส
 * @property string|null $name ชื่อแผนก
 * @property string|null $detail รายละเอียด
 * @property int|null $department_head หัวหน้าแผนก
 * @property int|null $warehouse_id
 * @property string|null $color สี
 * @property int|null $active สถานะ
 *
 * @property PartGroup[] $PartGroups
 * @property PartType[] $PartTypes
 * @property Rp[] $Rps
 * @property Warehouse $warehouse
 */
class Department extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'department';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['detail'], 'string'],
            [['department_head', 'warehouse_id', 'active'], 'integer'],
            [['code', 'name', 'color'], 'string', 'max' => 255],
            [['warehouse_id'], 'exist', 'skipOnError' => true, 'targetClass' => Warehouse::class, 'targetAttribute' => ['warehouse_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'รหัส'),
            'name' => Yii::t('app', 'ชื่อแผนก'),
            'detail' => Yii::t('app', 'รายละเอียด'),
            'department_head' => Yii::t('app', 'หัวหน้าแผนก'),
            'warehouse_id' => Yii::t('app', 'Warehouse ID'),
            'color' => Yii::t('app', 'สี'),
            'active' => Yii::t('app', 'สถานะ'),
        ];
    }

    /**
     * Gets query for [[EnPartGroups]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnPartGroups()
    {
        return $this->hasMany(PartGroup::class, ['department_id' => 'id']);
    }

    /**
     * Gets query for [[EnPartTypes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnPartTypes()
    {
        return $this->hasMany(PartType::class, ['department_id' => 'id']);
    }

    /**
     * Gets query for [[EnRps]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnRps()
    {
        return $this->hasMany(Rp::class, ['department' => 'id']);
    }

    /**
     * Gets query for [[Warehouse]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getWarehouse()
    {
        return $this->hasOne(Warehouse::class, ['id' => 'warehouse_id']);
    }
}
