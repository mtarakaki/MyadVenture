<%@ page import="TEC.Role" %>

<div id="create-role" class="content scaffold-create" role="main">
        <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${roleInstance}">
        <ul class="errors" role="alert">
                <g:eachError bean="${roleInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                </g:eachError>
        </ul>
        </g:hasErrors>
        <g:form action="save" >
                <fieldset class="form">
                        <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons">
                        <g:submitButton name="create" class="save" value="${message(code: 'Create Role', default: 'Create')}" />
                </fieldset>
        </g:form>
</div>
	