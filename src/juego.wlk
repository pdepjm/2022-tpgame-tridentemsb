import wollok.game.*
import pepita.*
import direcciones.*
import objects.*



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
			game.onTick(1,"Chequear visual",{malos.forEach({unMalo => unMalo.chequearVisual()})})
		}
		

	
		method configurarTeclas() {
		keyboard.w().onPressDo({pepita.moverA(arriba)})
		keyboard.d().onPressDo({pepita.moverA(derecha)}) 
		keyboard.s().onPressDo({pepita.moverA(abajo)})
		keyboard.a().onPressDo({pepita.moverA(izquierda)})
	}
	
}