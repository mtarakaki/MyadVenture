<%@ page import="TEC.Venture" %>

<div id="role${i}">
    <g:hiddenField name='expandableRoleList[${i}].id' value='${role.id}'/>
    <g:textField name='expandableRoleList[${i}].name' value='${role.title}'/>
    <input type="hidden" name='expandableRoleList[${i}].deletedAvailableRoles' id='expandableRoleList[${i}].deletedAvailableRoles' value='false'/>
    <span onClick="$('#expandableRoleList\\[${i}\\]\\.deletedAvailableRoles').val('true'); $('#role${i}').hide()"><img src="${resource(dir:'images/skin', file:'database_delete.png')}" /></span>
</div>