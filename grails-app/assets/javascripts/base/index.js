(function(){
    var app = angular.module('sigiApp', ['google-maps']);

    app.controller('MapaCtrl', ['$scope', '$http', '$filter', function($scope, $http, $filter){
        $scope.map = {
            center: {
                latitude: 6.2036524,
                longitude: -75.5714303
            },
            zoom: 14
        };

        $scope.temperaturas = [];
        $scope.lluvias = [];
        $scope.contaminaciones = [];

        $scope.circles = [
            {
                id: 1,
                center: {
                    latitude: 6.2,
                    longitude: -75.57
                },
                radius: 500,
                stroke: {
                    color: '#08B21F',
                    weight: 2,
                    opacity: 1
                },
                fill: {
                    color: '#08B21F',
                    opacity: 0.5
                },
                geodesic: true, // optional: defaults to false
                draggable: true, // optional: defaults to false
                clickable: true, // optional: defaults to true
                editable: true, // optional: defaults to false
                visible: true // optional: defaults to true
            }
        ];

        $http.get('climas.json?lat=6&lon=-75').success(function(data){
            $scope.climas = data;

            $scope.temperaturas = [];
            $scope.lluvias = [];
            $scope.contaminaciones = [];

            $.each($scope.climas, function(key, clima){
                if(clima.tipo == "TEMPERATURA"){
                    var temperatura = {
                        centro: {
                            latitude: clima.latitud,
                            longitude: clima.longitud
                        },
                        intensidad: (parseInt(clima.valor / 33.333) + 1) * 100000,
                        stroke: {
                            color: '#08B21F',
                            weight: 2,
                            opacity: 1
                        },
                        fill: {
                            color: '#08B21F',
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
                else if(clima.tipo == "LLUVIA"){
                    var lluvia = {
                        centro: {
                            latitude: clima.latitud,
                            longitude: clima.longitud
                        },
                        intensidad: (parseInt(clima.valor / 33.333) + 1) * 100000,
                        stroke: {
                            color: '#08B21F',
                            weight: 2,
                            opacity: 1
                        },
                        fill: {
                            color: '#08B21F',
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
                else if(clima.tipo == "CONTAMINACION"){
                    var contaminacion = {
                        centro: {
                            latitude: clima.latitud,
                            longitude: clima.longitud
                        },
                        intensidad: (parseInt(clima.valor / 33.333) + 1) * 100000,
                        stroke: {
                            color: '#08B21F',
                            weight: 2,
                            opacity: 1
                        },
                        fill: {
                            color: '#08B21F',
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


