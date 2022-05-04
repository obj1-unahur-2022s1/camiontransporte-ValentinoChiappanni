import cosas.*

object camion {
	const cosas = []
	method cargar(unaCosa){
		cosas.add(unaCosa)
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method todoPesoPar(){
		return cosas.all({c=>c.peso().even()})
	}
	method hayAlgunoQuePesa(peso){
		return cosas.any({c=>c.peso()})
	}
	method elDeNivel(nivel){
		return cosas.find({c=>c.nivelPeligrosidad()==nivel})
	}
	method pesoTotal(){
		return cosas.sum({c=>c.peso()}) + self.pesoCamionVacio()
	}
	method pesoCamionVacio(){
		return 1000
	}
	method excedidoDePeso(){
		return self.pesoTotal()>2500
	}
	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({c=>c.nivelPeligrosidad()>=nivel})
	}
	method objetosMasPeligrososQue(cosa){
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	method tieneAlgoQuePesaEntre(min, max) {
		return cosas.any({c=>c.peso().between(min,max)})
	}
	method cosaMasPesada(){
		return cosas.max({c=>c.peso()})
	}
	method pesos(){
		return cosas.map({c=>c.peso()})
	}
	
}
