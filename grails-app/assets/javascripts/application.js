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

		$http.get('climas.json?posX=45&posY=45').success(function(data){
			$scope.climas = data;
		});
		
	}]);
	
	app.directive('myClimaDiv', ['$window', function($window){
	    return function (scope, element, attrs) {
	            var posX = attrs.posx;
	            var posY = attrs.posy;
	            var tipo = attrs.tipo;
	            
	            var imagen = "";
	            if (tipo == "LLUVIA"){
	            	imagen = "nube.png";
	            }
	            else if (tipo == "CONTAMINACION"){
	            	imagen = "";
	            }
                else if (tipo == "TEMPERATURA"){
                    imagen = "";
                }
	            
	            element.css({
	            	position: 'absolute',
	            	left: posX + 'px',
	    		    top: posY + 'px',
                    height: '50px',
                    width: '100px',
	    		    backgroundImage: 'url(../images/' + imagen + ')'
	            });
	    };
	}]);

})();


