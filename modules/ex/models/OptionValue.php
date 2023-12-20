<?php

namespace app\modules\ex\models;

use Yii;

/**
 * This is the model class for table "option_value".
 *
 * @property int $id
 * @property int $catalog_option_id
 * @property string|null $name
 * @property string|null $sort_order
 * @property int|null $image_id
 * @property int|null $option_valuecol
 *
 * @property CatalogOption $catalogOption
 */
class OptionValue extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'option_value';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['catalog_option_id'], 'required'],
            [['catalog_option_id', 'image_id', 'option_valuecol'], 'integer'],
            [['name'], 'string', 'max' => 128],
            [['sort_order'], 'string', 'max' => 45],
            [['catalog_option_id'], 'exist', 'skipOnError' => true, 'targetClass' => CatalogOption::class, 'targetAttribute' => ['catalog_option_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'catalog_option_id' => Yii::t('app', 'Catalog Option ID'),
            'name' => Yii::t('app', 'Name'),
            'sort_order' => Yii::t('app', 'Sort Order'),
            'image_id' => Yii::t('app', 'Image ID'),
            'option_valuecol' => Yii::t('app', 'Option Valuecol'),
        ];
    }

    /**
     * Gets query for [[CatalogOption]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCatalogOption()
    {
        return $this->hasOne(CatalogOption::class, ['id' => 'catalog_option_id']);
    }
}
