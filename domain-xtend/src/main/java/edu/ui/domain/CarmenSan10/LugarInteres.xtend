package edu.ui.domain.CarmenSan10

import java.util.ArrayList
import java.util.List

abstract class LugarInteres {
	
	Ocupante tipo
	List<String> politicaDelLugar
	
	new (){}
	
	new(Ocupante cual) {
		tipo = cual
		politicaDelLugar = new ArrayList<String> ()
	}
}
