carmenApp.controller('MenuController', function (Pista, $state, CarmenService) 
{ 
	this.jugar = function()
	{
		CarmenService.play();
		$state.go('resolviendoMisterio');
	}

	this.pista = function(l, idcaso) {
		Pista.query({lugar:l, caso: idcaso}, function(data){
			console.log(data);
		})
	}
}