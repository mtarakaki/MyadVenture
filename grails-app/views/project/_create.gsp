<%@ page import="TEC.Profile" %>
<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="project.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${projectInstance?.name}"/>
</div>

<label for="logoUri">
   Logo
</label>
<g:field type="file" name="logoUri"/>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="project.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${projectInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'dateOfIncorporation', 'error')} required">
	<label for="dateOfIncorporation">
		<g:message code="project.dateOfIncorporation.label" default="Date Of Incorporation" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="dateOfIncorporation" precision="day" required="" value="${projectInstance?.dateOfIncorporation}"  />
</div>
