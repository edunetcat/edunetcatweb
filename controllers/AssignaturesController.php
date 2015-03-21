<?php

	namespace app\controllers;

	use yii\web\Controller;
	use yii\data\Pagination;
	use app\models\Assignatures;

	class AssignaturesController extends Controller {

		public function actionIndex() {
			$query = Assignatures::find();

			$pagination = new Pagination([
				'defaultPageSize' => 2,
				'totalCount' => $query->count(),
			]);

			$assignatures = $query->orderBy('nomAssignatura')
				->offset($pagination->offset)
				->limit($pagination->limit)
				->all();

			return $this->render('index', [
				'assignatures' => $assignatures,
				'pagination' => $pagination,
			]);
		}

	}

?>