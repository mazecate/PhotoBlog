<!DOCTYPE html>
<html>
<head><title>Customer Support</title></head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<a href="<c:url value="/user/list" />">Return to user list</a>
<h2>Create a User</h2>
<form:form method="POST" modelAttribute="PBUser">

    <form:label path="username">Username</form:label><br/>
    <form:input type="text" path="username"/><br/><br/>

    <form:label path="password">Password</form:label><br/>
    <form:input type="text" path="password"/><br/><br/>


    <form:label path="description">Description</form:label><br/>
    <form:input type="text" path="description"/><br/><br/>

    <form:label path="email">email</form:label><br/>
    <form:input type="text" path="email"/><br/><br/>


    <form:label path="phone">phone</form:label><br/>
    <form:input type="text" path="phone"/><br/><br/>

    <form:label path="roles">Roles</form:label><br/>
    <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER
    <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN

    <br/><br/>
    <input type="submit" value="Add User"/>
</form:form>
</body>
</html>