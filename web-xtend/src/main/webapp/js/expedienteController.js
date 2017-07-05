carmenApp.controller('ExpedienteController', function ($timeout, Expediente, ModificarVillano) 
{ 
	'use strict';
	var self = this;

    self.villanos = [];

    this.errors = [];

    function errorHandler(error) {
        self.notificarError(error.data);
    }

	this.actualizarTabla = function() {
        Expediente.queryAll(function(data) {
       		console.log(data);
            self.villanos = data;
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

    this.borrarVillano = function(villano) {
    	ModificarVillano.remove(villano, function(data) {
    		self.villanos = data
    	} // terminar

    		)
    };
});