import wollok.game.*
import direcciones.*
import partes.*
import juego.*

// separar en archivos
// cambiar objetoMapa o

object instrucciones
{
	method image() = "normas2.png"
	
	method position() = game.at(0,5)
	
	method ocultar() 
	{
		game.removeVisual(self)
		keyboard.space().onPressDo({})
	} 
}

object vidaPersonaje
{
	var cantidad = 100
	
	method text() = "VIDA ="  + cantidad.toString()
	
	method actualizar(unCambio)
	{
		cantidad = (0.max(cantidad + unCambio)).min(100)
	}
	
	method position() = game.at(13,16)
}

object progreso
{
	var cantidad = 0
	
	method text() = "LLAVES = " + cantidad.toString()
	
	method actualizar()
	{
		cantidad += 1 
	}
	
	method position() = game.at(1,16)
}

class Personaje {

	method image() = "pepita.png"

	method puedeAvanzar(unaDireccion) = (game.getObjectsIn(unaDireccion)).all({ unObjeto => not unObjeto.esObstaculo() })

	method esObstaculo() = false

	method moverA(unaDireccion)

}

class Malo inherits Personaje {

	var imagen = "bloquecitoNegro.png"
	var posicion
	var property direccion

	override method image() = imagen

	override method moverA(unaDireccion) {
		if(not pepita.perdio())
		{
			if (self.puedeAvanzar(unaDireccion.siguientePosicion(posicion))) {
			posicion = unaDireccion.siguientePosicion(posicion)
		} else {
			posicion = (unaDireccion.opuesta()).siguientePosicion(posicion)
			direccion = unaDireccion.opuesta()
		}
		self.chequearVisual()
		}
	}

	method chequearVisual() {
		if (self.estaCercaPersonaje()) {
			self.iluminarse()
		}
	}

	method position() = posicion

	method interaccion() {
		pepita.pierdeVida()
	}

	method iluminarse() {
		imagen = "fantasmin.png"
//		game.onTick(1000, "apagar", { => self.pierdeLuz()})
//		game.schedule(1001, { => game.removeTickEvent("apagar")})
	}

	method pierdeLuz() {
		imagen = "bloquecitoNegro.png"
	}

	method estaCercaDireccion(unaDireccion) = game.getObjectsIn(unaDireccion.siguientePosicion(posicion)).contains(pepita)

	method estaCercaPersonaje() = self.estaCercaDireccion(arriba) || self.estaCercaDireccion(abajo) || self.estaCercaDireccion(derecha) || self.estaCercaDireccion(izquierda)

}

object pepita inherits Personaje {

	var property llaves = 0
	var property vida = 100
	var laberinto = laberinto1
	var posicion = game.at(0, 13)

	method position() = posicion

	method laberinto() = laberinto

	method vida() = vida

	method vidaPierde() = 20 + (llaves * 10)

	method cambiarPosicion(unaPosicion) {
		posicion = unaPosicion
	}

	method pierdeVida() {
		if (vida <= self.vidaPierde()) {
			game.say(self, "Perdiste")
			vidaPersonaje.actualizar(-1*self.vidaPierde())
			game.addVisual(derrota)
			self.perder()
			sonido.apagar()
		} else {
			vida -= self.vidaPierde()
			vidaPersonaje.actualizar(-1*self.vidaPierde())
			game.say(self, "auch")
		}
	}

	method perder() {
		vida = 0
	}

	method perdio() = vida <= 0

	override method puedeAvanzar(unaDireccion) = super(unaDireccion) && not self.perdio()

	method ganarVida(unaCantidad) {
		vida = 100.min(vida + unaCantidad)
		vidaPersonaje.actualizar(unaCantidad)
	}

	override method image() = "fantasma.png"

	override method moverA(unaDireccion) {
		if (self.puedeAvanzar(unaDireccion.siguientePosicion(posicion))) {
			self.dejaIluminar(unaDireccion)
			posicion = unaDireccion.siguientePosicion(posicion)
			self.iluminaSuCamino()
		}
	}

	method interactuaObjeto() {
	}

	method ganarLlave() {
		llaves += 1
		progreso.actualizar()
		if (llaves == 3) {
			puerta.desbloquear()
		}
	}

// aca delgar
	method dejaIluminar(unaDireccion) {
		const direcciones = [ arriba, abajo, derecha, izquierda, diagonalSuperiorDerecha, diagonalSuperiorIzquierda, diagonalInferiorIzquierda, diagonalInferiorDerecha ]
		(direcciones.filter({ direccion => direccion != unaDireccion})).forEach({ direccion => (game.getObjectsIn(direccion.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})})
	}

	method iluminaSuCamino() {
		(game.getObjectsIn(arriba.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.iluminarse()})
		(game.getObjectsIn(derecha.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.iluminarse()})
		(game.getObjectsIn(abajo.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.iluminarse()})
		(game.getObjectsIn(izquierda.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.iluminarse()})
		(game.getObjectsIn(diagonalSuperiorDerecha.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.iluminarse()})
		(game.getObjectsIn(diagonalSuperiorIzquierda.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.iluminarse()})
		(game.getObjectsIn(diagonalInferiorIzquierda.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.iluminarse()})
		(game.getObjectsIn(diagonalInferiorDerecha.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.iluminarse()})
		(game.getObjectsIn(posicion)).forEach({ unObjeto => unObjeto.iluminarse()})
	}
	
	method iluminarse(){}
}

object victoria
{
	method image() = "ganaste2.png"
	
	method textColor() = "FFFFFFFF"
	
	method position() = game.at(0,15)
}

object derrota
{
	method image() = "perdiste.png"
	
	method textColor() = "FFFFFFFF"
	
	method position() = game.at(0,15)
}