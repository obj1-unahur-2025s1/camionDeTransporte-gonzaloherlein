object camion {
    const cosas = []

    method tara() = 1000

    method cargar(unaCosa){
        cosas.add(unaCosa)
    }

    method descargar(unaCosa){
        cosas.remove(unaCosa)
    }

    method pesoTotal() =  self.tara() + self.pesoTotalDeLasCosasDelCamion()

    method pesoTotalDeLasCosasDelCamion() = cosas.sum({cosa => cosa.peso()})

    method siElPesoDeTodasLasCosasSonNumerosPares() = cosas.all({cosa => cosa.peso().even()})

    method hayAlgunaCosaQuePese_(unValor) = cosas.any({cosa => cosa.peso() == unValor})    

    method obtenerLaPrimerCosaQueTengaUnNivelDePeligrosidadDe_(nivelDePeligrosidad) = cosas.find({cosa => cosa.nivelDePeligrosidad() == nivelDePeligrosidad})

    method obtenerTodasLasCosasQueTenganUnNivelDePeligrosidadDe_(nivelDePeligrosidad){
        return cosas.filter({
            cosa => cosa.nivelDePeligrosidad() > nivelDePeligrosidad
        })
    }

    method obtenerLasCosasQueSuperenLaPeligrosidadDe_(unaCosa) = cosas.filter({cosa => cosa.nivelDePeligrosidad() > unaCosa.nivelDePeligrosidad()})

    method elCamionEstaExcedidoDelPesoMaximo() = self.pesoTotal() > 2500

    method ningunaCosaSuperaElNivelDePeligrosidad_(nivelDePeligrosidad) = cosas.all({cosa => cosa.nivelDePeligrosidad() < nivelDePeligrosidad})
    
    method elCamionPuedeCircularEnRuta(nivelDePeligrosidadDelViaje) = !self.elCamionEstaExcedidoDelPesoMaximo() && self.ningunaCosaSuperaElNivelDePeligrosidad_(nivelDePeligrosidadDelViaje)

    method elCamionTieneUnaCosaQuePeseEntre_Y_(pesoMinimo,pesoMaximo) = cosas.any({cosa => cosa.peso().between(pesoMinimo, pesoMaximo)})

    method obtenerLaCosaMasPesadaQueTengaCargada() = cosas.max({cosa => cosa.peso()})
}