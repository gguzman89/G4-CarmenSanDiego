carmenApp.controller('MenuCtrl', function (Pista, $state) 
{ 
	this.jugar = function()
	{
		//.play();
		console.log("play?")
		$state.go("resolviendoMisterio");
	}

	this.pista = function(l, idcaso) {
		Pista.query({lugar:l, caso: idcaso}, function(data){
			console.log(data);
		})
	}

	this.openMapamundi = function() {
		$state.go("admMapamundi");
	}

	this.openExpediente = function() {
		$state.go("admExpedientes");
	}
});