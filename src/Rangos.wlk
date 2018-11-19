object don {

	// Punto D
	
	method sabeDespacharElegantemente(unMafioso) {
		return true
	}
	
	// Punto E
	
	method ataqueEntre(unAtacante, unAtacado) {
		unAtacante.algunSubordinado().atacarA(unAtacado)
	}

	// Punto F
	
	method reorganizar(unMafioso) {
		// No hace nada
	}

}

object subjefe {

	// Punto D
	
	method sabeDespacharElegantemente(unMafioso) {
		return unMafioso.algunSubordinadoTieneArmaSutil()
	}
	
	// Punto E
	
	method ataqueEntre(unAtacante, unAtacado) {
		unAtacante.armaMasAMano().usarContra(unAtacado)
		unAtacante.rotarArmas()
	}

	// Punto F
	
	method reorganizar(unMafioso) {
		// No hace nada
	}

}

object soldado {

	// Punto D
	
	method sabeDespacharElegantemente(unMafioso) {
		return unMafioso.tieneArmaSutil()
	}
	
	// Punto E
	
	method ataqueEntre(unAtacante, unAtacado) {
		unAtacante.armaMasAMano().usarContra(unAtacado)
	}

	// Punto F
	
	method reorganizar(unMafioso) {
		if (unMafioso.cantidadArmas() > 5) {
			unMafioso.rango(subjefe)
		}
	}

}
