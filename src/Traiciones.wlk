class Traicion {

	var fecha
	var traidor
	var nuevaFamilia
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
		return nuevaFamilia.promedioLealtad() > traidor.lealtad() * 2
	}

	method concretarse() {
		self.atacarVictimas()
		self.cambiarFamilia()
	}
	
	method atacarVictimas() {
		victimas.forEach { victima => traidor.atacarA(victima) }	
	}
	
	method cambiarFamilia() {
		nuevaFamilia.agregarMiembro(traidor) 
		familiaActual.quitarMiembro(traidor)
		traidor.lealtad(traidor.maximoLealtad())
	}
	
	method desbaratarse() {
		traidor.morite()
	}
			
}
