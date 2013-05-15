
<%@ page import="TEC.Project" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		
		<div id="list-project" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
                        <center>
                          <table>
				<thead>
					<tr>
						<g:sortableColumn property="name" title="${message(code: 'project.name.label', default: 'Name')}" />
					
						<!--- <g:sortableColumn property="dateOfIncorporation" title="${message(code: 'project.dateOfIncorporation.label', default: 'Date Of Incorporation')}" />  -->
					</tr>
				</thead>
				<tbody>
				<g:each in="${projectInstanceList}" status="i" var="projectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td> 
                                                  <a class="pull-left" href="#">
                                                    <img class="media-object" src="http://localhost:8081/uploads/no-pic-avatar.jpg" width="64px" height="64px"/>
                                                  </a>

                                                  <h4 class="media-heading"> <g:link controller="project" action="show" id="${projectInstance[0]}">${projectInstance[1]}</g:link></h4>
                                                  <div class="media"><small></small></div>
                                              </td>
					
			
					</tr>
				</g:each>
				</tbody>
			</table>
                        </center>
			<div class="pagination">
				<g:paginate total="${projectInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
