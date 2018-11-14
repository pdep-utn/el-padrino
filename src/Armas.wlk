class Revolver {
	
	var cantidadBalas = 6
	
	// Punto D
	
	method esSutil() {
		return cantidadBalas == 1
	}
	
	// Punto E
	
	method usarContra(unMafioso) {
		if (cantidadBalas > 0) {
			unMafioso.morite()
			cantidadBalas--
		}
	}
	
}

class Escopeta {

	// Punto D	

	method esSutil() {
		return false
	}
	
	// Punto E
	
	method usarContra(unMafioso) {
		unMafioso.herite()
	}
	
}

class Cuerda {
	
	var esDeBuenaCalidad
	
	// Punto D
	
	method esSutil() {
		return true
	}
	
	// Punto E
	
	method usarContra(unMafioso) {
		if (esDeBuenaCalidad) {
			unMafioso.morite()
		}
	}
	
}