<%@ page import="TEC.Venture" %>

<script type="text/javascript">
    var childCount = ${ventureInstance?.availableRoles.size()} + 0;

    function addChild() {
        var clone = $("#role_clone").clone()
        var htmlId = 'expandableRoleList['+childCount+'].';
        var roleInput = clone.find("input[id$=number]");
        
        clone.find("input[id$=id]")
             .attr('id',htmlId + 'id')
             .attr('name',htmlId + 'id');
        clone.find("input[id$=deletedAvailableRoles]")
              .attr('id',htmlId + 'deleted')
              .attr('name',htmlId + 'deleted');
 
 
        clone.attr('id', 'role'+childCount);
        $("#childList").append(clone);
        clone.show();
        roleInput.focus();
        
        childCount++;
    }
</script>

<div id="childList">
    <g:each var="role" in="${ventureInstance.availableRoles}" status="i">
        <g:render template='availableRoles' model="['role':role,'i':i]"/>
    </g:each>
</div>
<input type="button" value="Add Available Role" onclick="addChild();" />