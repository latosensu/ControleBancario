<%@ page import="br.ufscar.dc.dsw.Transacao" %>



<div class="fieldcontain ${hasErrors(bean: transacaoInstance, field: 'contaCliente', 'error')} required">
    <label for="contaCliente">
        <g:message code="transacao.contaCliente.label" default="Conta Cliente"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="contaCliente" name="contaCliente.id" from="${br.ufscar.dc.dsw.ContaCliente.list()}" optionKey="id"
              required="" value="${transacaoInstance?.contaCliente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transacaoInstance, field: 'valor', 'error')} required">
    <label for="valor">
        <g:message code="transacao.valor.label" default="Valor"/>
        <span class="required-indicator">*</span>
    </label>
    <g:field name="valor" value="${fieldValue(bean: transacaoInstance, field: 'valor')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: transacaoInstance, field: 'data', 'error')} required">
    <label for="data">
        <g:message code="transacao.data.label" default="Data"/>
        <span class="required-indicator">*</span>
    </label>
    <g:datePicker name="data" precision="day" value="${transacaoInstance?.data}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transacaoInstance, field: 'quem', 'error')} required">
    <label for="quem">
        <g:message code="transacao.quem.label" default="Quem"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="quem" required="" value="${transacaoInstance?.quem}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transacaoInstance, field: 'motivo', 'error')} required">
    <label for="motivo">
        <g:message code="transacao.motivo.label" default="Motivo"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="motivo" required="" value="${transacaoInstance?.motivo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: transacaoInstance, field: 'tipo', 'error')} required">
    <label for="tipo">
        <g:message code="transacao.tipo.label" default="Tipo"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select name="tipo" from="${transacaoInstance.constraints.tipo.inList}" required=""
              value="${transacaoInstance?.tipo}" valueMessagePrefix="transacao.tipo"/>

</div>

