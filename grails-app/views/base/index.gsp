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
                padding:0;
                margin:0;
                height:100%;
            }
            #HomeButton {
                position: absolute;
                top: 95px;
                left: 20px;
                z-index: 50;
            }
        </style>
        <script src="//js.arcgis.com/3.10/"></script>
        <script>

            require([
                "esri/map", 
                "esri/dijit/HomeButton",
                "dojo/domReady!"
                ], function(
                    Map, HomeButton
                    )  {

                    var map = new Map("map", {
                        center: [-75.590556, 6.230833],
                        zoom: 14,
                        basemap: "streets"
                });

                var home = new HomeButton({
                    map: map
                }, "HomeButton");
                  home.startup();

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
