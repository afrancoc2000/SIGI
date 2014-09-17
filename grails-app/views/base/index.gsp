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

        <link rel="stylesheet" type="text/css" href="http://js.arcgis.com/3.10/js/esri/css/esri.css">
        <asset:stylesheet src="base/index.css" />

        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"></script>

        <asset:javascript src="angular.min.js" />
        <script src='//maps.googleapis.com/maps/api/js?sensor=false'></script>
        <asset:javascript src="lodash.underscore.min.js"/>
        <asset:javascript src="angular-google-maps.min.js"/>
        <asset:javascript src="base/index.js" />
    <script>

    </script>

    </head>
    <body>
        <section ng-controller="MapaCtrl">
            <google-map center="map.center" zoom="map.zoom">
                <div id="HomeButton"></div>

                <circle ng-repeat="c in circles track by c.id" center="c.center" stroke="c.stroke" fill="c.fill" radius="c.radius"
                        visible="c.visible" geodesic="c.geodesic" editable="c.editable" draggable="c.draggable" clickable="c.clickable"></circle>

                <circle ng-repeat="temp in temperaturas track by $index" center"temp.centro" radius="temp.intensidad"
                    stroke="temp.stroke" fill="temp.fill" radius="temp.radius" visible="temp.visible"
                    geodesic="temp.geodesic" editable="temp.editable" draggable="temp.draggable" clickable="temp.clickable"></circle>

                <circle ng-repeat="lluvia in lluvias track by $index" center"lluvia.centro" radius="lluvia.intensidad"
            stroke="lluvia.stroke" fill="lluvia.fill" radius="lluvia.radius" visible="lluvia.visible"
            geodesic="lluvia.geodesic" editable="lluvia.editable" draggable="lluvia.draggable" clickable="lluvia.clickable"></circle>

                <circle ng-repeat="cont in contaminaciones track by $index" center"cont.centro" radius="cont.intensidad"
            stroke="cont.stroke" fill="cont.fill" radius="cont.radius" visible="cont.visible"
            geodesic="cont.geodesic" editable="cont.editable" draggable="cont.draggable" clickable="cont.clickable"></circle>

            </google-map>
        </section>
    </body>
</html>
