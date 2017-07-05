carmenApp.config(function ($stateProvider, $urlRouterProvider) {

  $urlRouterProvider.otherwise("/");

  $stateProvider

    .state('inicio', {
      url: "/",
      templateUrl: "partials/menuDeAcciones.html",  // El nombre del partial de la pagina principal seria "menuDeAcciones.html"
      controller: "MenuCtrl as menu"      // El controllador del partial de la pagina principal se llamaría "menuController.js"
    })
/*
    .state('mapamundi', {
      url: "/paises",
      templateUrl: "partials/mapamundi.html",       // El nombre del partial de mapamundi sería "mapamundi.html"
      controller: "MapamundiController as mapaCtrl" // El nombre del controller de "mapamundi.html" sería "mapamundiController"
    })

    .state('expedientes', {
      url: "/villanos",
      templateUrl: "partials/expediente.html",       // El nombre del partial de expediente sería "expediente.html"
      controller: "ExpedienteController as expCtrl" // El nombre del controller de "expediente.html" se llamaría "expedienteController"
    })
*/
    .state('resolviendoMisterio', {
      url: "/iniciarJuego",   // Esta parte no estoy muy segura en la url...
      templateUrl: "partials/resolviendoCaso.html", // El nombre del partial de resolviendo misterio sería "resolviendoCaso.html"
      controller: "ResolviendoController as docCtrl" // El nombre del controller de "resolviendoCaso.html" se llamaría ResolviendoController
    })

//     .state('logeado',{
//     url: '/logeado',
//     views: {
//      'mainPanel': {
//        templateUrl: "partials/busquedaCalificacion.html",
//        controller: "BusquedaCalificacionController as busqCalificacionCtrl"
//      },
//     'loginPanel': {
//        templateUrl: "partials/logueado.html",
//        controller: "LogueadoController as logueadoCtrl"
//      }
//    }
//  }
//  )

     .state('admExpedientes',{
     url: '/villanos',
     templateUrl: "partials/villano-exdiente.html",
     controller: "ExpedienteController as expediente"
     }
     )

     .state('admMapamundi',{
     url: '/paises',
     templateUrl: "partials/pais-paises.html",
     controller: "MapamundiController as mapa"
     }
     )

});