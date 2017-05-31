// Este servicio es para el controlador de Expediente

carmenApp.factory('ModificarVillano', function($resource) {
    return $resource('/villano/:id', {'id': '@id'}, {   // En /villano/:id se consulta solamente....
    	'query': { method: 'GET', isArray: true},
        'update': { method: 'PUT' },
        'remove': { method:'DELETE' }
    });
});

carmenApp.factory('Expediente', function($resource) {
    return $resource('/villanos', {}, {                 // En /villanos solo se puede consultar...
         'queryAll': { method: 'GET', isArray: true}
    });
});

carmenApp.factory('NuevoVillano', function($resource)   // En /villano solo se puede realizar...
{
    return $resource('/villano', {}, {
         'save': { method: 'POST' }
    });
});
