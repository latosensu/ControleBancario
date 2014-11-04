
<%@ page import="br.ufscar.dc.dsw.ContaCliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contaCliente.label', default: 'ContaCliente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-contaCliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-contaCliente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list contaCliente">
			
				<g:if test="${contaClienteInstance?.cliente}">
				<li class="fieldcontain">
					<span id="cliente-label" class="property-label"><g:message code="contaCliente.cliente.label" default="Cliente" /></span>
					
						<span class="property-value" aria-labelledby="cliente-label"><g:link controller="cliente" action="show" id="${contaClienteInstance?.cliente?.id}">${contaClienteInstance?.cliente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contaClienteInstance?.conta}">
				<li class="fieldcontain">
					<span id="conta-label" class="property-label"><g:message code="contaCliente.conta.label" default="Conta" /></span>
					
						<span class="property-value" aria-labelledby="conta-label"><g:link controller="conta" action="show" id="${contaClienteInstance?.conta?.id}">${contaClienteInstance?.conta?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${contaClienteInstance?.titular}">
				<li class="fieldcontain">
					<span id="titular-label" class="property-label"><g:message code="contaCliente.titular.label" default="Titular" /></span>
					
						<span class="property-value" aria-labelledby="titular-label"><g:formatBoolean boolean="${contaClienteInstance?.titular}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${contaClienteInstance?.transacoes}">
				<li class="fieldcontain">
					<span id="transacoes-label" class="property-label"><g:message code="contaCliente.transacoes.label" default="Transacoes" /></span>
					
						<g:each in="${contaClienteInstance.transacoes}" var="t">
						<span class="property-value" aria-labelledby="transacoes-label"><g:link controller="transacao" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:contaClienteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${contaClienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
