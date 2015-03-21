<?php
	use yii\helpers\Html;
	use yii\widgets\LinkPager;
?>

<h1>Assignatures</h1>
<ul>
<?php foreach ($assignatures as $assignatura): ?>
    <li>
        <?= Html::encode("{$assignatura->nomAssignatura} ({$assignatura->id})") ?>:
        <?= $assignatura->idCentre ?>
    </li>
<?php endforeach; ?>
</ul>

<?= LinkPager::widget(['pagination' => $pagination]) ?>