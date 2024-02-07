<?php

namespace app\models;

use yii\db\ActiveRecord;

class Agreement extends ActiveRecord
{
    public static function tableName()
    {
        return 'Agreement';
    }
    public $cityID;
    public $text;

    public function attributeLabels()
    {
        return [
            'cityID' => 'city',
            'text' => 'text',
        ];
    }
}