<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "userContact".
 *
 * @property int $id
 * @property string $email
 * @property string $phone
 */
class UserContact extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'userContact';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['email', 'phone'], 'required'],
            [['email', 'phone'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'email' => 'Email',
            'phone' => 'Phone',
        ];
    }
}
