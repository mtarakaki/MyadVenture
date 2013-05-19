
<%@ page import="TEC.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-project" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list project">
			
				<g:if test="${projectInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="project.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${projectInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="project.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${projectInstance}" field="description"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${projectInstance?.ratings}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="project.ratings.label" default="Ratings" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${projectInstance}" field="ratings"/></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${projectInstance?.funding}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="project.description.label" default="Funding" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${projectInstance}" field="funding"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.videourl}">
				<li class="fieldcontain">
					<span id="logoUri-label" class="property-label"><g:message code="project.videourl.label" default="Video URL" /></span>
					
						<span class="property-value" aria-labelledby="videourl-label"><g:fieldValue bean="${projectInstance}" field="videourl"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.credits}">
				<li class="fieldcontain">
					<span id="credits-label" class="property-label"><g:message code="project.credits.label" default="Credits" /></span>
					
						<span class="property-value" aria-labelledby="credits-label"><g:fieldValue date="${projectInstance?.credits}" /></span>
					
				</li>
				</g:if>
                          
                                <g:if test="${projectInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="project.comments.label" default="Comments" /></span>
					
						<span class="property-value" aria-labelledby="comments-label"><g:fieldValue date="${projectInstance?.comments}" /></span>
					
				</li>
				</g:if>
                          
			
				<g:if test="${projectInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="project.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:link controller="profile" action="show" id="${projectInstance?.admin?.id}">${projectInstance?.admin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.availableRoles}">
				<li class="fieldcontain">
					<span id="availableRoles-label" class="property-label"><g:message code="project.availableRoles.label" default="Available Roles" /></span>
					
						<g:each in="${projectInstance.availableRoles}" var="a">
						<span class="property-value" aria-labelledby="availableRoles-label"><g:link controller="role" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.blogs}">
				<li class="fieldcontain">
					<span id="blogs-label" class="property-label"><g:message code="project.blogs.label" default="Blogs" /></span>
					
						<g:each in="${projectInstance.blogs}" var="b">
						<span class="property-value" aria-labelledby="blogs-label"><g:link controller="blog" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${projectInstance?.filledRoles}">
				<li class="fieldcontain">
					<span id="filledRoles-label" class="property-label"><g:message code="project.filledRoles.label" default="Filled Roles" /></span>
					
						<g:each in="${projectInstance.filledRoles}" var="f">
						<span class="property-value" aria-labelledby="filledRoles-label"><g:link controller="role" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${projectInstance?.id}" />
                                        <!--- need to allow projects to be able to add filled roles & unfilled rules -->
                                   //     <g:link controller="project" action="createAvailableRoles" id="${projectInstance?.id}">Add Available Role</g:link>
					<g:link class="edit" action="edit" id="${projectInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
