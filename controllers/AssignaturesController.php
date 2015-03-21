<?php

namespace app\controllers;

use yii\rest\ActiveController;
use yii\data\Pagination;
use app\models\Assignatures;

class AssignaturesController extends ActiveController {
	public $modelClass = 'app\models\Assignatures'; // no cal fer cap accio, nomes aixo i la resta ho fa el yii
}

?>