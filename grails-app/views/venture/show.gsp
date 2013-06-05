<%@ page import="TEC.Venture" %>

<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'venture.label', default: 'Venture')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>	

  <script type="text/javascript">   
$(document).ready(function() {  
  <g:if test="${session?.user}">
      $(".createventure").click( function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Create Venture</h3>');
        $("#myModal .modal-body").load($(this).attr('href'));
        $('#myModal').modal('show');  
        return false;
      });
      
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
        $("#myModal .modal-body").load("${createLink(controller: 'role', action: 'create', )}");
        $('#myModal').modal('show');  
      });
  
      $("#send_message").die("click").live("click", function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Send Message</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'message', action: 'single', params:[id: profileInstance?.id])}");
        $('#myModal').modal('show'); 
        return false;
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
  <div>
      <div class="message" name="message" id="message" role="status"><g:if test="${flash.message}">${flash.message}</g:if></div>
    
    <g:if test="${!profileInstance?.suspended}">
      <!-- Right side -->
      <div class="span11">
        
        <div class="ventureHeader">
        
          <span class="ventureIcon">
                <g:if test="${ventureInstance?.logoUri}">
                  <img src="${ventureInstance?.logoUri}" class="img-polaroid thumbnail" width="75px" height="75px"/>
                </g:if>
                <g:else>
                  <img src="http://localhost:8081/uploads/no-pic-avatar.jpg" class="img-polaroid thumbnail" width="75px" height="75px"/>
                </g:else>
          </span>

          <span class="ventureNameHeader">
              <g:if test="${ventureInstance?.description}">
                <g:fieldValue bean="${ventureInstance}" field="name"/>
              </g:if>
          </span>

        </div>
        
        <div class="well well-large">
          <div id="show-venture" class="content scaffold-show" role="main">
            <text align="center">
            
            <div class="ventureVideo">
              <iframe width="816" height="459" src="http://www.youtube.com/embed/S2nBBMbjS8w" frameborder="0" allowfullscreen></iframe>
            </div>
            
            <div class="ventureDescription">
              <g:if test="${ventureInstance?.description}">
                <g:fieldValue bean="${ventureInstance}" field="description"/>
              </g:if>
            </div>
            
          </div> <!-- content scaffold-show -->
        </div>
      </div><!-- End span1 -->
    
      

      
    </g:if>
    <g:else>
      <div id="show-profile" class="content scaffold-show" role="main">
        <h1><g:message code="default.show.label" args="[entityName]" /></h1>
        <!--<g:if test="${flash.message}">-->
          <div class="message" role="status">${flash.message}</div>
        <!--</g:if>-->
        <label>This profile has been suspended</label>
      </div>
    </g:else>
  </div>
  
  
  
  <div id="show-venture" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list venture">
			

				<g:if test="${ventureInstance?.dateOfIncorporation}">
				<li class="fieldcontain">
					<span id="dateOfIncorporation-label" class="property-label"><g:message code="venture.dateOfIncorporation.label" default="Date Of Incorporation" /></span>
					
						<span class="property-value" aria-labelledby="dateOfIncorporation-label"><g:formatDate date="${ventureInstance?.dateOfIncorporation}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.admin}">
				<li class="fieldcontain">
					<span id="admin-label" class="property-label"><g:message code="venture.admin.label" default="Admin" /></span>
					
						<span class="property-value" aria-labelledby="admin-label"><g:link controller="profile" action="show" id="${ventureInstance?.admin?.id}">${ventureInstance?.admin?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.availableRoles}">
				<li class="fieldcontain">
					<span id="availableRoles-label" class="property-label"><g:message code="venture.availableRoles.label" default="Available Roles" /></span>
					
						<g:each in="${ventureInstance.availableRoles}" var="a">
						<span class="property-value" aria-labelledby="availableRoles-label"><g:link controller="role" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.blogs}">
				<li class="fieldcontain">
					<span id="blogs-label" class="property-label"><g:message code="venture.blogs.label" default="Blogs" /></span>
					
						<g:each in="${ventureInstance.blogs}" var="b">
						<span class="property-value" aria-labelledby="blogs-label"><g:link controller="blog" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="venture.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${ventureInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${ventureInstance?.filledRoles}">
				<li class="fieldcontain">
					<span id="filledRoles-label" class="property-label"><g:message code="venture.filledRoles.label" default="Filled Roles" /></span>
					
						<g:each in="${ventureInstance.filledRoles}" var="f">
						<span class="property-value" aria-labelledby="filledRoles-label"><g:link controller="role" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${ventureInstance?.id}" />
                                        <!--- need to allow ventures to be able to add filled roles & unfilled rules -->
                                    <li><a href="#" id="update_role" name="update_role">Add Available Role</a></li>
                                        <!-- <g:link controller="role" action="create" id="${ventureInstance?.id}">Add Available Role</g:link> -->
					<g:link class="edit" action="edit" id="${ventureInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
  
  
  
</body>
</html>
