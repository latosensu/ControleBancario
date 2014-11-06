package br.ufscar.dc.dsw

class ExtratoController {

    def extratoService

    def emitirExtrato(ContaCliente contaCliente, Integer numeroDias) {
        def extrato = []
        if (contaCliente) {
            extrato = extratoService.emitirExtrato(contaCliente, numeroDias)
        } else {
            flash.message = "conta não encontrada"
            redirect(controller: "contaCliente", action: "index")
            return
        }
        respond extrato, view: 'emitirExtrato', model: [transacaoInstanceCount: extrato.size(),
                                                        contaCliente: contaCliente,
                                                        numeroDias: numeroDias]
    }

}
