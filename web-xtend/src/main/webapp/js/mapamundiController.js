carmenApp.controller('MapamundiController', function ($timeout, Mapamundi, ModificarPais){
'use strict';
	var self = this;

    self.paises = [];

    this.errors = [];

    function errorHandler(error) {
        self.notificarError(error.data);
    };

	this.actualizarTabla = function() {
        Mapamundi.queryAll(function(data) {
       		console.log(data);
            self.paises = data;
        }, errorHandler);
    };

    this.actualizarTabla();

    this.notificarError = function(mensaje) {
        this.errors.push(mensaje);
        this.notificar(this.errors);
    };

    this.notificar = function(mensajes) {
        $timeout(function() {
            while (mensajes.length > 0) mensajes.pop();
        }, 3000);
    };

    this.borrarPais = function(pais) {
    	ModificarPais.remove(pais, function(data) {
    		self.villanos = data
    	} // terminar
		)
    };
});