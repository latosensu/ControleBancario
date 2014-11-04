package br.ufscar.dc.dsw

class Transacao {

    public static final String CREDITO = "CRÉDITO"
    public static final String DEBITO = "DÉBITO"

    static constraints = {
        contaCliente (nullable: false)
        valor (nullable: false, min: 0.1d)
        data (nullable: false)
        quem (nullable: false)
        motivo (nullable: false)
        tipo (nullable: false, inList: CREDITO, DEBITO)
    }

    Date data
    double valor
    String quem
    String motivo
    String tipo
    ContaCliente contaCliente

    String toString() {
        return "[" + tipo + "] - " + motivo + " - R\$ " + valor
    }
}
