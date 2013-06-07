
<%@ page import="TEC.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'role.label', default: 'Role')}" />
                  <script type="text/javascript">   
$(document).ready(function() {  
  <g:if test="${session?.user}">
      
      $(".specialization_show").click( function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Update Specialization</h3>');
        $("#myModal .modal-body").load($(this).attr('href'));
        $('#myModal').modal('show');  
        return false;
      });
      
      $(".skillset_show").click( function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Update Skillset</h3>');
        $("#myModal .modal-body").load($(this).attr('href'));
        $('#myModal').modal('show');  
        return false;
      });
      
      $(".specialization_show").tooltip({
          position: {
                my: "center bottom-20",
                at: "center top",
                using: function( position, feedback ) {
                    $( this ).css( position );
                    $( "<div>" )
                        .addClass( "arrow" )
                        .addClass( feedback.vertical )
                        .addClass( feedback.horizontal )
                        .appendTo( this );
                }
            },
            track:true
      });
      
        $(".skillset_show").tooltip({
          position: {
                my: "center bottom-20",
                at: "center top",
                using: function( position, feedback ) {
                    $( this ).css( position );
                    $( "<div>" )
                        .addClass( "arrow" )
                        .addClass( feedback.vertical )
                        .addClass( feedback.horizontal )
                        .appendTo( this );
                }
            },
            track:true
      });
  
      $("#update_specialization").die("click").live("click", function () {        
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">New Specialization</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'specialization', action: 'create', params:[type: 'Personal'])}");
        $('#myModal').modal('show');  
      });
      
      $("#update_skillset").die("click").live("click", function () {        
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">New Skillset</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'skillset', action: 'create', params:[type: 'Personal'])}");
        $('#myModal').modal('show');  
      });
      
      $("#update_role").die("click").live("click", function () {        
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">New Role</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'role', action: 'create', params:[id: ventureInstance?.id])}");
        $('#myModal').modal('show');  
      });
      $("#fill_role").die("click").live("click", function () {        
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">New Role</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'role', action: 'fillrole', params:[id: roleInstance?.id])}");
        $('#myModal').modal('show');  
      });
  
  </g:if>
  
  /* 
   * Source: http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url
  var video_id = window.location.search.split('v=')[1];
  var ampersandPosition = video_id.indexOf('&');
  if(ampersandPosition != -1) {
    video_id = video_id.substring(0, ampersandPosition);
  }
  */
  
  });
  </script>   
	</head>
	<body>
		<a href="#show-role" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div id="show-role" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list role">
			
				<g:if test="${roleInstance?.owner}">
				<li class="fieldcontain">
					<span id="owner-label" class="property-label"><g:message code="role.owner.label" default="Owner" /></span>
					
						<span class="property-value" aria-labelledby="owner-label"><g:link controller="profile" action="show" id="${roleInstance?.owner?.id}">${roleInstance?.owner?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="role.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${roleInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.skillsets}">
				<li class="fieldcontain">
					<span id="skillsets-label" class="property-label"><g:message code="role.skillsets.label" default="Skillsets" /></span>
					
						<g:each in="${roleInstance.skillsets}" var="s">
						<span class="property-value" aria-labelledby="skillsets-label"><g:link controller="skillset" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.specializations}">
				<li class="fieldcontain">
					<span id="specializations-label" class="property-label"><g:message code="role.specializations.label" default="Specializations" /></span>
					
						<g:each in="${roleInstance.specializations}" var="s">
						<span class="property-value" aria-labelledby="specializations-label"><g:link controller="specialization" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${roleInstance?.ventures}">
				<li class="fieldcontain">
					<span id="ventures-label" class="property-label"><g:message code="role.ventures.label" default="Ventures" /></span>
					
						<span class="property-value" aria-labelledby="ventures-label"><g:link controller="venture" action="show" id="${roleInstance?.ventures?.id}">${roleInstance?.ventures?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
                        <g:form>
				<fieldset class="buttons">
                                        <!--- need to allow ventures to be able to add filled roles & unfilled rules -->
                                        <a href="#" id="fill_role" name="fill_role">Fill Role</a>
				</fieldset>
			</g:form>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${roleInstance?.id}" />
					<g:link class="edit" action="edit" id="${roleInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
