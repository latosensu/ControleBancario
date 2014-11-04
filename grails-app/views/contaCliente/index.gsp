
<%@ page import="br.ufscar.dc.dsw.ContaCliente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'contaCliente.label', default: 'ContaCliente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-contaCliente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-contaCliente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="contaCliente.cliente.label" default="Cliente" /></th>
					
						<th><g:message code="contaCliente.conta.label" default="Conta" /></th>
					
						<g:sortableColumn property="titular" title="${message(code: 'contaCliente.titular.label', default: 'Titular')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contaClienteInstanceList}" status="i" var="contaClienteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contaClienteInstance.id}">${fieldValue(bean: contaClienteInstance, field: "cliente")}</g:link></td>
					
						<td>${fieldValue(bean: contaClienteInstance, field: "conta")}</td>
					
						<td><g:formatBoolean boolean="${contaClienteInstance.titular}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contaClienteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
