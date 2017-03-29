package edu.ui.domain.Exceptions

import org.omg.CORBA.UserException

class ElPaisYaEstaIncluidoException extends UserException 
{
	new (String mensajeDeError)
	{
		super (mensajeDeError)
	}
}