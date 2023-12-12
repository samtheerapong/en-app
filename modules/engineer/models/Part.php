<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_part".
 *
 * @property int $id
 * @property string|null $images
 * @property string|null $code
 * @property string|null $name
 * @property string|null $name_en
 * @property string|null $old_code
 * @property string|null $description
 * @property int $en_part_doc_id รหัสเอกสาร
 * @property int|null $en_part_group_id รหัสกลุ่ม
 * @property int|null $en_part_type_id รหัสประเภท
 * @property string|null $serial_no ซีเรียวนัมเบอร์
 * @property string|null $unit หน่วย
 * @property int|null $status
 * @property string|null $cos
 *
 * @property PartDoc $enPartDoc
 * @property PartGroup $enPartGroup
 * @property PartType $enPartType
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
            [['images', 'description'], 'string'],
            [['en_part_doc_id'], 'required'],
            [['en_part_doc_id', 'en_part_group_id', 'en_part_type_id', 'status'], 'integer'],
            [['code', 'old_code', 'serial_no', 'unit', 'cos'], 'string', 'max' => 45],
            [['name', 'name_en'], 'string', 'max' => 255],
            [['en_part_doc_id'], 'exist', 'skipOnError' => true, 'targetClass' => PartDoc::class, 'targetAttribute' => ['en_part_doc_id' => 'id']],
            [['en_part_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => PartGroup::class, 'targetAttribute' => ['en_part_group_id' => 'id']],
            [['en_part_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => PartType::class, 'targetAttribute' => ['en_part_type_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'images' => Yii::t('app', 'Images'),
            'code' => Yii::t('app', 'Code'),
            'name' => Yii::t('app', 'Name'),
            'name_en' => Yii::t('app', 'Name En'),
            'old_code' => Yii::t('app', 'Old Code'),
            'description' => Yii::t('app', 'Description'),
            'en_part_doc_id' => Yii::t('app', 'รหัสเอกสาร'),
            'en_part_group_id' => Yii::t('app', 'รหัสกลุ่ม'),
            'en_part_type_id' => Yii::t('app', 'รหัสประเภท'),
            'serial_no' => Yii::t('app', 'ซีเรียวนัมเบอร์'),
            'unit' => Yii::t('app', 'หน่วย'),
            'status' => Yii::t('app', 'Status'),
            'cos' => Yii::t('app', 'Cos'),
        ];
    }

    /**
     * Gets query for [[EnPartDoc]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnPartDoc()
    {
        return $this->hasOne(PartDoc::class, ['id' => 'en_part_doc_id']);
    }

    /**
     * Gets query for [[EnPartGroup]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnPartGroup()
    {
        return $this->hasOne(PartGroup::class, ['id' => 'en_part_group_id']);
    }

    /**
     * Gets query for [[EnPartType]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnPartType()
    {
        return $this->hasOne(PartType::class, ['id' => 'en_part_type_id']);
    }
}
