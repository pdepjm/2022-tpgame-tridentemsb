import wollok.game.*
import direcciones.*
import objects.*


object configuracion
{
		method hacerConfiguracionInicial() {
		game.title("Laberinto")
		game.width(16)
		game.height(16)
		game.cellSize(32)
		self.iniciarLaberinto(laberinto1) 
		self.iniciarPiso(piso1)
		game.addVisual(puerta)
		self.iniciarMalos(malos)
		game.addVisual(pepita)
		game.addVisual(llave1)
		game.addVisual(llave2)
		game.addVisual(llave3)
		game.addVisual(cofre1)
		game.addVisual(cofre2)
		game.addVisual(cofre3)
		}
		
		method iniciarLaberinto(unLaberinto)
		{
			unLaberinto.iniciarLaberinto()
		}
		
		method iniciarMalos(unaListaMalos)
		{
			unaListaMalos.forEach({ unMalo => game.addVisual(unMalo)})
		}
		
		method iniciarPiso(piso)
		{
			piso.forEach({ unPiso => game.addVisual(unPiso)})	
		}
		
}

class ObjetoMapa
{
	var posicion
	
	var imagen = "bloquecitoNegro.png"

	method position() = posicion

	method image() = imagen

	method estaCercaDireccion(unaDireccion) = posicion == unaDireccion.siguientePosicion(pepita.position())
	
	method estaCercaPersonaje() = self.estaCercaDireccion(arriba) || self.estaCercaDireccion(abajo) || self.estaCercaDireccion(derecha) || self.estaCercaDireccion(izquierda) 
								|| self.estaCercaDireccion(diagonalSuperiorDerecha) ||  self.estaCercaDireccion(diagonalSuperiorIzquierda) ||  self.estaCercaDireccion(diagonalInferiorIzquierda)
								||  self.estaCercaDireccion(diagonalInferiorDerecha)

	method iluminarse()
	
	method pierdeLuz()
	{
		imagen = "bloquecitoNegro.png"
	}
}

class Laberinto
{
	const posicionInicial
	
	const partesLaberinto
	
	method posicionInicial() = posicionInicial
	
	method iniciarLaberinto() = partesLaberinto.forEach({ unaParte => unaParte.inicializarParte()})
}

class ParteLaberinto
{
	const paredes
	
	method inicializarParte() = paredes.forEach({ unaPared => game.addVisual(unaPared)})
}


class Pared inherits ObjetoMapa
{
	override method iluminarse()
	{
		imagen = "stoneBlock.png"
	}
	
	
	method esObstaculo() = true
	
	method interaccion()
	{

	}
}



class Piso inherits ObjetoMapa{
	
	method interaccion(){}
	
	method esObstaculo() = false
	
	override method iluminarse()
	{
		imagen = "pasto.png"	
	}
} 



class Cofre inherits ObjetoMapa{
	const listaModificadores 
	
	method esObstaculo() = false

	method interaccion(){
		listaModificadores.anyOne().interaccion()
		game.removeVisual(self)
	}
	
	override method iluminarse()
	{
		imagen = "Chestcortado.png"
	}
}


object trampaQuitaVida
{
	 method interaccion()
	{
		pepita.pierdeVida()
	}
}

object trampaReinicio
{
	 method interaccion()
	{
		pepita.cambiarPosicion(pepita.laberinto().posicionInicial())
	}
}

object bonoVida
{
 method interaccion()
	{
		pepita.ganarVida(15)
	}
}


class Llave inherits ObjetoMapa
{
	method esObstaculo() = false
	
	method interaccion()
	{
		
		pepita.ganarLlave()
		game.removeVisual(self)
		game.say(pepita,"Junte una llave, tengo " + pepita.llaves() + " llaves")
	}
	
	override method iluminarse()
	{
		imagen = "llave.png"
	}
}


class Personaje
{
	
	method image() = "pepita.png"
	
	method puedeAvanzar(unaDireccion) = (game.getObjectsIn(unaDireccion)).all({unObjeto => not unObjeto.esObstaculo()})
	
	method esObstaculo() = false
	
	method moverA(unaDireccion)
	
}

class Malo inherits Personaje
{
	var imagen = "bloquecitoNegro.png"

	var posicion
	
	var property direccion
	
	override method image() = imagen
	
	override method moverA(unaDireccion)
	{
		
		if(self.puedeAvanzar(unaDireccion.siguientePosicion(posicion)))
		{
			
			posicion = unaDireccion.siguientePosicion(posicion)
			
		}
		else
		{

			posicion = (unaDireccion.opuesta()).siguientePosicion(posicion)
			direccion = unaDireccion.opuesta()
		}
	}
	
	method chequearVisual(){
		if(self.estaCercaPersonaje())	
				{
				self.iluminarse()
				}
	}
	
	method movimiento()
	{
		
	}
	
	method position() = posicion
	
	method interaccion()
	{
	
		pepita.pierdeVida()
	}
	
	method iluminarse()
	{	
		imagen = "pepita.png"
		game.onTick(1000,"apagar",{ => self.pierdeLuz()})
		game.schedule(1001,{ => game.removeTickEvent("apagar")})
	}
	
	method pierdeLuz()
	{
		imagen = "bloquecitoNegro.png"
	}
	method estaCercaDireccion(unaDireccion) = game.getObjectsIn(unaDireccion.siguientePosicion(posicion)).contains(pepita)
	
	method estaCercaPersonaje() = self.estaCercaDireccion(arriba) || self.estaCercaDireccion(abajo) || self.estaCercaDireccion(derecha) || self.estaCercaDireccion(izquierda)
	
}



object pepita inherits Personaje {
	
	var property llaves = 0
	
	var vida = 100
	 //CAMBIAR CON NIVELES
	const laberinto = laberinto1

	var posicion = game.at(0,13)
	
	method position() = posicion
	
	method laberinto() = laberinto
	
	method vida() = vida
	
	method vidaPierde() = 20 + (llaves*10)
	
	method cambiarPosicion(unaPosicion)
	{
		posicion = unaPosicion
	}
	
	method pierdeVida()
	{
		// PREGUNTAR
		if (vida <= self.vidaPierde())
		{
			game.say(self,"Perdiste")
			self.perder()
			
		}
		else
		{
			vida -= self.vidaPierde()
			game.say(self,"auch")
		}
	}
	
	method perder()
	{
		vida = 0
	}
	
	method perdio() = vida <= 0 
	
	override method puedeAvanzar(unaDireccion) = super(unaDireccion) && not self.perdio()
	
	method ganarVida(unaCantidad)
	{
		vida = 100.min(vida + unaCantidad)
	}

	override method image() = "pepita.png"

	override method moverA(unaDireccion)
	{
		if(self.puedeAvanzar(unaDireccion.siguientePosicion(posicion)))
		{
				self.dejaIluminar(unaDireccion)
				posicion = unaDireccion.siguientePosicion(posicion)
				self.iluminaSuCamino()
		}
	}
	
	method interactuaObjeto()
	{
		
	}
	
	method ganarLlave()
	{
		llaves += 1
	}
	
	method dejaIluminar(unaDireccion)
	{
		const direcciones = [arriba,abajo,derecha,izquierda,diagonalSuperiorDerecha,diagonalSuperiorIzquierda,diagonalInferiorIzquierda,diagonalInferiorDerecha]
		
		(direcciones.filter({direccion => direccion != unaDireccion})).forEach({direccion => (game.getObjectsIn(direccion.siguientePosicion(posicion))).forEach({ unObjeto => unObjeto.pierdeLuz()})})
	}
	
	method iluminaSuCamino()
	{
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
	
	method pierdeLuz(){}
	
	method iluminarse(){}
}

object puerta {
	
	var imagen = "bloquecitoNegro.png"
	
	method interaccion(){
		if(pepita.llaves()==3){
			game.say(self,"Ganaste")
			pepita.perder()
		}else {
			game.say(self,"Continua buscando")
		}
	}
	
	method esObstaculo()=false
	
		method pierdeLuz()
	{
		imagen = "bloquecitoNegro.png"
	}
	method iluminarse(){
		imagen = "puerta.png"
	}
	
	method image()= imagen
	
	method position()=game.at(15,3)
	
}