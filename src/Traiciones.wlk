class Traicion {

	var fecha
	var traidor
	var nuevaFamilia

	var victimas = []
	 
	constructor(_fecha, _traidor, _nuevaFamilia) {
		fecha = _fecha
		traidor = _traidor
		nuevaFamilia = _nuevaFamilia
		self.agregarVictima()
	}
	
	method adelantarse(unosDias) {
		fecha = fecha.minusDays(unosDias)
		self.agregarVictima()
	}
	
	method agregarVictima() {
		victimas.add(traidor.miembroDeFamiliaCualquiera())		
	}

	method realizarse() {
		if (self.puedeRealizarse()) {
			self.concretarse()
		} else {
			self.desbaratate()
		}
	}
	
	method puedeRealizarse() {
		return nuevaFamilia.promedioLealtad() > traidor.familia().promedioLealtad() * 2
	}

	method concretarse() {
		self.atacarVictimas()
		self.cambiarFamilia()
	}
	
	method atacarVictimas() {
		victimas.forEach { victima => traidor.atacarA(victima) }	
	}
	
	method cambiarFamilia() {
		traidor.familia(nuevaFamilia) // Para hacerlo bien hay que removerlo de los miembros de la familia vieja y agregarlo a los miembros de la familia nueva
		traidor.lealtad(nuevaFamilia.integranteMasLeal().lealtad() + 1)
	}
	
	method desbaratate() {
		traidor.morite()
	}
			
}
