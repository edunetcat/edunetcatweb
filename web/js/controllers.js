'user strict';

/**
*   Per facilitar el desenvolupament, s'han definit tots els controllers de la 
*	SPA (Single page aplication) en un mateix fitxer. 
*   
*   @author: Biel <bielbcm@gmail.com>
**/

// crea modul per a utilitzar-lo des d'altres fitxers. Es un requisit d'Angular. 
var panellAppControllers = angular.module('panellAppControllers', []);


/**
*   Controller que gestiona la plana /panell 
*   
*   @author: Biel <bielbcm@gmail.com>
**/
panellAppControllers.controller('panellCtrl', ['$scope',
	function($scope) {

	}]);


/**
*   Controller que gestiona la plana /centres 
*   
*   @author: Biel <bielbcm@gmail.com>
**/
panellAppControllers.controller('CentresListCtrl', ['$scope', '$http', 
	function($scope, $http) {

		//TODO: fer que carregui conecti a l'API
		//carrega dades de l'API
		$http.get('js/todelete.json').success(function(data) {
			$scope.centres = data;		
		});

		// propietat utilitzada per definir l'ordre de visualització
		$scope.orderProp = 'name';

	}]);