<?php

namespace app\modules\engineer\models;

use Yii;

/**
 * This is the model class for table "en_team".
 *
 * @property int $team_id
 * @property string|null $team_name
 * @property string|null $technician1
 * @property string|null $technician2
 * @property string|null $technician3
 * @property string|null $technician4
 * @property string|null $technician5
 */
class EnTeam extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'en_team';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['team_name', 'technician1', 'technician2', 'technician3', 'technician4', 'technician5'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'team_id' => Yii::t('app', 'Team ID'),
            'team_name' => Yii::t('app', 'Team Name'),
            'technician1' => Yii::t('app', 'Technician1'),
            'technician2' => Yii::t('app', 'Technician2'),
            'technician3' => Yii::t('app', 'Technician3'),
            'technician4' => Yii::t('app', 'Technician4'),
            'technician5' => Yii::t('app', 'Technician5'),
        ];
    }
}
