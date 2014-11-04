
<%@ page import="br.ufscar.dc.dsw.ClienteJuridico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clienteJuridico.label', default: 'ClienteJuridico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-clienteJuridico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-clienteJuridico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'clienteJuridico.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="endereco" title="${message(code: 'clienteJuridico.endereco.label', default: 'Endereco')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'clienteJuridico.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="cnpj" title="${message(code: 'clienteJuridico.cnpj.label', default: 'Cnpj')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteJuridicoInstanceList}" status="i" var="clienteJuridicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clienteJuridicoInstance.id}">${fieldValue(bean: clienteJuridicoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: clienteJuridicoInstance, field: "endereco")}</td>
					
						<td>${fieldValue(bean: clienteJuridicoInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: clienteJuridicoInstance, field: "cnpj")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clienteJuridicoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
