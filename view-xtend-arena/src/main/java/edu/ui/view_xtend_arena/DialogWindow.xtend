package edu.ui.view_xtend_arena

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import edu.ui.domain.CarmenSan10.ACME
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label

class DialogWindow extends Dialog<ACME>
{
	
	new(WindowOwner owner, ACME model) 
	{
		super(owner, model)
		title = "Titulo de la ventana Dialog"
		taskDescription = ""
	}
	
	override createFormPanel(Panel mainPanel) 
	{
		new Label(mainPanel).text = "Acá se coloca el dialogo que se quiera poner"
		new Button(mainPanel) => [
			caption = "Ok"
			onClick [| this.close]
			]
	}
}