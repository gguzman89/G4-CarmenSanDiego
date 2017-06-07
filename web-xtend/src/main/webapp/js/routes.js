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

//    ESTE ES UN EJEMPLO DE COMO SE PUEDE DIVIDIR LA PAGINA DE TAL MANERA QUE DOS PARTE MUESTREN UN CONTENIDO DE PARTIAL DIFERENTE...
//    EN UNA MISMA DIRECCION, COLOCANDOLE ETIQUETAS A LOS DIVS, COMO EN ESTE CASO, CUYAS ETIQUETAS SON "mainPanel" Y "loginPanel". 
//    AUN NO ESTOY SEGURA DE QUE LO NECESITEMOS PERO LO DEJO COMENTADO COMO EJEMPLO.
//
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
     views: {
      'panelHeader': {
        templateUrl: "partials/opciones-logo.html",
        controller: "OpcionesController as opcionesCtrl"
      },
     'panelBody': {
        templateUrl: "partials/expediente.html",
        controller: "ExpedienteController as expCtrl"
      }
    }
  }
  )

     .state('admMapamundi',{
     url: '/paises',
     views: {
      'panelHeader': {
        templateUrl: "partials/opciones-logo.html",
        controller: "OpcionesController as opcionesCtrl"
      },
     'panelBody': {
        templateUrl: "partials/mapamundi.html",
        controller: "MapamundiController as mapaCtrl"
      }
    }
  }
  )


});