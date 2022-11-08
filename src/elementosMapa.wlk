import wollok.game.*
import direcciones.*
import partes.*
import personajes.* 

class ElementoMapa {

	var posicion
	var imagen = "bloquecitoNegro.png"

	method position() = posicion

	method image() = imagen

	method estaCercaDireccion(unaDireccion) = posicion == unaDireccion.siguientePosicion(pepita.position())

	method estaCercaPersonaje() = self.estaCercaDireccion(arriba) || self.estaCercaDireccion(abajo) || self.estaCercaDireccion(derecha) || self.estaCercaDireccion(izquierda) || self.estaCercaDireccion(diagonalSuperiorDerecha) || self.estaCercaDireccion(diagonalSuperiorIzquierda) || self.estaCercaDireccion(diagonalInferiorIzquierda) || self.estaCercaDireccion(diagonalInferiorDerecha)

	method iluminarse()

	method pierdeLuz() {
		imagen = "bloquecitoNegro.png"
	}

}

class Laberinto {

	const posicionInicial
	const partesLaberinto

	method posicionInicial() = posicionInicial

	method iniciarLaberinto() = partesLaberinto.forEach({ unaParte => unaParte.inicializarParte() })

}

class ParteLaberinto {

	const paredes

	method inicializarParte() = paredes.forEach({ unaPared => game.addVisual(unaPared) })

}

class Pared inherits ElementoMapa {

	override method iluminarse() {
		imagen = "stoneBlock.png"
	}

	method esObstaculo() = true

	method interaccion() {
	}

}

class Piso inherits ElementoMapa {

	method interaccion() {
	}

	method esObstaculo() = false

	override method iluminarse() {
		imagen = "pasto.png"
	}

}

class Cofre inherits ElementoMapa {

	const listaModificadores

	method esObstaculo() = false

	method interaccion() {
		const elegido = listaModificadores.anyOne()
		elegido.interaccion()
		elegido.reinicio(posicion)
		game.removeVisual(self)
	}

	override method iluminarse() {
		imagen = "Chestcortado.png"
	}

}

object trampaQuitaVida {

	method interaccion() {
		pepita.pierdeVida()
	}
	
	method reinicio(posicion){}

}

object trampaReinicio{

	method interaccion() {
		pepita.cambiarPosicion(pepita.laberinto().posicionInicial())
	}
	
	method reinicio(posicion)
	{
		(game.getObjectsIn(posicion)).forEach({ unObjeto => unObjeto.pierdeLuz()})
		(game.getObjectsIn(arriba.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})
		(game.getObjectsIn(derecha.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})
		(game.getObjectsIn(abajo.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})
		(game.getObjectsIn(izquierda.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})
		(game.getObjectsIn(diagonalSuperiorDerecha.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})
		(game.getObjectsIn(diagonalSuperiorIzquierda.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})
		(game.getObjectsIn(diagonalInferiorIzquierda.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})
		(game.getObjectsIn(diagonalInferiorDerecha.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})
	}
}

object bonoVida {

	method interaccion() {
		pepita.ganarVida(15)
	}

	method reinicio(posicion){}
}

class Llave inherits ElementoMapa {

	method esObstaculo() = false

	method interaccion() {
		pepita.ganarLlave()
		game.removeVisual(self)
		game.say(pepita, "Junte una llave, tengo " + pepita.llaves() + " llaves")
	}

	override method iluminarse() {
		imagen = "llave.png"
	}

}