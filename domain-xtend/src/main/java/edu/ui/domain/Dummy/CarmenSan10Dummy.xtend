package edu.ui.domain.Dummy

import edu.ui.domain.CarmenSan10.Villano
import edu.ui.domain.CarmenSan10.Caracteristicas
import java.util.ArrayList
import edu.ui.domain.CarmenSan10.Mapamundi
import edu.ui.domain.CarmenSan10.PaisMini
import edu.ui.domain.CarmenSan10.Expediente
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CarmenSan10Dummy 
{
	Mapamundi mapamundi
	Expediente expediente = new Expediente
	
	new ()
	{	
		val miniPaises = new ArrayList<PaisMini>()
		
		miniPaises.add(new PaisMini(1, "Venezuela"))
		miniPaises.add(new PaisMini(6, "Brazil"))
		miniPaises.add(new PaisMini(7, "Argentina"))
		
		mapamundi = new Mapamundi => [
			paisesMini = miniPaises
		]
		
		
		
		val seniasParticularesCS = new ArrayList<Caracteristicas>()
		val seniaCS1 = new Caracteristicas("Pelo rojo")
		val seniaCS2 = new Caracteristicas("Maneja un convertible")
		seniasParticularesCS.add(seniaCS1)
		seniasParticularesCS.add(seniaCS2)
		
		val hobbiesCS = new ArrayList<Caracteristicas>()
		val hobbieCS = new Caracteristicas("Juega tenis")
		hobbiesCS.add(hobbieCS)
		
		val villanoCS = new Villano("Carmen Sandiego", "Femenino", seniasParticularesCS, hobbiesCS) => [
			id = 3
		]
		
		val villanosD = new ArrayList<Villano>()
		villanosD.add(villanoCS)
		
		expediente = new Expediente => [
			villanos = villanosD
		]
		
	}
}