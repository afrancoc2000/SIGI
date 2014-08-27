// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require_tree .
//= require_self

if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}


(function(){
	var app = angular.module('sigiApp', []);

	app.controller('MapaCtrl', ['$scope', '$http', '$filter', function($scope, $http, $filter){
		$scope.climas = [];

		$http.get('climas.json').success(function(data){
			$scope.climas = data;
		});
		
	}]);
	
	app.directive('myClimaDiv', ['$window', function($window){
	    return function (scope, element, attrs) {
	            var posX = attrs.posX;
	            var posY = attrs.posY;
	            var tipo = attrs.tipo;
	            
	            var imagen = "";
	            if (tipo == "LLUVIA"){
	            	imagen = "";
	            }
	            else if (tipo == "CONTAMINACION"){
	            	imagen = "";
	            }
	            
	            element.css({
	            	position: absolute;
	            	left: posX + 'px';
	    		top: posY + 'px';
	    		background-image = imagen;
	            });
	    };
	}]);

})();


