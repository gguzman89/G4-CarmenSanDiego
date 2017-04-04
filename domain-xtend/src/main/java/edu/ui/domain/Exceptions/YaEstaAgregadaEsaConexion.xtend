package edu.ui.domain.Exceptions

import org.omg.CORBA.UserException

class YaEstaAgregadaEsaConexion extends UserException {
	new(String mensajeDeError) 
	{
		super (mensajeDeError)
	}	
}