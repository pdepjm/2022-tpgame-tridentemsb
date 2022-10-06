import wollok.game.*

object pared
{
	var posicion = game.at(1,1)
	
	method position() = posicion
	
	method image() = "bloquecito.png"
	
	method esObstaculo() = true
}

class Trampa
{
	
}

class LLave
{
	
}

object pepita {

	var posicion = game.center()
	
	method position() = posicion

	method image() = "pepita.png"

	method moverA(unaDireccion)
	{
		if(!self.noPuedeAvanzar(unaDireccion.siguientePosicion(posicion)))
		{
				posicion = unaDireccion.siguientePosicion(posicion)
		}
	}
	
	method noPuedeAvanzar(unaDireccion) = (game.getObjectsIn(unaDireccion)).any({unObjeto => unObjeto.esObstaculo()})
	
	
}

object puerta
{
	
}