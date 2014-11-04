
<%@ page import="br.ufscar.dc.dsw.ClienteFisico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'clienteFisico.label', default: 'ClienteFisico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-clienteFisico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-clienteFisico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list clienteFisico">
			
				<g:if test="${clienteFisicoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="clienteFisico.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${clienteFisicoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteFisicoInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="clienteFisico.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${clienteFisicoInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteFisicoInstance?.status}">
				<li class="fieldcontain">
					<span id="status-label" class="property-label"><g:message code="clienteFisico.status.label" default="Status" /></span>
					
						<span class="property-value" aria-labelledby="status-label"><g:fieldValue bean="${clienteFisicoInstance}" field="status"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteFisicoInstance?.cpf}">
				<li class="fieldcontain">
					<span id="cpf-label" class="property-label"><g:message code="clienteFisico.cpf.label" default="Cpf" /></span>
					
						<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${clienteFisicoInstance}" field="cpf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteFisicoInstance?.rg}">
				<li class="fieldcontain">
					<span id="rg-label" class="property-label"><g:message code="clienteFisico.rg.label" default="Rg" /></span>
					
						<span class="property-value" aria-labelledby="rg-label"><g:fieldValue bean="${clienteFisicoInstance}" field="rg"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${clienteFisicoInstance?.contasCliente}">
				<li class="fieldcontain">
					<span id="contasCliente-label" class="property-label"><g:message code="clienteFisico.contasCliente.label" default="Contas Cliente" /></span>
					
						<g:each in="${clienteFisicoInstance.contasCliente}" var="c">
						<span class="property-value" aria-labelledby="contasCliente-label"><g:link controller="contaCliente" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:clienteFisicoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${clienteFisicoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
