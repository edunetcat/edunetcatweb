<?php
	use yii\helpers\Html;
	use yii\widgets\LinkPager;
	use yii\helpers\Json;
?>

<h1>Assignatures</h1>
<ul>
<h3> json_encode($assignatures);</h3>
    <pre>
    <?php  
    print_r($assignatures);
    
    echo json_encode($assignatures);
    
        //Html::encode("{$assignatura->nomAssignatura} ({$assignatura->id})")
     
        // $assignatura->idCentre 
?>
</pre>
<h3> Json::encode($assignatures);</h3>
<pre>
<?php 
    echo Json::encode($assignatures);
        
    ?>
    </pre>
<?php //endforeach; ?>
</ul>

