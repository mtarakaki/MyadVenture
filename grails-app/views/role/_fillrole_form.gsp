<%@ page import="TEC.Role" %>

<g:hiddenField name="filled" value= "${false}" />

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="role.name.label" default="Role Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="name" name="name.id" from="${TEC.Role.list()}" optionKey="id" required="" value="${roleInstance?.name}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: roleInstance, field: 'owner', 'error')} required">
	<label for="owner">
		<g:message code="role.owner.label" default="Role Owner" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="owner" name="owner.id" from="${TEC.Profile.list()}" optionKey="id" required="" value="${roleInstance?.owner?.id}" class="many-to-one"/>
</div>