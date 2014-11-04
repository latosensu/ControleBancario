package br.ufscar.dc.dsw

class ClienteJuridico extends Cliente {

    static constraints = {
        cnpj (blank: false, unique: true, cnpj: true, size: 18..18)
    }

    String cnpj

    String toString() {
        return cnpj
    }
}
