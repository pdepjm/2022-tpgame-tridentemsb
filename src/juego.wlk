import wollok.game.*
import pepita.*
import direcciones.*



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
		}
		

	
		method configurarTeclas() {
		keyboard.w().onPressDo({pepita.moverA(arriba)})
		keyboard.d().onPressDo({pepita.moverA(derecha)}) 
		keyboard.s().onPressDo({pepita.moverA(abajo)})
		keyboard.a().onPressDo({pepita.moverA(izquierda)})
	}
	
}