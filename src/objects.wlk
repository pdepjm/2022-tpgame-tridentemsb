import juego.*
import direcciones.*
import pepita.*
import wollok.game.*


// Partes del Laberinto

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
	new Pared(posicion = game.at(13,0)),new Pared(posicion = game.at(13,15))])

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
		new Pared(posicion = game.at(12,5)),new Pared(posicion = game.at(12,4)),
		new Pared(posicion = game.at(12,2)),new Pared(posicion = game.at(13,2)),new Pared(posicion = game.at(14,2))])

//Laberinto

const laberinto1 = new Laberinto(posicionInicial = game.at(0,13) , partesLaberinto = [meta,tercerMuroFalso,caminoALaPuerta,segundoMuroFalso,caminoLLave,primerMuroFalso,recuadro])

//Piso

const piso1 = [new Piso(posicion = game.at(1,14)),new Piso(posicion = game.at(2,14)),new Piso(posicion = game.at(3,14)),new Piso(posicion = game.at(4,14)),	new Piso(posicion = game.at(5,14)),
			new Piso(posicion = game.at(6,14)),new Piso(posicion = game.at(7,14)),new Piso(posicion = game.at(8,14)),new Piso(posicion = game.at(10,14)),new Piso(posicion = game.at(12,14)),new Piso(posicion = game.at(13,14)),
			new Piso(posicion = game.at(14,14)),new Piso(posicion = game.at(0,13)),new Piso(posicion = game.at(1,13)),new Piso(posicion = game.at(2,13)),new Piso(posicion = game.at(3,13)),new Piso(posicion = game.at(4,13)),
			new Piso(posicion = game.at(5,13)),new Piso(posicion = game.at(6,13)),new Piso(posicion = game.at(7,13)),new Piso(posicion = game.at(8,13)),new Piso(posicion = game.at(10,13))
			,new Piso(posicion = game.at(14,13)),new Piso(posicion = game.at(7,12)),new Piso(posicion = game.at(8,12)),new Piso(posicion = game.at(10,12)),new Piso(posicion = game.at(11,12)),new Piso(posicion = game.at(12,12)),
			new Piso(posicion = game.at(14,12)),new Piso(posicion = game.at(1,11)),new Piso(posicion = game.at(2,11)),new Piso(posicion = game.at(3,11)),new Piso(posicion = game.at(4,11)),new Piso(posicion = game.at(5,11)),new Piso(posicion = game.at(7,11)),
			new Piso(posicion = game.at(8,11)),new Piso(posicion = game.at(10,11)),new Piso(posicion = game.at(11,11)),new Piso(posicion = game.at(12,11)),new Piso(posicion = game.at(14,11)),new Piso(posicion = game.at(1,10)),
			new Piso(posicion = game.at(2,10)),new Piso(posicion = game.at(3,10)),new Piso(posicion = game.at(4,10)),new Piso(posicion = game.at(5,10)),new Piso(posicion = game.at(7,10)),new Piso(posicion = game.at(8,10)),
			new Piso(posicion = game.at(12,10)),new Piso(posicion = game.at(14,10)),new Piso(posicion = game.at(1,9)),new Piso(posicion = game.at(2,9)),new Piso(posicion = game.at(3,9)),new Piso(posicion = game.at(4,9))
			,new Piso(posicion = game.at(5,9)),new Piso(posicion = game.at(7,9)),new Piso(posicion = game.at(8,9)),new Piso(posicion = game.at(9,9)),new Piso(posicion = game.at(10,9)),
			new Piso(posicion = game.at(11,9)),new Piso(posicion = game.at(12,9)),new Piso(posicion = game.at(13,9)),new Piso(posicion = game.at(14,9)),new Piso(posicion = game.at(4,8)),new Piso(posicion = game.at(7,8)),new Piso(posicion = game.at(8,8)),
			new Piso(posicion = game.at(9,8)),new Piso(posicion = game.at(14,8)),new Piso(posicion = game.at(1,7)),new Piso(posicion = game.at(2,7)),new Piso(posicion = game.at(4,7)),new Piso(posicion = game.at(5,7)),new Piso(posicion = game.at(6,7)),
			new Piso(posicion = game.at(7,7)),new Piso(posicion = game.at(8,7)),new Piso(posicion = game.at(9,7)),new Piso(posicion = game.at(11,7)),new Piso(posicion = game.at(12,7)),new Piso(posicion = game.at(13,7)),new Piso(posicion = game.at(14,7)),
			new Piso(posicion = game.at(1,6)),new Piso(posicion = game.at(2,6)),new Piso(posicion = game.at(4,6)),new Piso(posicion = game.at(5,6)),new Piso(posicion = game.at(6,6)),new Piso(posicion = game.at(7,6)),new Piso(posicion = game.at(8,6)),
			new Piso(posicion = game.at(9,6)),new Piso(posicion = game.at(11,6)),new Piso(posicion = game.at(1,5)),new Piso(posicion = game.at(2,5)),new Piso(posicion = game.at(4,5)),new Piso(posicion = game.at(5,5)),new Piso(posicion = game.at(6,5)),new Piso(posicion = game.at(7,5)),new Piso(posicion = game.at(11,5)),new Piso(posicion = game.at(13,5)),
			new Piso(posicion = game.at(14,5)),new Piso(posicion = game.at(1,4)),new Piso(posicion = game.at(2,4)),new Piso(posicion = game.at(6,4)),new Piso(posicion = game.at(7,4)),new Piso(posicion = game.at(9,4)),new Piso(posicion = game.at(10,4)),
			new Piso(posicion = game.at(11,4)),new Piso(posicion = game.at(13,4)),new Piso(posicion = game.at(14,4)),new Piso(posicion = game.at(1,3)),new Piso(posicion = game.at(2,3)),new Piso(posicion = game.at(3,3)),new Piso(posicion = game.at(4,3)),
			new Piso(posicion = game.at(6,3)),new Piso(posicion = game.at(7,3)),new Piso(posicion = game.at(9,3)),new Piso(posicion = game.at(10,3)),new Piso(posicion = game.at(11,3)),new Piso(posicion = game.at(12,3)),new Piso(posicion = game.at(13,3)),new Piso(posicion = game.at(14,3)),
			new Piso(posicion = game.at(1,2)),new Piso(posicion = game.at(2,2)),new Piso(posicion = game.at(3,2)),new Piso(posicion = game.at(4,2)),new Piso(posicion = game.at(6,2)),new Piso(posicion = game.at(7,2)),new Piso(posicion = game.at(9,2)),new Piso(posicion = game.at(10,2)),new Piso(posicion = game.at(11,2)),
			new Piso(posicion = game.at(1,1)),new Piso(posicion = game.at(2,1)),new Piso(posicion = game.at(3,1)),new Piso(posicion = game.at(4,1)),new Piso(posicion = game.at(5,1)),new Piso(posicion = game.at(6,1)),new Piso(posicion = game.at(7,1)),new Piso(posicion = game.at(9,1)),
			new Piso(posicion = game.at(10,1)),new Piso(posicion = game.at(11,1)),new Piso(posicion = game.at(12,1)),new Piso(posicion = game.at(13,1)),new Piso(posicion = game.at(14,1))]
			
//Cofres

const cofre1 = new Cofre(posicion = game.at(1,11), listaModificadores = [trampaQuitaVida,trampaReinicio,bonoVida])
const cofre2 = new Cofre(posicion = game.at(12,14), listaModificadores = [trampaQuitaVida,trampaReinicio,bonoVida])
const cofre3 = new Cofre(posicion = game.at(10,11), listaModificadores = [trampaQuitaVida,trampaReinicio,bonoVida])

//Llave

const llave1 = new Llave( posicion = game.at(1,2) )
const llave2 = new Llave( posicion = game.at(9,6) )
const llave3 = new Llave( posicion = game.at(14,1) )

//Malos

const malo1 = new Malo(posicion = game.at(1,9),direccion = derecha)

const malo2 = new Malo(posicion = game.at(9,6),direccion = arriba)

const malo3 = new Malo(posicion = game.at(9,4),direccion = derecha)

const malos = [malo1,malo2,malo3]