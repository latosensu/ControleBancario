<%@ page import="br.ufscar.dc.dsw.ContaCliente" %>



<div class="fieldcontain ${hasErrors(bean: contaClienteInstance, field: 'cliente', 'error')} required">
	<label for="cliente">
		<g:message code="contaCliente.cliente.label" default="Cliente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cliente" name="cliente.id" from="${br.ufscar.dc.dsw.Cliente.list()}" optionKey="id" required="" value="${contaClienteInstance?.cliente?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contaClienteInstance, field: 'conta', 'error')} required">
	<label for="conta">
		<g:message code="contaCliente.conta.label" default="Conta" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="conta" name="conta.id" from="${br.ufscar.dc.dsw.Conta.list()}" optionKey="id" required="" value="${contaClienteInstance?.conta?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: contaClienteInstance, field: 'titular', 'error')} ">
	<label for="titular">
		<g:message code="contaCliente.titular.label" default="Titular" />
		
	</label>
	<g:checkBox name="titular" value="${contaClienteInstance?.titular}" />

</div>

<div class="fieldcontain ${hasErrors(bean: contaClienteInstance, field: 'transacoes', 'error')} ">
	<label for="transacoes">
		<g:message code="contaCliente.transacoes.label" default="Transacoes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${contaClienteInstance?.transacoes?}" var="t">
    <li><g:link controller="transacao" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="transacao" action="create" params="['contaCliente.id': contaClienteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'transacao.label', default: 'Transacao')])}</g:link>
</li>
</ul>


</div>

