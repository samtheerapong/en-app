<?php

namespace app\modules\nfc\models;

use Yii;

/**
 * This is the model class for table "departments".
 *
 * @property int $id
 * @property string|null $code รหัส
 * @property string|null $name ชื่อแผนก
 * @property string|null $detail รายละเอียด
 * @property int|null $department_head หัวหน้าแผนก
 * @property string|null $color สี
 */
class Departments extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'departments';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['detail'], 'string'],
            [['department_head'], 'integer'],
            [['code', 'name', 'color'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'Code'),
            'name' => Yii::t('app', 'Name'),
            'detail' => Yii::t('app', 'Detail'),
            'department_head' => Yii::t('app', 'Department Head'),
            'color' => Yii::t('app', 'Color'),
        ];
    }
}
