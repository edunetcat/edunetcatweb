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
       $id=2;
      	$command = (new \yii\db\Query())
    	->select('nom,cognoms')
    	->from('persona')
    	->where('id=:id')
    	->addParams([':id' =>$id])
    	->createCommand();
    	$persones= $command->queryAll();
    	//->all();
       //$persones =Yii::$app->db->createCommand('SELECT * FROM `persona` where id='%id)->queryAll();
       print_r($persones);
      
       ?>
    </pre>
    </p>

    <code><?= __FILE__ ?></code>
</div>
where('id=:id1 or id=:id2', array(':id1'=>1, ':id2'=>2))
