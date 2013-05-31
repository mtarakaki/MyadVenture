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
    
      
      <g:set var="counter" value="${0}" />
  
      <g:each in="${projectInstance?.images}">
        <span class="span9">

          <div class='well'>
             <text align="center">
            <div class='projectAdditionalImage'>
              <img src="${projectInstance?.images.imageUri[counter]}" class="img-polaroid thumbnail"/>

              <div class='projectImageDesc'>
                ${projectInstance?.images.description[counter]}
              </div>

            </div>

             </text>
          </div>

        </span>
        <g:set var="counter" value="${counter + 1}" /><br/>
      </g:each>
      
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
  
  
  
  
  
  
</body>
</html>
