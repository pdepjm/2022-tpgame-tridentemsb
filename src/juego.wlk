import wollok.game.*
import personajes.*
import direcciones.*
import partes.*


//Si o si
// menu con las reglas 
// ganaste


//opcional
// stats las llaves-vida
// spites
// bugcito - que el personaje tenga ya la lupa
// musica de terror-suspenso


//Si o si
// menu con las reglas 
// ganaste


//opcional
// stats las llaves-vida
// spites
// bugcito - que el personaje tenga ya la lupa
// musica de terror-suspenso



object juego {

	method iniciar()
	{
		self.configurarTeclas()
		self.hacerConfiguracionInicial()
		self.configurarAcciones()
		game.start()
	}
	
		method hacerConfiguracionInicial()
		{
			configuracion.hacerConfiguracionInicial()
		}
		
		method configurarAcciones()
		{
			game.onCollideDo(pepita,({objeto => objeto.interaccion()}))
			game.onTick(250,"mover malo",{malos.forEach({ unMalo => unMalo.moverA(unMalo.direccion())})})
		//	game.onTick(1,"Chequear visual",{malos.forEach({unMalo => unMalo.chequearVisual()})})
		}
		

	
		method configurarTeclas() {
		keyboard.w().onPressDo({pepita.moverA(arriba)})
		keyboard.d().onPressDo({pepita.moverA(derecha)}) 
		keyboard.s().onPressDo({pepita.moverA(abajo)})
		keyboard.a().onPressDo({pepita.moverA(izquierda)})
	}
	
}

object configuracion {

	method hacerConfiguracionInicial() {
		game.title("Laberinto")
		game.width(16)
		game.height(18)
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
		self.mostrarInstrucciones()
		game.addVisual(vidaPersonaje)
		game.addVisual(progreso)
	}
	
	method mostrarInstrucciones()
	{
		game.addVisual(instrucciones)
		keyboard.space().onPressDo({instrucciones.ocultar()})
	}

	method iniciarLaberinto(unLaberinto) {
		unLaberinto.iniciarLaberinto()
	}

	method iniciarMalos(unaListaMalos) {
		unaListaMalos.forEach({ unMalo => game.addVisual(unMalo)})
	}

	method iniciarPiso(piso) {
		piso.forEach({ unPiso => game.addVisual(unPiso)})
	}

}