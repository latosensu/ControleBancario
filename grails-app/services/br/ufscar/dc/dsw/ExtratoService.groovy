package br.ufscar.dc.dsw

import grails.transaction.Transactional

@Transactional
class ExtratoService {

    public static final Integer EXTRATO_ULTIMOS_7_DIAS = 7
    public static final Integer EXTRATO_ULTIMOS_15_DIAS = 15
    public static final Integer EXTRATO_ULTIMOS_30_DIAS = 30

    def emitirExtrato(ContaCliente contaCliente, Integer tipoExtrato) {
        int numeroDias = EXTRATO_ULTIMOS_7_DIAS
        switch (tipoExtrato) {
            case EXTRATO_ULTIMOS_7_DIAS:
                break
            case EXTRATO_ULTIMOS_15_DIAS:
                numeroDias = EXTRATO_ULTIMOS_15_DIAS
                break
            case EXTRATO_ULTIMOS_30_DIAS:
                numeroDias = EXTRATO_ULTIMOS_30_DIAS
                break
        }

        Calendar calendar = Calendar.getInstance(); //data atual
        Date dataMaxima = calendar.time
        calendar.add(-numeroDias, Calendar.DAY_OF_YEAR); //subtraindo o número de dias selecionado
        Date dataMinima = calendar.time

        return contaCliente.transacoes.findResults {
            le('data', dataMaxima)
            ge('data', dataMinima)
        }

    }
}
