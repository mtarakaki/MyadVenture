<%@ page import="TEC.Role" %>


<g:hiddenField name="ventureid" value="${ventureId}" />
<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="role.name.label" default="Name" />
		
	</label>
	<g:textField name="name" maxlength="25" value="${roleInstance?.name}"/>
        
</div>