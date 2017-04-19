package edu.ui.domain.CarmenSan10

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CarmenSandiego 
{
	private Mapamundi mapamundi
	private ACME acme
	
	new() {}
	
	new (Mapamundi mapa, ACME acme)
	{
		mapamundi = mapa
		this.acme = acme 
	}
	
	def getExpediente ()
	{
		acme.villanos
	}
	
	def getCaso()
	{
		acme.caso
	}
	
	def getDetective()
	{
		acme.resolvedorDeCasos
	}
}