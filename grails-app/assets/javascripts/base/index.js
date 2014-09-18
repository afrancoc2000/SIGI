(function(){
    var app = angular.module('sigiApp', ['google-maps']);

    app.controller('MapaCtrl', ['$scope', '$http', '$window', '$interval', function($scope, $http, $window, $interval){

        $('.angular-google-map-container').css('height', $window.innerHeight - 16);

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else {
            alert("Este navegador no usa geolocalización");
        }

        function showPosition(position) {
            var centroMapa = {
                latitude: position.coords.latitude,
                longitude: position.coords.longitude
            }
            $scope.map.center = centroMapa;
        }

        $scope.map = {
            center: {
                latitude: 6.2,
                longitude: -75
            },
            zoom: 14
        };

        $scope.temperaturas = [];
        $scope.lluvias = [];
        $scope.contaminaciones = [];

        $scope.traerClimas = function(){
            $http.get('climas.json?lat=6&lon=-75').success(function (data) {
                $scope.climas = data;

                $scope.temperaturas = [];
                $scope.lluvias = [];
                $scope.contaminaciones = [];

                $.each($scope.climas, function (key, clima) {
                    if (clima.tipo == "TEMPERATURA") {
                        var temperatura = {
                            centro: {
                                latitude: clima.latitud,
                                longitude: clima.longitud
                            },
                            intensidad: (parseInt(clima.valor / 33.333) + 1) * 100,
                            stroke: {
                                color: '#FF8000',
                                weight: 2,
                                opacity: 1
                            },
                            fill: {
                                color: '#FF8000',
                                opacity: 0.5
                            },
                            geodesic: true, // optional: defaults to false
                            draggable: false, // optional: defaults to false
                            clickable: false, // optional: defaults to true
                            editable: false, // optional: defaults to false
                            visible: true // optional: defaults to true
                        };
                        $scope.temperaturas.push(temperatura);
                    }
                    else if (clima.tipo == "LLUVIA") {
                        var lluvia = {
                            centro: {
                                latitude: clima.latitud,
                                longitude: clima.longitud
                            },
                            intensidad: (parseInt(clima.valor / 33.333) + 1) * 100,
                            stroke: {
                                color: '#2E64FE',
                                weight: 2,
                                opacity: 1
                            },
                            fill: {
                                color: '#2E64FE',
                                opacity: 0.5
                            },
                            geodesic: true, // optional: defaults to false
                            draggable: false, // optional: defaults to false
                            clickable: false, // optional: defaults to true
                            editable: false, // optional: defaults to false
                            visible: true // optional: defaults to true
                        };
                        $scope.lluvias.push(lluvia);
                    }
                    else if (clima.tipo == "CONTAMINACION") {
                        var contaminacion = {
                            centro: {
                                latitude: clima.latitud,
                                longitude: clima.longitud
                            },
                            intensidad: (parseInt(clima.valor / 33.333) + 1) * 100,
                            stroke: {
                                color: '#6E6E6E',
                                weight: 2,
                                opacity: 1
                            },
                            fill: {
                                color: '#6E6E6E',
                                opacity: 0.5
                            },
                            geodesic: true, // optional: defaults to false
                            draggable: false, // optional: defaults to false
                            clickable: false, // optional: defaults to true
                            editable: false, // optional: defaults to false
                            visible: true // optional: defaults to true
                        };
                        $scope.contaminaciones.push(contaminacion);
                    }
                });
            });
        };


        var correr;

        correr = $interval(function(){
            $scope.traerClimas();
        }, 5000);

        $scope.$on('$destroy', function() {
            if (angular.isDefined(correr)) {
                $interval.cancel(correr);
                correr = undefined;
            }
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


