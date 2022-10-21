object arriba {
	
	method opuesta() = abajo
	
	method siguientePosicion(pos) = pos.up(1) 	
}

object derecha {
	
	method opuesta() = izquierda
	
	method siguientePosicion(pos) = pos.right(1) 	
}

object abajo 
{
	method opuesta() = arriba
	
	method siguientePosicion(pos) = pos.down(1)
}

object izquierda 
{
	method opuesta() = derecha
	
	method siguientePosicion(pos) = pos.left(1)
}