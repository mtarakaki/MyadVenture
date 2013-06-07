<%@ page import="TEC.Role" %>

      <div id="edit-role" class="content scaffold-edit" role="main">
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
              <g:form method="post" >
                      <g:hiddenField name="id" value="${roleInstance?.id}" />
                      <fieldset class="form">
                              <g:render template="fillrole_form"/>
                      </fieldset>
                      <fieldset class="buttons">
                              <g:actionSubmit class="save" action="fillrole_save" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                              <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                      </fieldset>
              </g:form>
      </div>

