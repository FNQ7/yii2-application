<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\db\ActiveRecord;
?>
<h2>Тестовое задание</h2>
<?php $form = ActiveForm::begin(); ?>
<?= $form->field($model, 'email')->input('email', ['placeholder' => 'Ваш Email']) ?><br>
<?= $form->field($model, 'phone')->textInput(['placeholder' => '+7-900-900-90-90']) ?><br>
<?= Html::submitButton('Отправить данные', ['class' => 'btn btn-success w-100 p-2']) ?>
<?php ActiveForm::end(); ?>
