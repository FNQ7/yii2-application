<?php

namespace frontend\models;

use yii\db\ActiveRecord;

class TestForm extends ActiveRecord
{
    public static function tableName()
    {
        return 'userContact';
    }
    public function attributeLabels()
    {
        return [
            'email' => '*Email',
            'phone' => '*Телефон',
        ];
    }

    public function rules()
    {
        return [
            [['email', 'phone'], 'required', 'message' => 'Поле не заполнено!'],
            ['email', 'email'],
            ['phone', 'string', 'max' => 12],
            ['phone', 'match', 'pattern' => '/^[+](7)(\d{3})(\d{3})(\d{2})(\d{2})/', 'message' => ' Что-то не так' ],
        ];
    }
}