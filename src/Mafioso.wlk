import Rangos.*
import Familia.*
import Traiciones.*

class Mafioso {
	const property maximaLealtad = 100
	var property rango
	
	var estaMuerto = false
	var estaHerido = false
	
	var property lealtad = maximaLealtad
	
	var armas = []
	var subordinados = []
	
	// Punto A
	
	method duermeConLosPeces() {
		return estaMuerto
	}
	
	// Punto B
	
	method cantidadArmas() {
		return armas.size()
	}
	
	// Punto C
	
	method agregarArma(unArma) {
		armas.add(unArma)
	}
	
	// Punto D
	
	method sabeDespacharElegantemente() {
		return rango.sabeDespacharElegantemente(self)
	}
	
	method algunSubordinadoTieneArmaSutil() {
		return subordinados.any { subordinado => subordinado.tieneArmaSutil() }
	}
	
	method tieneArmaSutil() {
		return armas.any { arma => arma.esSutil() }
	}

	// Punto E
	
	method atacarFamilia(unaFamilia) {
		self.atacarA(unaFamilia.integranteMasPoderoso())
	}

	method atacarA(unMafioso) {
		rango.ataqueEntre(self, unMafioso)		
	}

	method algunSubordinado() {
		return subordinados.anyOne()		
	}

	method armaMenosUsada() {
		const arma = armas.first()
		armas.remove(arma)
		armas.add(arma)
		return arma
	}

	method armaMasAMano() {
		return armas.first()		
	}

	method morite() {
		estaMuerto = true		
	}
		
	method herite() {
		if (estaHerido) {
			self.morite()
		} else {
			estaHerido = true			
		}
	}
	
	// Punto F
	
	method reorganizate() {
		rango.reorganizar(self)
		self.aumentarLealtad()
	}

	method aumentarLealtad() {
		lealtad *= 1.1
	}
	
	method ascenderASubjefe() {
		rango = subjefe
	}
		
	method ascenderADon() {
		rango = don
	}
	
	method iniciarTraicion(_familiaActual, _familiaNueva, _fecha, _victima) {
		const traicion = new Traicion(
			traidor = self, 
			familiaActual = _familiaActual, 
			familiaNueva = _familiaNueva, 
			fecha = _fecha, 
			victimas = [_victima]
		)
		familiaActual.agregarTraicion(traicion)
	}
		
}

object donVito inherits Mafioso(rango = don) {

	// Punto E
	
	override method atacarA(unMafioso) {
		2.times { super(unMafioso) }		
	}

	
}