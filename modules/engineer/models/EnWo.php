<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_wo".
 *
 * @property int $workorder_id
 * @property string|null $work_code เลขที่ใบสั่งซ่อม
 * @property int|null $list_id ราการซ่อม
 * @property string|null $work_date วันที่
 * @property int|null $machine เครื่องจักร
 * @property string|null $work_start
 * @property string|null $work_end
 * @property int|null $work_type_id ประเภทงาน
 * @property int|null $category_id ประเภทการส่งซ่อม
 * @property string|null $ref อ้างอิง
 * @property string|null $work_detail รายละเอียดงาน
 * @property string|null $work_method วิธีการ
 * @property string|null $service_date วันที่บริการ
 * @property int|null $frequency ความถี่
 * @property string|null $remask
 * @property int|null $lock_out ระบบล็อค
 * @property int|null $tag_out ป้ายทะเบียน
 * @property int|null $checker ผู้ตรวจสอบก่อนซ่อม
 * @property int|null $recheck_electric ตรวจไฟฟ้าหลังซ่อม
 * @property int|null $recheck_mechanics ตรวจเครื่องกลหลังซ่อม
 * @property int|null $rechecker ผู้ตรวจสอบหลังซ่อม
 *
 * @property EnCategory $category
 * @property EnTechnician $checker0
 * @property EnWoList[] $enWoLists
 * @property EnTechnician $rechecker0
 * @property EnType $workType
 */
class EnWo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_wo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['list_id', 'machine', 'work_type_id', 'category_id', 'frequency', 'lock_out', 'tag_out', 'checker', 'recheck_electric', 'recheck_mechanics', 'rechecker'], 'integer'],
            [['work_date', 'work_start', 'work_end', 'service_date'], 'safe'],
            [['ref', 'work_detail', 'work_method', 'remask'], 'string'],
            [['work_code'], 'string', 'max' => 45],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => EnCategory::class, 'targetAttribute' => ['category_id' => 'category_id']],
            [['rechecker'], 'exist', 'skipOnError' => true, 'targetClass' => EnTechnician::class, 'targetAttribute' => ['rechecker' => 'technician_id']],
            [['checker'], 'exist', 'skipOnError' => true, 'targetClass' => EnTechnician::class, 'targetAttribute' => ['checker' => 'technician_id']],
            [['work_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => EnType::class, 'targetAttribute' => ['work_type_id' => 'type_id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'workorder_id' => Yii::t('app', 'Workorder ID'),
            'work_code' => Yii::t('app', 'เลขที่ใบสั่งซ่อม'),
            'list_id' => Yii::t('app', 'ราการซ่อม'),
            'work_date' => Yii::t('app', 'วันที่'),
            'machine' => Yii::t('app', 'เครื่องจักร'),
            'work_start' => Yii::t('app', 'Work Start'),
            'work_end' => Yii::t('app', 'Work End'),
            'work_type_id' => Yii::t('app', 'ประเภทงาน'),
            'category_id' => Yii::t('app', 'ประเภทการส่งซ่อม'),
            'ref' => Yii::t('app', 'อ้างอิง'),
            'work_detail' => Yii::t('app', 'รายละเอียดงาน'),
            'work_method' => Yii::t('app', 'วิธีการ'),
            'service_date' => Yii::t('app', 'วันที่บริการ'),
            'frequency' => Yii::t('app', 'ความถี่'),
            'remask' => Yii::t('app', 'Remask'),
            'lock_out' => Yii::t('app', 'ระบบล็อค'),
            'tag_out' => Yii::t('app', 'ป้ายทะเบียน'),
            'checker' => Yii::t('app', 'ผู้ตรวจสอบก่อนซ่อม'),
            'recheck_electric' => Yii::t('app', 'ตรวจไฟฟ้าหลังซ่อม'),
            'recheck_mechanics' => Yii::t('app', 'ตรวจเครื่องกลหลังซ่อม'),
            'rechecker' => Yii::t('app', 'ผู้ตรวจสอบหลังซ่อม'),
        ];
    }

    /**
     * Gets query for [[Category]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCategory0()
    {
        return $this->hasOne(EnCategory::class, ['category_id' => 'category_id']);
    }

    /**
     * Gets query for [[Checker0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getChecker0()
    {
        return $this->hasOne(EnTechnician::class, ['technician_id' => 'checker']);
    }

    /**
     * Gets query for [[EnWoLists]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getList0()
    {
        return $this->hasMany(EnWoList::class, ['workorder_id' => 'workorder_id']);
    }

    /**
     * Gets query for [[Rechecker0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRechecker0()
    {
        return $this->hasOne(EnTechnician::class, ['technician_id' => 'rechecker']);
    }

    /**
     * Gets query for [[WorkType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getType0()
    {
        return $this->hasOne(EnType::class, ['type_id' => 'work_type_id']);
    }
}
