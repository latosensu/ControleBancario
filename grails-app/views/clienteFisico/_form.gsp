<%@ page import="br.ufscar.dc.dsw.ClienteFisico" %>



<div class="fieldcontain ${hasErrors(bean: clienteFisicoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="clienteFisico.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="30" required="" value="${clienteFisicoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteFisicoInstance, field: 'endereco', 'error')} required">
	<label for="endereco">
		<g:message code="clienteFisico.endereco.label" default="Endereco" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="endereco" required="" value="${clienteFisicoInstance?.endereco}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteFisicoInstance, field: 'status', 'error')} required">
	<label for="status">
		<g:message code="clienteFisico.status.label" default="Status" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="status" from="${clienteFisicoInstance.constraints.status.inList}" required="" value="${clienteFisicoInstance?.status}" valueMessagePrefix="clienteFisico.status"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteFisicoInstance, field: 'cpf', 'error')} required">
	<label for="cpf">
		<g:message code="clienteFisico.cpf.label" default="Cpf" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="cpf" maxlength="14" required="" value="${clienteFisicoInstance?.cpf}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: clienteFisicoInstance, field: 'rg', 'error')} required">
	<label for="rg">
		<g:message code="clienteFisico.rg.label" default="Rg" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rg" maxlength="12" required="" value="${clienteFisicoInstance?.rg}"/>

</div>

