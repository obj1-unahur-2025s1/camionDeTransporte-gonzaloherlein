object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
}

object bumblebee {
    var esRobot = true
    method peso() = 800
    method nivelDePeligrosidad() = if(esRobot) 30 else 15
    method cambiarDeForma(){
        esRobot = !esRobot
    }
}

object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0
    method peso() = cantidadDeLadrillos * 2
    method nivelDePeligrosidad() = 2
    method agregarLadrillos(unaCantidad){
        cantidadDeLadrillos = unaCantidad.max(0).min(100) // para acotar entre 0 y 100
    }

    method cantidadDeLadrillos() = cantidadDeLadrillos
}

object arenaAGranel {
    var property peso = 0
    method peso() = peso
    method nivelDePeligrosidad() = 1
}

object bateriaAntiaerea {
    var estaConMisiles = true
    method peso() = if(estaConMisiles) 300 else 200
    method nivelDePeligrosidad() = if(estaConMisiles) 100 else 0
    method cambiarEstadoConMisiles(){
        estaConMisiles = !estaConMisiles
    }
}

object contenedorPortuario {
    const cosasDelContenedor = []

    method cosasDelContenedor() = cosasDelContenedor

    method pesoDeTodasLasCosas() = cosasDelContenedor.sum({cosa => cosa.peso()})
    

    method cosaMasPeligrosa() = cosasDelContenedor.max({cosa => cosa.nivelDePeligrosidad()})

    method agregarCosasAlContenedor(unaCosa){
        cosasDelContenedor.add(unaCosa)
    }

    method peso() = 100 + self.pesoDeTodasLasCosas()

    method nivelDePeligrosidad() = if(cosasDelContenedor.isEmpty()) 0 else self.cosaMasPeligrosa().nivelDePeligrosidad()
}

object residuosRadiactivos {
    var property peso = 0
    method nivelDePeligrosidad() = 200
}

object embalajeDeSeguridad {
    var objetoEnvuelto = null
    method peso() = objetoEnvuelto.peso()
    method nivelDePeligrosidad() = objetoEnvuelto.nivelDePeligrosidad() / 2
    method cambiarObjetoEnvuelto(nuevaCosa){
        objetoEnvuelto = nuevaCosa
    }
}