<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
$this->title = 'About';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="site-about">
    <h1><?= Html::encode($this->title) ?></h1>

    <p><pre>
    
       <?php 
       
       $assignatures =Yii::$app->db->createCommand('SELECT * FROM `assignatures`')->queryAll();
       print_r($assignatures);
        
       ?>
    </pre>
    </p>

    <code><?= __FILE__ ?></code>
</div>
