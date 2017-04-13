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
import edu.ui.domain.CarmenSan10.Cuidador
import edu.ui.domain.CarmenSan10.Embajada

@Accessors
class DummyCarmenSandiego 
{
	private CarmenSandiego carmen;
	
	new()
	{
		// CREACION DE LOS VILLANOS	
		
		// >> Carmen Sandiego
		val seniasCarmen = new ArrayList <String>()
		seniasCarmen.add("Pelo rojo.")
		seniasCarmen.add("Maneja un convertible.")
		seniasCarmen.add("Posee un collar de rubies.")
		seniasCarmen.add("Su comida favorita son los tacos mexicanos.")
		
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
		seniasIvan.add("Pelo rubio.")
		seniasIvan.add("Maneja una limusina.")
		seniasIvan.add("Tiene un extraño tatuaje ucraniano en el hombro derecho.")
		seniasIvan.add("Le encanta ver langosta y ver dibujos animados.")
		
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
		
		// >> cuidadores Espania
		
		val cuidadorBancoEsp = new Cuidador()
		val cuidadorEmbajadaEsp = new Cuidador()
		val cuidadorBibliotecaEsp = new Cuidador()
		
		// >> villanos Peru
		
		val villanoBancoPeru = new Villano()
		val villanoEmbajadaPeru = new Villano()
		val villanoClubPeru = new Villano()
		
		// >> informantes Argentina
		
		val informanteBibliotecaArg = new Informante()
		val informanteBancoArg = new Informante()
		val informanteClubArg = new Informante()
		
		// CREACION DE LUGARES DE INTERES
		
		// >> lugares de Espania
		
		val bancoEspania = new Banco() =>
		[
			politicaDelLugar = "CUIDADO DETECTIVE!! Ha estado a punto de caer en una trampa... La persona que busca está en la ciudad."
			tipo = cuidadorBancoEsp
		]
		
		val bibliotecaEspania = new Banco() =>
		[
			politicaDelLugar = "CUIDADO DETECTIVE!! Ha estado a punto de caer en una trampa... La persona que busca está en la ciudad."
			tipo = cuidadorBibliotecaEsp
		]
		
		val embajadaEspania = new Banco() =>
		[
			politicaDelLugar = "CUIDADO DETECTIVE!! Ha estado a punto de caer en una trampa... La persona que busca está en la ciudad."
			tipo = cuidadorEmbajadaEsp
		]
		
		// >> lugares de Peru
		
		val bancoPeru = new Banco() =>
		[
			politicaDelLugar = "CUIDADO DETECTIVE!! Ha estado a punto de caer en una trampa... La persona que busca está en la ciudad."
			tipo = villanoBancoPeru
		]
		
		val clubPeru = new Club() =>
		[
			politicaDelLugar = "ALTO!!! Detengase:"
			tipo = villanoClubPeru
		]
		
		val embajadaPeru = new Embajada() =>
		[
			politicaDelLugar = "CUIDADO DETECTIVE!! Ha estado a punto de caer en una trampa... La persona que busca está en la ciudad."
			tipo = villanoEmbajadaPeru
		]
	
		// >> lugares de Argentina
		
		val bancoArgentina = new Banco() =>
		[
			politicaDelLugar = "Ella cambio su dinero a soles."
			tipo = informanteBancoArg
		]
		
		val bibliotecaArgentina = new Biblioteca() =>
		[
			politicaDelLugar = "Ella estaba buscando informacion sobre los antiguos mayas."
			infoAdicional = "Me gusto mucho su collar de rubies."
		]
		
		val clubArgentina = new Club() =>
		[
			politicaDelLugar = "Ella se mueve en un convertible."
		]
	
	
		// CREACION DE PAISES
		
		// >> España
		
		val caracteristicasEspania = new ArrayList <String>()
		caracteristicasEspania.add("Bandera roja y amarilla")
		caracteristicasEspania.add("Moneda euros")
		
		val conexionesEspania = new ArrayList<Pais>()
		conexionesEspania.add (argentina)
		
		val lugaresDeEspania = new ArrayList<LugarInteres>()
		lugaresDeEspania.add (bancoPeru)
		lugaresDeEspania.add (clubPeru)
		lugaresDeEspania.add (embajadaPeru)
		
		var espania = new Pais() => 
		[
			nombrePais = "Espania"
			caracteristicaPais = caracteristicasEspania
			lugares = lugaresDeEspania
			paisesConexionAerea = conexionesEspania
		]
		
		// >> Peru
		
		val caracteristicasPeru = new ArrayList<String>()
		caracteristicasPeru.add ("Bandera roja y blanca")
		caracteristicasPeru.add ("Moneda soles")
		caracteristicasPeru.add ("Conocida por los mayas")
		
		val conexionesPeru = new ArrayList<Pais>()
		conexionesPeru.add (argentina)
		
		val lugaresDePeru = new ArrayList<LugarInteres>()
		lugaresDePeru.add (bancoPeru)
		lugaresDePeru.add (clubPeru)
		lugaresDePeru.add (embajadaPeru)
		
		var peru = new Pais() =>
		[
			nombrePais = "Peru"
			caracteristicaPais = caracteristicasPeru
			lugares = lugaresDePeru
			paisesConexionAerea = conexionesPeru
		]
		
		
		// >> Argentina
		
		val caracteristicasArgentina = new ArrayList <String>()
		caracteristicasArgentina.add("Bandera celeste y blanca")
		caracteristicasArgentina.add("Moneda peso")
		caracteristicasArgentina.add("Casa de gobierno rosada")
		caracteristicasArgentina.add("Conocida por los gauchos")
		
		val lugaresDeArgentina = new ArrayList<LugarInteres>()
		lugaresDeArgentina.add(bibliotecaArgentina)
		lugaresDeArgentina.add(bancoArgentina)
		lugaresDeArgentina.add(clubArgentina)
		
		val conexionesArgentina = new ArrayList<Pais>()
		conexionesArgentina.add(peru)
		conexionesArgentina.add(espania)
		
		var argentina = new Pais() => 
		[
			nombrePais = "Argentina"
			caracteristicaPais = caracteristicasArgentina
			lugares = lugaresDeArgentina
			paisesConexionAerea = conexionesArgentina
		]
		
	}
}