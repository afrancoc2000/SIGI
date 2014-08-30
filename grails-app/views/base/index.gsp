<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6" ng-app="sigiApp"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7" ng-app="sigiApp"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8" ng-app="sigiApp"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9" ng-app="sigiApp"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js" ng-app="sigiApp"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">
        <title>SIGI</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
        <link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
        <link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">

        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.19/angular.min.js"></script>
        <asset:javascript src="application.js"/>

        <link rel="stylesheet" type="text/css" href="http://js.arcgis.com/3.10/js/esri/css/esri.css">
    <style>
    html, body, #map {
        height:100%;
        width:100%;
        margin:0;
        padding:0;
    }
    .dojoxColorPicker {
        position: absolute;
        top: 15px;
        right: 15px;
        -moz-box-shadow: 0 0 7px #888;
        -webkit-box-shadow: 0 0 7px #888;
        box-shadow: 0 0 7px #888;
    }
    </style>
    <script src="http://js.arcgis.com/3.10/"></script>
    <script>
        var map;

        require([
            "esri/map", "esri/geometry/Point",
            "esri/symbols/SimpleMarkerSymbol", "esri/graphic",
            "dojo/_base/array", "dojo/dom-style", "dojox/widget/ColorPicker",
            "dojo/domReady!"
        ], function(
                Map, Point,
                SimpleMarkerSymbol, Graphic,
                arrayUtils, domStyle, ColorPicker
                ) {

            var xpos = -75.590556;
            var ypos = 6.230833;

            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(showPosition);
            } else {
                alert("Geolocation is not supported by this browser.");
            }

            function showPosition(position) {
                xpos = position.coords.latitude;
                ypos = position.coords.longitude;
            }

            map = new Map("map",{
                basemap: "streets",
                center: [xpos, ypos],
                zoom: 14,
                minZoom: 2
            });

            map.on("load", mapLoaded);

            function mapLoaded(){
                var points = [[-75.590556, 6.230833],[-75.5769733, 6.2355791],[-75.593367, 6.2404852]];
                var iconPath = "M25.371,7.306c-0.092-3.924-3.301-7.077-7.248-7.079c-2.638,0.001-4.942,1.412-6.208,3.517c-0.595-0.327-1.28-0.517-2.01-0.517C7.626,3.229,5.772,5.033,5.689,7.293c-2.393,0.786-4.125,3.025-4.127,5.686c0,3.312,2.687,6,6,6v-0.002h15.874c3.312,0,6-2.688,6-6C29.434,10.34,27.732,8.11,25.371,7.306zM23.436,16.979H7.561c-2.209-0.006-3.997-1.792-4.001-4.001c-0.002-1.982,1.45-3.618,3.35-3.931c0.265-0.043,0.502-0.191,0.657-0.414C7.722,8.41,7.779,8.136,7.73,7.87C7.702,7.722,7.685,7.582,7.685,7.446C7.689,6.221,8.68,5.23,9.905,5.228c0.647,0,1.217,0.278,1.633,0.731c0.233,0.257,0.587,0.375,0.927,0.309c0.342-0.066,0.626-0.307,0.748-0.63c0.749-1.992,2.662-3.412,4.911-3.41c2.899,0.004,5.244,2.35,5.251,5.249c0,0.161-0.009,0.326-0.027,0.497c-0.049,0.517,0.305,0.984,0.815,1.079c1.86,0.344,3.274,1.966,3.271,3.923C27.43,15.186,25.645,16.973,23.436,16.979zM9.029,26.682c0-1.115,0.021-5.425,0.021-5.432c0.002-0.409-0.247-0.779-0.628-0.932c-0.38-0.152-0.815-0.059-1.099,0.24c-0.006,0.008-1.037,1.098-2.081,2.342c-0.523,0.627-1.048,1.287-1.463,1.896c-0.399,0.648-0.753,1.066-0.811,1.885C2.971,28.355,4.324,29.711,6,29.714C7.672,29.71,9.029,28.354,9.029,26.682zM4.971,26.727c0.091-0.349,1.081-1.719,1.993-2.764c0.025-0.029,0.051-0.061,0.076-0.089c-0.005,1.124-0.01,2.294-0.01,2.808c0,0.567-0.461,1.028-1.029,1.03C5.447,27.71,4.997,27.273,4.971,26.727zM16.425,26.682c0-1.115,0.021-5.424,0.021-5.43c0.002-0.41-0.247-0.779-0.628-0.934c-0.381-0.152-0.814-0.058-1.1,0.242c-0.006,0.008-1.035,1.094-2.08,2.342c-0.522,0.623-1.047,1.285-1.463,1.894c-0.399,0.649-0.753,1.068-0.809,1.888c0,1.672,1.354,3.028,3.029,3.028C15.068,29.711,16.425,28.354,16.425,26.682zM12.365,26.729c0.092-0.349,1.081-1.72,1.993-2.765c0.025-0.03,0.05-0.06,0.075-0.089c-0.005,1.123-0.011,2.294-0.011,2.807c-0.002,0.568-0.461,1.027-1.028,1.029C12.84,27.709,12.392,27.273,12.365,26.729zM23.271,20.317c-0.38-0.153-0.816-0.06-1.099,0.24c-0.009,0.008-1.037,1.097-2.08,2.342c-0.523,0.625-1.049,1.285-1.462,1.896c-0.402,0.649-0.754,1.067-0.812,1.886c0,1.672,1.354,3.029,3.03,3.029c1.673,0,3.027-1.357,3.027-3.029c0-1.115,0.022-5.425,0.022-5.431C23.9,20.84,23.651,20.47,23.271,20.317zM21.879,26.681c-0.004,0.568-0.463,1.027-1.031,1.029c-0.553-0.002-1.002-0.438-1.028-0.982c0.092-0.349,1.081-1.72,1.993-2.765c0.025-0.028,0.05-0.059,0.074-0.088C21.883,24.998,21.879,26.167,21.879,26.681z";
                var initColor = "#0000FF";
                arrayUtils.forEach(points, function(point) {
                    var graphic = new Graphic(new Point(point), createSymbol(iconPath, initColor));
                    map.graphics.add(graphic);
                });

                var colorPicker = new ColorPicker({}, "picker1");
                colorPicker.setColor(initColor);
                domStyle.set(colorPicker, "left", "500px")
                colorPicker.on("change", function(){
                    var colorCode = this.hexCode.value;
                    map.graphics.graphics.forEach(function(graphic){
                        graphic.setSymbol(createSymbol(iconPath, colorCode));
                    });
                });
            };

            function createSymbol(path, color){
                var markerSymbol = new esri.symbol.SimpleMarkerSymbol();
                markerSymbol.setPath(path);
                markerSymbol.setColor(new dojo.Color(color));
                markerSymbol.setOutline(null);
                return markerSymbol;
            };
        });
    </script>

    </head>
    <body>
        <div id="map" class="map" ng-controller="MapaCtrl">
            <div id="HomeButton"></div>
            <div ng-repeat="clima in climas">
                <div my-clima-div ng-attr-posX="{{clima.posX}}" ng-attr-posY="{{clima.posY}}" ng-attr-tipo="{{clima.tipo}}"></div>
            </div>
        </div>
    </body>
</html>
