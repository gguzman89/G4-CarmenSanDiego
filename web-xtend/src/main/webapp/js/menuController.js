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
});