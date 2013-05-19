<%@ page import="TEC.Project" %>



<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="project.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${projectInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="project.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${projectInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'admin', 'error')} required">
	<label for="admin">
		<g:message code="project.admin.label" default="Admin" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="admin" name="admin.id" from="${TEC.Profile.list()}" optionKey="id" required="" value="${projectInstance?.admin?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'availableRoles', 'error')} ">
	<label for="availableRoles">
		<g:message code="project.availableRoles.label" default="Available Roles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.availableRoles?}" var="a">
    <li><g:link controller="role" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="role" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'role.label', default: 'Role')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'blogs', 'error')} ">
	<label for="blogs">
		<g:message code="project.blogs.label" default="Blogs" />
		
	</label>
	<g:select name="blogs" from="${TEC.Blog.list()}" multiple="multiple" optionKey="id" size="5" value="${projectInstance?.blogs*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'filledRoles', 'error')} ">
	<label for="filledRoles">
		<g:message code="project.filledRoles.label" default="Filled Roles" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${projectInstance?.filledRoles?}" var="f">
    <li><g:link controller="role" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="role" action="create" params="['project.id': projectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'role.label', default: 'Role')])}</g:link>
</li>
</ul>

</div>

