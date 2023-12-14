<?php

namespace app\modules\nfc\models;

use Yii;

/**
 * This is the model class for table "en_part".
 *
 * @property int $id
 * @property string|null $photo รูปภาพ
 * @property string|null $code รหัส
 * @property string|null $name ชื่อ
 * @property string|null $name_en ชื่อภาษาอังกฤษ
 * @property string|null $old_code รหัสเก่า
 * @property string|null $description
 * @property int $en_part_doc_id รหัสเอกสาร
 * @property int|null $en_part_group_id รหัสกลุ่ม
 * @property int|null $en_part_type_id รหัสประเภท
 * @property int|null $unit_lg หน่วยนับใหญ่
 * @property int|null $unit_sm หน่วยนับเล็ก
 * @property string|null $serial_no ซีเรียวนัมเบอร์
 * @property string|null $price
 * @property int|null $cost ราคา
 * @property int|null $status สถานะ
 * @property string|null $last_date วันที่ล่าสุด
 * @property string|null $remask
 * @property int|null $imported
 *
 * @property EnPartDoc $enPartDoc
 * @property EnPartGroup $enPartGroup
 * @property EnPartType $enPartType
 * @property EnUnit $unitLg
 * @property EnUnit $unitSm
 */
class Part extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_part';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['photo', 'description', 'remask'], 'string'],
            [['en_part_doc_id'], 'required'],
            [['en_part_doc_id', 'en_part_group_id', 'en_part_type_id', 'unit_lg', 'unit_sm', 'cost', 'status', 'imported'], 'integer'],
            [['last_date'], 'safe'],
            [['code', 'old_code', 'serial_no', 'price'], 'string', 'max' => 45],
            [['name', 'name_en'], 'string', 'max' => 255],
            [['en_part_doc_id'], 'exist', 'skipOnError' => true, 'targetClass' => EnPartDoc::class, 'targetAttribute' => ['en_part_doc_id' => 'id']],
            [['en_part_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => EnPartGroup::class, 'targetAttribute' => ['en_part_group_id' => 'id']],
            [['en_part_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => EnPartType::class, 'targetAttribute' => ['en_part_type_id' => 'id']],
            [['unit_lg'], 'exist', 'skipOnError' => true, 'targetClass' => EnUnit::class, 'targetAttribute' => ['unit_lg' => 'id']],
            [['unit_sm'], 'exist', 'skipOnError' => true, 'targetClass' => EnUnit::class, 'targetAttribute' => ['unit_sm' => 'id']],
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
            'code' => Yii::t('app', 'รหัส'),
            'name' => Yii::t('app', 'ชื่อ'),
            'name_en' => Yii::t('app', 'ชื่อภาษาอังกฤษ'),
            'old_code' => Yii::t('app', 'รหัสเก่า'),
            'description' => Yii::t('app', 'Description'),
            'en_part_doc_id' => Yii::t('app', 'รหัสเอกสาร'),
            'en_part_group_id' => Yii::t('app', 'รหัสกลุ่ม'),
            'en_part_type_id' => Yii::t('app', 'รหัสประเภท'),
            'unit_lg' => Yii::t('app', 'หน่วยนับใหญ่'),
            'unit_sm' => Yii::t('app', 'หน่วยนับเล็ก'),
            'serial_no' => Yii::t('app', 'ซีเรียวนัมเบอร์'),
            'price' => Yii::t('app', 'Price'),
            'cost' => Yii::t('app', 'ราคา'),
            'status' => Yii::t('app', 'สถานะ'),
            'last_date' => Yii::t('app', 'วันที่ล่าสุด'),
            'remask' => Yii::t('app', 'Remask'),
            'imported' => Yii::t('app', 'Imported'),
        ];
    }

    /**
     * Gets query for [[EnPartDoc]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnPartDoc()
    {
        return $this->hasOne(EnPartDoc::class, ['id' => 'en_part_doc_id']);
    }

    /**
     * Gets query for [[EnPartGroup]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnPartGroup()
    {
        return $this->hasOne(EnPartGroup::class, ['id' => 'en_part_group_id']);
    }

    /**
     * Gets query for [[EnPartType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnPartType()
    {
        return $this->hasOne(EnPartType::class, ['id' => 'en_part_type_id']);
    }

    /**
     * Gets query for [[UnitLg]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUnitLg()
    {
        return $this->hasOne(EnUnit::class, ['id' => 'unit_lg']);
    }

    /**
     * Gets query for [[UnitSm]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUnitSm()
    {
        return $this->hasOne(EnUnit::class, ['id' => 'unit_sm']);
    }
}
