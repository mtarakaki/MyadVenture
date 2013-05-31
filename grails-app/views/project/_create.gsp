<%@ page import="TEC.Profile" %>
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

<!--
<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'ratings', 'error')} required">
	<label for="description">
		<g:message code="project.description.label" default="Ratings" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ratings" required="" value="${projectInstance?.ratings}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: projectInstance, field: 'funding', 'error')} required">
	<label for="funding">
		<g:message code="project.description.label" default="Funding" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="funding" required="" value="${projectInstance?.funding}"/>
</div>
-->

<div>
	<label for="videourl">
		<g:message code="project.videourl.label" default="Video Url" />
	</label>
	<g:textField name="videourl" required="false" value="${projectInstance?.videourl}"/>
</div>

