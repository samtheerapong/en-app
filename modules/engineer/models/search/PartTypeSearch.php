<?php

namespace app\modules\engineer\models\search;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use app\modules\engineer\models\PartType;

/**
 * PartTypeSearch represents the model behind the search form of `app\modules\engineer\models\PartType`.
 */
class PartTypeSearch extends PartType
{
    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id', 'department_id', 'active'], 'integer'],
            [['code', 'name'], 'safe'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = PartType::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'department_id' => $this->department_id,
            'active' => $this->active,
        ]);

        $query->andFilterWhere(['like', 'code', $this->code])
            ->andFilterWhere(['like', 'name', $this->name]);

        return $dataProvider;
    }
}
