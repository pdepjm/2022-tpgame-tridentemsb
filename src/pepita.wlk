import wollok.game.*


object configuracion
{
		method hacerConfiguracionInicial() {
		game.title("Laberinto")
		game.width(16)
		game.height(16)
		game.cellSize(32)
		game.addVisual(pepita)
		game.addVisual(llave1)
		game.addVisual(cofre1)
		self.iniciarLaberinto(laberinto1) 
		}
		
		method iniciarLaberinto(unLaberinto)
		{
			unLaberinto.iniciarLaberinto()
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

// va a ser clase!
class Pared
{
	const posicion
	
	method position() = posicion
	
	method image() = "stoneBlock.png"
	
	method esObstaculo() = true
	
	method interaccion(){}
}

const recuadro = new ParteLaberinto( paredes = [new Pared(posicion = game.at(0,0)),new Pared(posicion = game.at(0,1)),new Pared(posicion = game.at(0,2)),new Pared(posicion = game.at(0,3)),
	new Pared(posicion = game.at(0,4)),new Pared(posicion = game.at(0,5)),new Pared(posicion = game.at(0,6)),new Pared(posicion = game.at(0,7)),
	new Pared(posicion = game.at(0,8)),new Pared(posicion = game.at(0,9)),new Pared(posicion = game.at(0,10)),new Pared(posicion = game.at(0,11)),
	new Pared(posicion = game.at(0,12)),new Pared(posicion = game.at(0,14)),new Pared(posicion = game.at(0,15)),new Pared(posicion = game.at(0,15)),
	new Pared(posicion = game.at(1,15)),new Pared(posicion = game.at(2,15)),new Pared(posicion = game.at(3,15)), new Pared(posicion = game.at(4,15)),
	new Pared(posicion = game.at(5,15)),new Pared(posicion = game.at(6,15)),new Pared(posicion = game.at(7,15)),new Pared(posicion = game.at(8,15)),
	new Pared(posicion = game.at(9,15)),new Pared(posicion = game.at(10,15)),new Pared(posicion = game.at(11,15)),new Pared(posicion = game.at(12,15)),
	new Pared(posicion = game.at(14,15)),new Pared(posicion = game.at(15,15)),new Pared(posicion = game.at(15,0)),new Pared(posicion = game.at(15,1)),
 	new Pared(posicion = game.at(15,2)),new Pared(posicion = game.at(15,15)),new Pared(posicion = game.at(15,4)),new Pared(posicion = game.at(15,5)),
 	new Pared(posicion = game.at(15,6)),new Pared(posicion = game.at(15,7)),new Pared(posicion = game.at(15,8)),new Pared(posicion = game.at(15,9)),
	new Pared(posicion = game.at(15,10)),new Pared(posicion = game.at(15,11)),new Pared(posicion = game.at(15,12)),new Pared(posicion = game.at(15,14)),
	new Pared(posicion = game.at(15,13)),new Pared(posicion = game.at(0,0)),new Pared(posicion = game.at(1,0)),new Pared(posicion = game.at(2,0)),
	new Pared(posicion = game.at(3,0)), new Pared(posicion = game.at(4,0)),new Pared(posicion = game.at(5,0)), new Pared(posicion = game.at(6,0)),
	new Pared(posicion = game.at(7,0)),new Pared(posicion = game.at(8,0)),new Pared(posicion = game.at(9,0)),new Pared(posicion = game.at(10,0)),
	new Pared(posicion = game.at(11,0)),new Pared(posicion = game.at(12,0)),new Pared(posicion = game.at(14,0)),new Pared(posicion = game.at(15,0)),
	new Pared(posicion = game.at(13,0))
])

const primerMuroFalso = new ParteLaberinto( paredes =  [new Pared(posicion = game.at(1,12)),new Pared(posicion = game.at(2,12)),new Pared(posicion = game.at(3,12)),
				 new Pared(posicion = game.at(4,12)),new Pared(posicion = game.at(5,12)),new Pared(posicion = game.at(6,12)),
				 new Pared(posicion = game.at(6,11)),new Pared(posicion = game.at(6,10)),new Pared(posicion = game.at(6,9)),
				 new Pared(posicion = game.at(6,8)),new Pared(posicion = game.at(5,8))])
				 
const caminoLLave = new ParteLaberinto (paredes = [new Pared(posicion = game.at(1,8)),new Pared(posicion = game.at(2,8)),new Pared(posicion = game.at(3,8)),
				new Pared(posicion = game.at(3,7)),new Pared(posicion = game.at(3,6)),new Pared(posicion = game.at(3,5)),
				new Pared(posicion = game.at(3,4)),new Pared(posicion = game.at(4,4)),new Pared(posicion = game.at(5,4)),
				new Pared(posicion = game.at(5,3)),new Pared(posicion = game.at(5,2))])
				
const segundoMuroFalso = new ParteLaberinto(paredes = [new Pared(posicion = game.at(8,1)),new Pared(posicion = game.at(8,2)),new Pared(posicion = game.at(8,3)),
							new Pared(posicion = game.at(8,4)),new Pared(posicion = game.at(8,5)),new Pared(posicion = game.at(9,5)),
							new Pared(posicion = game.at(10,5)),new Pared(posicion = game.at(10,6)),new Pared(posicion = game.at(10,7)),
							new Pared(posicion = game.at(10,8)),new Pared(posicion = game.at(11,8)),new Pared(posicion = game.at(12,8)),
							new Pared(posicion = game.at(13,8))])
							
const caminoALaPuerta = new ParteLaberinto(paredes = [new Pared(posicion = game.at(13,10)),new Pared(posicion = game.at(13,11)),new Pared(posicion = game.at(13,12))
							,new Pared(posicion = game.at(13,13)),new Pared(posicion = game.at(12,13)),new Pared(posicion = game.at(11,13)),
							new Pared(posicion = game.at(11,14))])
				
const tercerMuroFalso = new ParteLaberinto(paredes = [new Pared(posicion = game.at(9,14)),new Pared(posicion = game.at(9,13)),new Pared(posicion = game.at(9,12))
							,new Pared(posicion = game.at(9,11)),new Pared(posicion = game.at(9,10)),new Pared(posicion = game.at(10,10))
							,new Pared(posicion = game.at(11,10))])
							
const meta = new ParteLaberinto(paredes = [new Pared(posicion = game.at(14,6)),new Pared(posicion = game.at(13,6)),new Pared(posicion = game.at(12,6)),
		new Pared(posicion = game.at(12,5)),new Pared(posicion = game.at(12,4)),new Pared(posicion = game.at(12,3)),
		new Pared(posicion = game.at(12,2)),new Pared(posicion = game.at(13,2)),new Pared(posicion = game.at(14,2))])

const laberinto1 = new Laberinto(posicionInicial = game.at(0,13) , partesLaberinto = [meta,tercerMuroFalso,caminoALaPuerta,segundoMuroFalso,caminoLLave,primerMuroFalso,recuadro])

class Cofre{
	const listaModificadores 
	
	const posicion 
	
	method esObstaculo() = false
	
	method position() = posicion
	
	method image() = "Chestcortado.png"
	
	method interaccion(){
		listaModificadores.anyOne().interaccion()
		game.removeVisual(self)
	}
}

const cofre1 = new Cofre(posicion = game.at(1,11), listaModificadores = [trampaQuitaVida,trampaReinicio,bonoVida])

// va a ser clase!
class Modificador
{
	method interaccion()
}

object trampaQuitaVida inherits Modificador
{
	override method interaccion()
	{
		pepita.pierdeVida()
	}
}

object trampaReinicio inherits Modificador
{
	override method interaccion()
	{
		pepita.cambiarPosicion(pepita.laberinto().posicionInicial())
	}
}

object bonoVida inherits Modificador
{
	override method interaccion()
	{
		pepita.ganarVida(15)
	}
}

class Llave
{
	const posicion
	
	method image() = "llave.png"
	
	method position() = posicion
	
	method esObstaculo() = false
	
	method interaccion()
	{
		
		pepita.ganarLlave()
		game.removeVisual(self)
		game.say(pepita,"Junte una llave, tengo " + pepita.llaves() + " llaves")
	}
}
const llave1 = new Llave( posicion = game.at(1,2) ) 

object pepita {
	
	var property llaves = 0
	
	var vida = 100
	 //CAMBIAR CON NIVELES
	var laberinto = laberinto1

	var posicion = game.at(0,13)
	
	method laberinto() = laberinto
	
	method position() = posicion
	
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
			
		}
		else
		{
			vida -= self.vidaPierde()
		}
	}
	
	method ganarVida(unaCantidad)
	{
		vida = 100.min(vida + unaCantidad)
	}

	method image() = "pepita.png"

	method moverA(unaDireccion)
	{
		if(self.puedeAvanzar(unaDireccion.siguientePosicion(posicion)))
		{
				posicion = unaDireccion.siguientePosicion(posicion)
		}
	}
	
	method interactuaObjeto()
	{
		
	}
	
	method puedeAvanzar(unaDireccion) = (game.getObjectsIn(unaDireccion)).all({unObjeto => not unObjeto.esObstaculo()})
	
	method esObstaculo() = false
	
	method ganarLlave()
	{
		llaves += 1
	}
}

object puerta
{
	
}