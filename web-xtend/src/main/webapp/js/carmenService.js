// Este servicio lo utilizara el controlador de InicarCaso
// Aun no estoy segura si corresponden todos...

carmenApp.factory('IniciarJuego', function($resource) 
{
    return $resource('/inicarJuego', {}, {
         'play': { method: 'POST' }
    });
});

carmenApp.factory('Pista', function($resource) {
    return $resource('/pistaDelLugar', {}, {
         'query': { method: 'GET', isArray: true}
    });
});

carmenApp.factory('Viajar', function($resource) 
{
    return $resource('/viajar', {}, {
         'travel': { method: 'POST' }
    });
});

carmenApp.factory('OrdenDeArresto', function($resource) 
{
    return $resource('/emitirOrdenPara', {}, {
         'arrest': { method: 'POST' }
    });
});