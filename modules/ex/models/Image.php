<?php

namespace app\modules\ex\models;

use Yii;

/**
 * This is the model class for table "image".
 *
 * @property int $id
 * @property string|null $path
 * @property string|null $type
 * @property int|null $size
 * @property string|null $name
 * @property int|null $sort_order
 */
class Image extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'image';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['size', 'sort_order'], 'integer'],
            [['path', 'type', 'name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'path' => Yii::t('app', 'Path'),
            'type' => Yii::t('app', 'Type'),
            'size' => Yii::t('app', 'Size'),
            'name' => Yii::t('app', 'Name'),
            'sort_order' => Yii::t('app', 'Sort Order'),
        ];
    }
}
