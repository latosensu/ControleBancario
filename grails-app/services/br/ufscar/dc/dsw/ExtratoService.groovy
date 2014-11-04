package br.ufscar.dc.dsw

import grails.transaction.Transactional

@Transactional
class ExtratoService {

    public static final Integer EXTRATO_ULTIMOS_7_DIAS = 7
    public static final Integer EXTRATO_ULTIMOS_15_DIAS = 15
    public static final Integer EXTRATO_ULTIMOS_30_DIAS = 30

    def serviceMethod() {

    }
}
