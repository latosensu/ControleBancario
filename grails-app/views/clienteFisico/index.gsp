
<%@ page import="br.ufscar.dc.dsw.ClienteFisico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clienteFisico.label', default: 'ClienteFisico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-clienteFisico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-clienteFisico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'clienteFisico.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="endereco" title="${message(code: 'clienteFisico.endereco.label', default: 'Endereco')}" />
					
						<g:sortableColumn property="status" title="${message(code: 'clienteFisico.status.label', default: 'Status')}" />
					
						<g:sortableColumn property="cpf" title="${message(code: 'clienteFisico.cpf.label', default: 'Cpf')}" />
					
						<g:sortableColumn property="rg" title="${message(code: 'clienteFisico.rg.label', default: 'Rg')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${clienteFisicoInstanceList}" status="i" var="clienteFisicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${clienteFisicoInstance.id}">${fieldValue(bean: clienteFisicoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: clienteFisicoInstance, field: "endereco")}</td>
					
						<td>${fieldValue(bean: clienteFisicoInstance, field: "status")}</td>
					
						<td>${fieldValue(bean: clienteFisicoInstance, field: "cpf")}</td>
					
						<td>${fieldValue(bean: clienteFisicoInstance, field: "rg")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${clienteFisicoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
