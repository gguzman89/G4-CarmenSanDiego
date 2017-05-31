// Este servicio lo utilizará el controlador de Mapamundi

carmenApp.factory('ModificarPais', function($resource) {
    return $resource('/pais/:id', {'id': '@id'}, { // En la direccion /pais/:id se permiten las siguientes consultas...
    	'query': { method: 'GET', isArray: true},
        'update': { method: 'PUT' },
        'remove': { method:'DELETE' }
    });
});

carmenApp.factory('Mapamundi', function($resource) { 
    return $resource('/paises', {}, {	// En /paises se permiten las consultas...
         'queryAll': { method: 'GET', isArray: true}
    });
});

carmenApp.factory('NuevoPais', function($resource)
{
    return $resource('/pais', {}, {	// En /pais solo se puede consultar...
         'save': { method: 'POST' }
    });
});