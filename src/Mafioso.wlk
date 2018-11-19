import Rangos.*
import Familia.*
import Traiciones.*

class Mafioso {
	const property maximaLealtad = 100
	var property rango
	//var property familia	
	
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

	method rotarArmas() {
		var arma = armas.first()
		armas.remove(arma)
		armas.add(arma)
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
	
	method iniciarTraicion(familiaActual, nuevaFamilia, fecha, victima){
		familiaActual.agregarTraicion(new Traicion(traidor = self, familiaActual = familiaActual, nuevaFamilia = nuevaFamilia, fecha = fecha, victimas = [victima]))
	}
		
}

object donVito inherits Mafioso(rango = don) {

	// Punto E
	
	override method atacarA(unMafioso) {
		2.times { x=> super(unMafioso) }		
	}

	
}