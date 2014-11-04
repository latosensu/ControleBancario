
<%@ page import="br.ufscar.dc.dsw.Conta" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'conta.label', default: 'Conta')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-conta" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="list" action="listarContasComSaldoPositivo"><g:message code="conta.listarContasComSaldoPositivo.label"/></g:link></li>
			</ul>
		</div>
		<div id="list-conta" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="numero" title="${message(code: 'conta.numero.label', default: 'Numero')}" />
					
						<g:sortableColumn property="saldo" title="${message(code: 'conta.saldo.label', default: 'Saldo')}" />
					
						<g:sortableColumn property="abertura" title="${message(code: 'conta.abertura.label', default: 'Abertura')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${contaInstanceList}" status="i" var="contaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${contaInstance.id}">${fieldValue(bean: contaInstance, field: "numero")}</g:link></td>
					
						<td>${fieldValue(bean: contaInstance, field: "saldo")}</td>
					
						<td><g:formatDate date="${contaInstance.abertura}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${contaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
