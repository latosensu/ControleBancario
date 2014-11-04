package br.ufscar.dc.dsw

class ClienteFisico extends Cliente{

    static constraints = {
        cpf (blank: false, unique: true, cpf:true, size: 14..14)
        rg (blank: false, size: 1..12)
    }

    String rg
    String cpf

    String toString() {
        return cpf
    }
}
