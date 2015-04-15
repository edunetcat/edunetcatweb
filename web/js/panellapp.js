 'use strict';

/**
*   Fitxer principal de l'aplicació Angular.js. Aquí es defineix 
*   l'aplicació "panellApp" i les rutes de tota la SPA (single page aplication). 
*   
*   @author: Biel <bielbcm@gmail.com>
* 
**/

var panellApp = angular.module('panellApp', [
    'ngRoute', 'panellAppControllers'
]);


/**
*   Aquí estan definides les rutes de la SPA. Per cada regla, es defineix el 
*   template html i el controller encarregat de gestionar la página. 
*
*   @author: Biel <bielbcm@gmail.com>
*/
panellApp.config(['$routeProvider',
    function($routeProvider) {
        $routeProvider
        .when('/panell', {
            templateUrl: 'views/panell.html',
            controller: 'panellCtrl'
        })
        .when('/centres', {
            templateUrl: 'views/centres.html',
            controller: 'CentresListCtrl'
        })
        .otherwise({
            redirectTo: '/panell'
        });
    }]);



/**
*   TODO: solucionar .metisMenu();
*
*   @author: Biel <bielbcm@gmail.com>
*/
$(function() {
    $('#side-menu').metisMenu();
});


/**
*   Carrega la sidebar on window load. Alhora, fa collapse 
*   del menu quan es cambia el tamany de la finestra. 
*
*   @author: Biel <bielbcm@gmail.com>
*/
$(function() {
    $(window).bind("load resize", function() {
        var topOffset = 50;
        var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    /*
    var url = window.location;
    var element = $('ul.nav a').filter(function() {
        return this.href == url || url.href.indexOf(this.href) == 0;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }*/
});
