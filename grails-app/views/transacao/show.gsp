<%@ page import="br.ufscar.dc.dsw.Transacao" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'transacao.label', default: 'Transacao')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-transacao" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-transacao" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list transacao">

        <g:if test="${transacaoInstance?.contaCliente}">
            <li class="fieldcontain">
                <span id="contaCliente-label" class="property-label"><g:message code="transacao.contaCliente.label"
                                                                                default="Conta Cliente"/></span>

                <span class="property-value" aria-labelledby="contaCliente-label"><g:link controller="contaCliente"
                                                                                          action="show"
                                                                                          id="${transacaoInstance?.contaCliente?.id}">${transacaoInstance?.contaCliente?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

        <g:if test="${transacaoInstance?.valor}">
            <li class="fieldcontain">
                <span id="valor-label" class="property-label"><g:message code="transacao.valor.label"
                                                                         default="Valor"/></span>

                <span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${transacaoInstance}"
                                                                                         field="valor"/></span>

            </li>
        </g:if>

        <g:if test="${transacaoInstance?.data}">
            <li class="fieldcontain">
                <span id="data-label" class="property-label"><g:message code="transacao.data.label"
                                                                        default="Data"/></span>

                <span class="property-value" aria-labelledby="data-label"><g:formatDate
                        date="${transacaoInstance?.data}"/></span>

            </li>
        </g:if>

        <g:if test="${transacaoInstance?.quem}">
            <li class="fieldcontain">
                <span id="quem-label" class="property-label"><g:message code="transacao.quem.label"
                                                                        default="Quem"/></span>

                <span class="property-value" aria-labelledby="quem-label"><g:fieldValue bean="${transacaoInstance}"
                                                                                        field="quem"/></span>

            </li>
        </g:if>

        <g:if test="${transacaoInstance?.motivo}">
            <li class="fieldcontain">
                <span id="motivo-label" class="property-label"><g:message code="transacao.motivo.label"
                                                                          default="Motivo"/></span>

                <span class="property-value" aria-labelledby="motivo-label"><g:fieldValue bean="${transacaoInstance}"
                                                                                          field="motivo"/></span>

            </li>
        </g:if>

        <g:if test="${transacaoInstance?.tipo}">
            <li class="fieldcontain">
                <span id="tipo-label" class="property-label"><g:message code="transacao.tipo.label"
                                                                        default="Tipo"/></span>

                <span class="property-value" aria-labelledby="tipo-label"><g:fieldValue bean="${transacaoInstance}"
                                                                                        field="tipo"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: transacaoInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${transacaoInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
