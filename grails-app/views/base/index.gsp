<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1,user-scalable=no">
        <title>SIGI</title>
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
                <div myClimaDiv ng-attr-posX="clima.posX" ng-attr-posY="clima.posY" ng-attr-tipo="clima.tipo"></div>
            </div>
        </div>
    </body>
</html>
