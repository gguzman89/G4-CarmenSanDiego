package edu.ui.domain.Dummy

import org.eclipse.xtend.lib.annotations.Accessors
import edu.ui.domain.CarmenSan10.CarmenSandiego
import edu.ui.domain.CarmenSan10.Villano
import java.util.ArrayList
import edu.ui.domain.CarmenSan10.Pais
import edu.ui.domain.CarmenSan10.LugarInteres
import edu.ui.domain.CarmenSan10.Banco
import edu.ui.domain.CarmenSan10.Informante
import edu.ui.domain.CarmenSan10.Club
import edu.ui.domain.CarmenSan10.Biblioteca

@Accessors
class DummyCarmenSandiego 
{
	private CarmenSandiego carmen;
	
	new()
	{
		// CREACION DE LOS VILLANOS	
		
		// >> Carmen Sandiego
		val seniasCarmen = new ArrayList <String>()
		seniasCarmen.add("Pelo rojo")
		seniasCarmen.add("Maneja un convertible")
		seniasCarmen.add("Posee un collar de rubies")
		seniasCarmen.add("Su comida favorita son los tacos mexicanos")
		
		val hobbiesCarmen = new ArrayList <String>()
		hobbiesCarmen.add("Juega tenis")
		
		var carmenSandiego = new Villano() => 
		[ 
			nombre = "Carmen Sandiego"
			sexo = "Femenino"
			seniasParticulares = seniasCarmen
			hobbies = hobbiesCarmen 
		]
		
		// >> Ivan Igorovich
		
		val seniasIvan = new ArrayList <String>()
		seniasIvan.add("Pelo rubio")
		seniasIvan.add("Maneja una limusina")
		seniasIvan.add("Tiene un extraño tatuaje ucraniano en el hombro derecho")
		seniasIvan.add("Le encanta ver langosta y ver dibujos animados")
		
		val hobbiesIvan = new ArrayList <String>()
		hobbiesIvan.add("Croquet")
		
		var ivanIgorovich = new Villano() => 
		[ 
			nombre = "Ivan Igorovich"
			sexo = "Masculino"
			seniasParticulares = seniasIvan
			hobbies = hobbiesIvan 
		]
		
		// CREACION DE OCUPANTES
		
		// >> informantes Argentina
		
		val informanteBibliotecaArg = new Informante() =>
		
		val informanteBancoArg = new Informante()
		
		val informante
		
		
		// CREACION DE LUGARES DE INTERES
		
		// >> bancoPeru
		
		val bancoPeru = new Banco() =>
		[
			politicaDelLugar = ""
			tipo = informanteBancoPeru
		]
		
		val clubEEUU = new Club() =>
		[
			politicaDelLugar = ""
			tipo = informanteClubEEUU
		]
	
		// >> bancoArgentina
		
		val bancoArgentina = new Banco() =>
		[
			politicaDelLugar = "Ella cambio su dinero a soles"
		]
		
		val bibliotecaArgentina = new Biblioteca() =>
		[
			politicaDelLugar = "Ella estaba buscando informacion sobre los antiguos mayas"
			infoAdicional = "Me gusto mucho su collar de rubies "
		]
		
		val clubArgentina = new Club() =>
		[
			politicaDelLugar = "Ella se mueve en un convertible"
		]
	
	
		// CREACION DE PAISES
		
		// >> Australia
		
		
		// >> Estados Unidos
		
		
		// >> Brazil
		
		var brazil = new Pais() => 
		[
			nombrePais = "Brasil"
			caracteristicaPais = caracteristicasBrasil
			lugares = 
		]
		
		// >> España
		
		val caracteristicasRuanda = new ArrayList <String>()
		caracteristicasRuanda.add("Bandera celeste y blanca")
		caracteristicasRuanda.add("Moneda peso")
		caracteristicasRuanda.add("Casa de gobierno rosada")
		caracteristicasRuanda.add("Conocida por los gauchos")
		
		var ruanda = new Pais() => 
		[
			nombrePais = "Ruanda"
			caracteristicaPais = caracteristicasRuanda
			lugares = 
		]
		
		// >> Peru
		
		val lugaresPeru = new ArrayList<LugarInteres>()
		lugaresPeru.add (bancoPeru)
		lugaresPeru.add (clubPeru)
		lugaresPeru.add (embajadaPeru)
		
		
		// >> Argentina
		
		val caracteristicasArgentina = new ArrayList <String>()
		caracteristicasArgentina.add("Bandera celeste y blanca")
		caracteristicasArgentina.add("Moneda peso")
		caracteristicasArgentina.add("Casa de gobierno rosada")
		caracteristicasArgentina.add("Conocida por los gauchos")
		
		var argentina = new Pais() => 
		[
			nombrePais = "Argentina"
			caracteristicaPais = caracteristicasArgentina
			lugares = 
		]
	}
}