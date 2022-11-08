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

object diagonalSuperiorDerecha{
	
	method siguientePosicion(pos) = (pos.right(1)).up(1) 
}

object diagonalSuperiorIzquierda{
	
	method siguientePosicion(pos) = (pos.left(1)).up(1) 
}

object diagonalInferiorIzquierda{
	
	method siguientePosicion(pos) = (pos.left(1)).down(1) 
}

object diagonalInferiorDerecha{
	
	method siguientePosicion(pos) = (pos.right(1)).down(1)
}
