object knightRider {
    method peso() = 500
    method nivelDePeligrosidad() = 10
    method bulto() = 1
    method consecuenciaDeLaCarga(){

    }
}

object bumblebee {
    var esRobot = false
    method peso() = 800
    method nivelDePeligrosidad() = if(esRobot) 30 else 15
    method cambiarARobot(){
        esRobot = true
    }
    method esRobot() = esRobot
    method bulto() = 2
    method consecuenciaDeLaCarga(){
        self.cambiarARobot()
    }
}

object paqueteDeLadrillos {
    var cantidadDeLadrillos = 0
    method peso() = cantidadDeLadrillos * 2
    method nivelDePeligrosidad() = 2
    method agregarLadrillos(unaCantidad){
        cantidadDeLadrillos += unaCantidad.max(0).min(100) // para acotar entre 0 y 100
    }
    method cantidadDeLadrillos() = cantidadDeLadrillos
    method bulto() = if(self.cantidadDeLadrillos() < 100) 1
                    else if (self.cantidadDeLadrillos().between(101, 300)) 2
                    else 3
    method consecuenciaDeLaCarga(){
        self.agregarLadrillos(12)
    }
}

object arenaAGranel {
    var peso = 0
    method peso() = peso
    method peso(unaCantidad){
        peso = unaCantidad
    }
    method nivelDePeligrosidad() = 1
    method bulto() = 1
    method consecuenciaDeLaCarga(){
        peso -= 10
    }
}

object bateriaAntiaerea {
    var estaConMisiles = false
    method peso() = if(estaConMisiles) 300 else 200
    method nivelDePeligrosidad() = if(estaConMisiles) 100 else 0
    method cargarMisiles(){
        estaConMisiles = true
    }
    method descargarMisiles(){
        estaConMisiles = false
    }
    method bulto() = if(estaConMisiles) 2 else 1
    method consecuenciaDeLaCarga(){
        self.cargarMisiles()
    }
    method estaConMisiles() = estaConMisiles
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

    method bulto() = 1 + cosasDelContenedor.sum({c => c.bulto()})
    method consecuenciaDeLaCarga() = cosasDelContenedor.forEach({c => c.consecuenciaDeLaCarga()})
}

object residuosRadiactivos {
    var property peso = 0
    method nivelDePeligrosidad() = 200
    method bulto() = 1
    method consecuenciaDeLaCarga(){
        peso += 15
    }
}

object embalajeDeSeguridad {
    var objetoEnvuelto = null
    method peso() = objetoEnvuelto.peso()
    method nivelDePeligrosidad() = objetoEnvuelto.nivelDePeligrosidad() / 2
    method cambiarObjetoEnvuelto(nuevaCosa){
        objetoEnvuelto = nuevaCosa
    }
    method bulto() = 2
    method consecuenciaDeLaCarga(){

    }
}