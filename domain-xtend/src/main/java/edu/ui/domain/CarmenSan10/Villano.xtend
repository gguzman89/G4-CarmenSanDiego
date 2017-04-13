package edu.ui.domain.CarmenSan10

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.ArrayList

@Accessors
class Villano extends Ocupante {
	
	String nombre
	String sexo
	List<String> seniasParticulares
	List<String> hobbies
	
	new () {}
	
	new(String unNombre, String unSexo, ArrayList<String> variasSenias, ArrayList<String> variosHobbies) 
	{
		nombre = unNombre
		sexo = unSexo
		seniasParticulares = variasSenias
		hobbies = variosHobbies
	}
	
	def tieneElMismoNombreQue(String unNombre) 
	{
		nombre == unNombre
	}
	
	override responderAlDetective(LugarInteres unLugar) 
	{
		unLugar.politicaDelLugar
	}
	
	//el villano no deberia responder "cuidado detective estuvo a punto de caer en una trampa" ??
	
	
	/*
	 * Los villanos si están en el país pero no en el lugar al que visitamos intentan matarnos y fallan.
	 * En ese caso encontramos en cada uno de los LugarInteres un villano, el mismo
	 */
	 
}
