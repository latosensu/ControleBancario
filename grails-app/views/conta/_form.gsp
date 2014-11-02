<%@ page import="br.ufscar.dc.dsw.Conta" %>



<div class="fieldcontain ${hasErrors(bean: contaInstance, field: 'numero', 'error')} required">
	<label for="numero">
		<g:message code="conta.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="numero" required="" value="${contaInstance?.numero}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contaInstance, field: 'saldo', 'error')} required">
	<label for="saldo">
		<g:message code="conta.saldo.label" default="Saldo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="saldo" value="${fieldValue(bean: contaInstance, field: 'saldo')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: contaInstance, field: 'abertura', 'error')} required">
	<label for="abertura">
		<g:message code="conta.abertura.label" default="Abertura" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="abertura" precision="day"  value="${contaInstance?.abertura}"  />

</div>

