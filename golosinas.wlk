object bombon {
    var peso = 15
    method peso() = peso
    method precio() = 5
    method sabor() = frutilla
    method esLibreDeGluten() = true
    method recibirMordisco() {
        peso = ((peso * 0.8) - 1).max(0)
    }
}


object alfajor {
    var peso = 300
    method peso() = peso
    method precio() = 12
    method sabor() = chocolate
    method esLibreDeGluten() = false
    method recibirMordisco() {
        peso = peso * 0.8
    }    
}

object caramelo {
    var peso = 5
    method peso() = peso
    method precio() = 1
    method sabor() = frutilla
    method esLibreDeGluten() = true
    method recibirMordisco() {
        peso = (peso - 1).max(0)
    }
}

object chupetin {
    var peso = 7
    method peso() = peso
    method precio() = 2
    method sabor() = naranja
    method esLibreDeGluten() = true
    method recibirMordisco() {
        peso = peso - peso * 0.1 * peso.div(2).min(1)
        // if (peso >= 2) { peso = peso * 0.9 }
    }
}

object oblea {
    var peso = 250
    method peso() = peso
    method precio() = 5
    method sabor() = vainilla
    method esLibreDeGluten() = false
    method recibirMordisco() {
        peso = 0.max(peso - if(peso>70) peso * 0.5 else peso * 0.25) 
    }
}

object chocolatin {
    var pesoInicial = 0
    var gramosConsumidos = 0
    method setPesoInicial(unValor) {pesoInicial = unValor}
    method peso() = 0.max(pesoInicial - gramosConsumidos)
    method precio() = 0.5 * pesoInicial
    method sabor() = chocolate
    method esLibreDeGluten() = false
    method recibirMordisco() {
        gramosConsumidos += 2 
    }  
}

object golosinaBaniada {
    var golosinaBase = caramelo
    var gramosDeBaniado = 4
    method cambiarGolosinaBase(unaGolosina) {
        golosinaBase = unaGolosina
        gramosDeBaniado = 4
    }
    method precio() = golosinaBase.precio() + 2
    method peso() = golosinaBase.peso() + gramosDeBaniado
    method sabor() = golosinaBase.sabor()
    method esLibreDeGluten() = golosinaBase.esLibreDeGluten()
    method recibirMordisco() {
        golosinaBase.recibirMordisco()
        gramosDeBaniado = (gramosDeBaniado - 2).max(0)
    }  
}

object pastillaTuttiFrutti {
    var esLibreDeGluten = false
    var sabor = frutilla
    method peso() = 5
    method hacerLibreDeGluten() {esLibreDeGluten=true}
    method hacerNoLibreDeGluten() {esLibreDeGluten=false}
    method precio() = if(esLibreDeGluten) 7 else 10
    method esLibreDeGluten() = esLibreDeGluten
    method sabor() = sabor
    method recibirMordisco() {
        sabor = sabor.siguienteSabor()
    }
}

object pastillaTuttiFrutti2 {
    var esLibreDeGluten = false
    var mordiscos = 0
    method peso() = 5
    method hacerLibreDeGluten() {esLibreDeGluten=true}
    method hacerNoLibreDeGluten() {esLibreDeGluten=false}
    method precio() = if(esLibreDeGluten) 7 else 10
    method esLibreDeGluten() = esLibreDeGluten
    method sabor() = [frutilla,chocolate,naranja].get(mordiscos%3)
    method recibirMordisco() {
        mordiscos += 1
    }
}

object frutilla { method siguienteSabor() = chocolate }

object chocolate { method siguienteSabor() = naranja }

object naranja { method siguienteSabor() = frutilla }

object vainilla { }

