<?php

namespace app\modules\engineer\models;

use app\modules\nfc\models\Location;
use Yii;

/**
 * This is the model class for table "en_rp_list".
 *
 * @property int $id
 * @property int|null $request_id ใบแจ้งซ่อม
 * @property string|null $detail_list รายการ
 * @property string|null $request_date วันที่ต้องการ
 * @property string|null $broken_date วันที่เสีย
 * @property int|null $amount จำนวน
 * @property int|null $location สถานที่
 * @property string|null $image รูปภาพ
 * @property string|null $remask หมายเหตุ
 *
 * @property Location $location0
 * @property Rp $request
 */
class RpList extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_rp_list';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['request_id', 'amount', 'location'], 'integer'],
            [['request_date', 'broken_date'], 'safe'],
            [['image', 'remask'], 'string'],
            [['detail_list'], 'string', 'max' => 255],
            [['location'], 'exist', 'skipOnError' => true, 'targetClass' => Location::class, 'targetAttribute' => ['location' => 'id']],
            [['request_id'], 'exist', 'skipOnError' => true, 'targetClass' => Rp::class, 'targetAttribute' => ['request_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'request_id' => Yii::t('app', 'ใบแจ้งซ่อม'),
            'detail_list' => Yii::t('app', 'รายการ'),
            'request_date' => Yii::t('app', 'วันที่ต้องการ'),
            'broken_date' => Yii::t('app', 'วันที่เสีย'),
            'amount' => Yii::t('app', 'จำนวน'),
            'location' => Yii::t('app', 'สถานที่'),
            'image' => Yii::t('app', 'รูปภาพ'),
            'remask' => Yii::t('app', 'หมายเหตุ'),
        ];
    }

    /**
     * Gets query for [[Location0]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getLocation0()
    {
        return $this->hasOne(Location::class, ['id' => 'location']);
    }

    /**
     * Gets query for [[Request]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getRequest()
    {
        return $this->hasOne(Rp::class, ['id' => 'request_id']);
    }
}
