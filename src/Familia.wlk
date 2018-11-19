import Armas.*
import Rangos.*

class Familia {
	
	var miembros = []
	var traiciones = []	
	
	// Punto B
	
	method mafiosoMasPeligroso() {
		return miembros.max { miembro => miembro.cantidadArmas() }
	}
	
	// Punto C
	
	method armasParaTodos() {
		miembros.forEach { miembro => miembro.agregarArma(new Revolver()) }
	}
	
	// Punto E
	
	method atacarA(otraFamilia) {
		miembros.forEach { miembro => miembro.atacarFamilia(otraFamilia) }
	}
	
	method integranteMasPoderoso() {
		return self.miembrosVivos().max { miembro => miembro.cantidadArmas() }
	}
	
	method miembrosVivos() {
		return miembros.filter { miembro => not miembro.duermeConLosPeces() } 
	}
	
	// Punto F
	
	method reorganizarse() {
		self.reorganizarMiembrosVivos()
		self.miembroMasLeal().rango(don)
	}
	
	method reorganizarMiembrosVivos() {
		self.miembrosVivos().forEach { miembro => miembro.reorganizate() }
	}
	
	method miembroMasLeal() {
		return self.miembrosQueSabenDespacharElegantemente().max { miembro => miembro.lealtad() }
	}
	
	method miembrosQueSabenDespacharElegantemente() {
		return self.miembrosVivos().filter { miembro => miembro.sabeDespacharElegantemente() }	
	}
	method agregarMiembre(mafioso){
		miembros.add(mafioso)
	}	
	method quitarMiembro(mafioso){
		miembros.quitar(mafioso)
	}
	method agregarTraicion(traicion){
		traiciones.add(traicion)
	}
}