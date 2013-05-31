<%@ page import="TEC.Project" %>
<%@ page import="TEC.Image" %>



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
	
<div>
	<label for="videourl">
		<g:message code="project.videourl.label" default="Video Url" />
	</label>
	<g:textField name="videourl" required="false" value="${projectInstance?.videourl}"/>
</div>

  <g:set var="counter" value="${0}" />
  
<g:each in="${projectInstance?.images}">
  <div>
          <br/>
          <label for="images">
                  <g:message code="project.images.label" default="Image ${counter + 1}" />
          </label>
          <g:textField name="images[${counter}].imageUri" value="${projectInstance?.images.imageUri[counter]}" />
          <br/>
          <g:textArea name="images[${counter}].description" required="false" value="${projectInstance?.images.description[counter]}"/>
          
          <g:set var="counter" value="${counter + 1}" /><br/>
          
  </div>
</g:each>
  
  <div>
          <br/>
          <label for="images">
                  <g:message code="project.images.label" default="Image ${counter + 1}" />
          </label>
          <g:textField name="images[${counter}].imageUri" value="${projectInstance?.images.imageUri[counter]}" />
          <br/>
          <g:textArea name="images[${counter}].description" required="false" value="${projectInstance?.images.description[counter]}"/>
  </div>