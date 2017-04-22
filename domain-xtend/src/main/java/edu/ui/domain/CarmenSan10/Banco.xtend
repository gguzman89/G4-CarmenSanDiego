package edu.ui.domain.CarmenSan10


class Banco extends LugarInteres {
	
	override getNombre()
	{
		"Banco"
	}
	
	override adicional() {}
	
	override setPoliticaDelLugar(Caso c, Pais actual) {
		politicaDelLugar = c.planDeEscape.get(c.planDeEscape.indexOf(actual.nombrePais)+1).caracteristicaPais.findFirst[]
	}
	
}
