<%@ page import="TEC.Project" %>
<%@ page import="TEC.Image" %>

<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>	

  <script type="text/javascript">   
$(document).ready(function() {  
  <g:if test="${session?.user}">
              
      var src = "${projectInstance?.videourl}";
      
       /* 
       * Source: http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url
       */
      var video_id = src.split('v=')[1];
      var ampersandPosition = video_id.indexOf('&');
      if(ampersandPosition != -1) {
        video_id = video_id.substring(0, ampersandPosition);
      }
  
      src = "http://www.youtube.com/embed/" + video_id;
      
      
      $("div.projectVideo iframe").attr("src",src);
              
      $(".createproject").click( function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Create Project</h3>');
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
  
      $("#send_message").die("click").live("click", function () {
        $("#myModal .modal-header").html('<button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="myModalLabel">Send Message</h3>');
        $("#myModal .modal-body").load("${createLink(controller: 'message', action: 'single', params:[id: profileInstance?.id])}");
        $('#myModal').modal('show'); 
        return false;
      });
  </g:if>
  

  });
  </script> 
</head>
<body>
  <div>
      <div class="message" name="message" id="message" role="status"><g:if test="${flash.message}">${flash.message}</g:if></div>
    
    <g:if test="${!profileInstance?.suspended}">
      <!-- Right side -->
      <div class="span9">
        
        <div class="projectHeader">
        
          
          <span class="projectNameHeader">
              <g:if test="${projectInstance?.description}">
                <g:fieldValue bean="${projectInstance}" field="name"/>
              </g:if>
          </span>

        </div>
        
        <div class="well well-large">
          <div id="show-project" class="content scaffold-show" role="main">
            <text align="center">
            
            <div class="projectVideo">
              <iframe width="655" height="369" frameborder="0" allowfullscreen></iframe>
            </div>
            
            <div class="projectDescription">
              <g:if test="${projectInstance?.description}">
                <g:fieldValue bean="${projectInstance}" field="description"/>
              </g:if>
            </div>
            
          </div> <!-- content scaffold-show -->
        </div>
      </div><!-- End span1 -->
    
      <span class="span9">
      
        <div class='well'>
           <text align="center">
          <div class='projectAdditionalImage'>
            <img src="http://img829.imageshack.us/img829/20/cocacolam.jpg" class="img-polaroid thumbnail"/>
            
            <div class='projectImageDesc'>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin risus odio, sollicitudin ut sollicitudin ut, aliquam a ante. 
              Suspendisse potenti. Maecenas fringilla imperdiet mi id aliquam. Sed ipsum enim, adipiscing sit amet gravida sed, accumsan 
              ac sapien. Donec diam magna, ultrices id sodales nec, tempor rutrum magna. Cras porta imperdiet adipiscing. Class aptent 
              taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
            </div>
            
          </div>
          
           </text>
        </div>
      
      </span>

      
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
                          
                                <g:if test="${images}">
				<li class="fieldcontain">
					<span id="logoUri-label" class="property-label"><g:message code="project.images.label" default="Image" /></span>
					
						<span class="property-value" aria-labelledby="image-label"><g:fieldValue bean="${projectInstance}" field="image"/></span>
					
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
