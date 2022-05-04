object knightRider {
	method peso() = 500
	method peligrosidad()= 10
}

object bumblebee {
	var esAuto = true
	method peso() = 500
	method peligrosidad() = if(esAuto){15}else{30} 
	method transformar(){esAuto = !esAuto}
}

object paqueteLadrillos{
	var property cantLadrillos = 0
	method peso() = cantLadrillos * 2
	method peligrosidad()= 2
}


object arena {
	var property peso = 0
	method peligrosidad()= 1
}

object bateriaAntiarea {
	var tieneMisiles = true
	method peso() = if(tieneMisiles){300}else{200}
	method peligrosidad()= if(tieneMisiles){100}else{0}
	method cambiarEstadoDeMisiles(){tieneMisiles = !tieneMisiles}
}

object contenedor {
	const property cosas = []
	method agregarObjeto(unObjeto) { cosas.add(unObjeto) }
	method sacarObjeto(unObjeto) { cosas.remove(unObjeto) }
	method peso() = 100 + cosas.sum({c=>c.peso()})
	method objetoConMayorPeligrosidad() = cosas.max({c=>c.peligrosidad()}) 
	method peligrosidad() = if(cosas.isEmpty()){0}else{self.objetoConMayorPeligrosidad().peligrosidad()}
}

object residuosRadioactivos {
	var property peso = 0
	method peligrosidad() = 200
}

object embalajeSeguridad {
	var property cosa
	method peso() = cosa.peso()
	method peligrosidad() = cosa.peligrosidad() / 2
}




