<?php

namespace app\controllers;

use Yii;
use yii\filters\AccessControl;
use yii\web\Controller;
use yii\filters\VerbFilter;
use app\models\LoginForm;
use app\models\ContactForm;

class PersonaController extends Controller
{
    
    public function actionPersones() 
    {
        $model = new Assignatures();

        return $this->render('persones', [
            'model' => $model,
        ]);
    }
    public function actionPersonesPerId($id)
    {
    	$command = (new \yii\db\Query())
    	->select('nom,cognoms')
    	->from('persona')
    	->where('id=:id')
    	->addParams([':id' =>$id])
    	->createCommand();
    	$persones= $command->queryAll(); 
  		
  		return $persones;
   
}
