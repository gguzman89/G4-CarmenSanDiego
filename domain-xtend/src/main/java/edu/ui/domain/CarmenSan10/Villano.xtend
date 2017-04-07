package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Villano extends Ocupante {
	
	String nombre
	String sexo
	List<String> seniasParticulares
	List<String> hobbies
	
	def tieneElMismoNombreQue(String unNombre) 
	{
		nombre == unNombre
	}
	
	override responderAlDetective(LugarInteres unLugar) 
	{
		unLugar.politicaDelLugar
	}
	
	/*
	 * Los villanos si están en el país pero no en el lugar al que visitamos intentan matarnos y fallan.
	 * En ese caso encontramos en cada uno de los LugarInteres un villano, el mismo
	 */
	 
}
