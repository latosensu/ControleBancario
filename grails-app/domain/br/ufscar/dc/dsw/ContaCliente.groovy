package br.ufscar.dc.dsw

class ContaCliente {

    static hasMany = [transacoes: Transacao]

    static constraints = {
        cliente (nullable: false)
        conta (nullable: false, unique: 'cliente')
    }

    boolean titular
    Conta conta
    Cliente cliente

    String toString() {
        return cliente.toString() + " X " + conta
    }
}
