import juego.*
import direcciones.*
import personajes.*
import wollok.game.*
import elementosMapa.*

// Partes del Laberinto

const contorno = new ParteLaberinto(paredes = [new Pared(posicion = game.at(0,16)),new Pared(posicion = game.at(1,16)),new Pared(posicion = game.at(2,16)),new Pared(posicion = game.at(3,16)),new Pared(posicion = game.at(4,16)),new Pared(posicion = game.at(5,16)),new Pared(posicion = game.at(6,16)),new Pared(posicion = game.at(7,16)),new Pared(posicion = game.at(8,16)),new Pared(posicion = game.at(9,16)),new Pared(posicion = game.at(10,16)),new Pared(posicion = game.at(11,16)),new Pared(posicion = game.at(12,16)),new Pared(posicion = game.at(13,16)),new Pared(posicion = game.at(15,16)),new Pared(posicion = game.at(0,17)),new Pared(posicion = game.at(1,17)),new Pared(posicion = game.at(2,17)),new Pared(posicion = game.at(3,17)),new Pared(posicion = game.at(4,17)),new Pared(posicion = game.at(5,17)),new Pared(posicion = game.at(6,17)),new Pared(posicion = game.at(7,17)),new Pared(posicion = game.at(8,17)),new Pared(posicion = game.at(9,17)),new Pared(posicion = game.at(10,17)),new Pared(posicion = game.at(11,17)),new Pared(posicion = game.at(12,17)),new Pared(posicion = game.at(13,17)),new Pared(posicion = game.at(14,16)),new Pared(posicion = game.at(14,17)),new Pared(posicion = game.at(15,17))])

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