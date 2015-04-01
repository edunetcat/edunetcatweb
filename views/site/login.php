<?php
use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
       
    <div class="login-panel panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Benvingut a Edunet.cat</h3>
        </div>
        <div class="panel-body">
            <?php $form = ActiveForm::begin([
                    'id' => 'login-form',
                ]); ?>
                
                <fieldset>
                    <div class="form-group">
                        <input id="loginform-username" class="form-control" name="LoginForm[username]" placeholder="E-mail"  autofocus>
                    </div>
                    <div class="form-group">
                        <input id="loginform-password" class="form-control" name="LoginForm[password]" placeholder="Password" name="password" type="password" value="">
                    </div>
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="loginform-rememberme" name="LoginForm[rememberMe]" value="1" checked="">Recordar-me
                        </label>
                    </div>
                    <?= Html::submitButton('Login', ['class' => 'btn btn-lg btn-success btn-block', 'name' => 'login-button']) ?>
                </fieldset>

            <?php ActiveForm::end(); ?>            
        </div>
    </div>
        
