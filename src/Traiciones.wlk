class Traicion {

	var fecha
	var traidor
	var familiaNueva
	var familiaActual
	var victimas = []

	method adelantarse(unosDias, victima) {
		fecha = fecha.minusDays(unosDias)
		victimas.add(victima)
	}
	
	method realizarse() {
		if (self.puedeRealizarse()) {
			self.concretarse()
		} else {
			self.desbaratarse()
		}
	}
	
	method puedeRealizarse() {
		return familiaNueva.promedioLealtad() > traidor.lealtad() * 2
	}

	method concretarse() {
		self.atacarVictimas()
		self.cambiarFamilia()
	}
	
	method atacarVictimas() {
		victimas.forEach { victima => traidor.atacarA(victima) }	
	}
	
	method cambiarFamilia() {
		familiaNueva.agregarMiembro(traidor) 
		familiaActual.quitarMiembro(traidor)
		traidor.lealtad(traidor.maximoLealtad())
	}
	
	method desbaratarse() {
		traidor.morite()
	}
			
}
