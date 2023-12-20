<?php

namespace app\modules\ex\models;

use Yii;

/**
 * This is the model class for table "catalog_option".
 *
 * @property int $id
 * @property string|null $name
 *
 * @property OptionValue[] $optionValues
 */
class CatalogOption extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'catalog_option';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 128],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
        ];
    }

    /**
     * Gets query for [[OptionValues]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOptionValues()
    {
        return $this->hasMany(OptionValue::class, ['catalog_option_id' => 'id']);
    }
}
