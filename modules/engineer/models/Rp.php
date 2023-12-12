<?php

namespace app\modules\engineer\models;

use app\modules\nfc\models\Department;
use Yii;

/**
 * This is the model class for table "en_rp".
 *
 * @property int $id
 * @property string|null $repair_code เลขที่เอกสาร
 * @property int|null $priority ความสำคัญ
 * @property int|null $urgency ความเร่งด่วน
 * @property string|null $created_date วันที่แจ้ง
 * @property int|null $request_by ผู้ร้องขอ
 * @property int|null $department แผนก
 * @property string|null $request_title หัวเรื่อง
 * @property string|null $remask หมายเหตุ
 * @property string|null $created_at จัดทำเมื่อ
 * @property string|null $updated_at ปรับปรุงเมื่อ
 * @property int|null $created_by ผู้จัดทำ
 * @property int|null $updated_by ปรับปรุงโดย
 * @property int|null $en_status_id สถานะ
 *
 * @property Department $department0
 * @property EnRpApprove[] $enRpApproves
 * @property EnRpList[] $enRpLists
 * @property EnStatus $enStatus
 * @property EnWo[] $enWos
 * @property EnPriority $priority0
 * @property EnUrgency $urgency0
 */
class Rp extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_rp';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['priority', 'urgency', 'request_by', 'department', 'created_by', 'updated_by', 'en_status_id'], 'integer'],
            [['created_date', 'created_at', 'updated_at'], 'safe'],
            [['remask'], 'string'],
            [['repair_code'], 'string', 'max' => 45],
            [['request_title'], 'string', 'max' => 255],
            [['department'], 'exist', 'skipOnError' => true, 'targetClass' => Department::class, 'targetAttribute' => ['department' => 'id']],
            [['priority'], 'exist', 'skipOnError' => true, 'targetClass' => Priority::class, 'targetAttribute' => ['priority' => 'id']],
            [['urgency'], 'exist', 'skipOnError' => true, 'targetClass' => Urgency::class, 'targetAttribute' => ['urgency' => 'id']],
            [['en_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => Status::class, 'targetAttribute' => ['en_status_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'repair_code' => Yii::t('app', 'เลขที่เอกสาร'),
            'priority' => Yii::t('app', 'ความสำคัญ'),
            'urgency' => Yii::t('app', 'ความเร่งด่วน'),
            'created_date' => Yii::t('app', 'วันที่แจ้ง'),
            'request_by' => Yii::t('app', 'ผู้ร้องขอ'),
            'department' => Yii::t('app', 'แผนก'),
            'request_title' => Yii::t('app', 'หัวเรื่อง'),
            'remask' => Yii::t('app', 'หมายเหตุ'),
            'created_at' => Yii::t('app', 'จัดทำเมื่อ'),
            'updated_at' => Yii::t('app', 'ปรับปรุงเมื่อ'),
            'created_by' => Yii::t('app', 'ผู้จัดทำ'),
            'updated_by' => Yii::t('app', 'ปรับปรุงโดย'),
            'en_status_id' => Yii::t('app', 'สถานะ'),
        ];
    }

    /**
     * Gets query for [[Department0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getDepartment0()
    {
        return $this->hasOne(Department::class, ['id' => 'department']);
    }

    /**
     * Gets query for [[EnRpApproves]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnRpApproves()
    {
        return $this->hasMany(RpApprove::class, ['wo_id' => 'id']);
    }

    /**
     * Gets query for [[EnRpLists]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnRpLists()
    {
        return $this->hasMany(RpList::class, ['request_id' => 'id']);
    }

    /**
     * Gets query for [[EnStatus]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnStatus()
    {
        return $this->hasOne(Status::class, ['id' => 'en_status_id']);
    }

    /**
     * Gets query for [[EnWos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getEnWos()
    {
        return $this->hasMany(Wo::class, ['rp_id' => 'id']);
    }

    /**
     * Gets query for [[Priority0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPriority0()
    {
        return $this->hasOne(Priority::class, ['id' => 'priority']);
    }

    /**
     * Gets query for [[Urgency0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUrgency0()
    {
        return $this->hasOne(Urgency::class, ['id' => 'urgency']);
    }
}
