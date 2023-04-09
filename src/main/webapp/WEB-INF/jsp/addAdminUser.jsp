<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - Add User</title>
</head>
<body>
<%--<c:url var="logoutUrl" value="/logout"/>--%>
<%--<form action="${logoutUrl}" method="post">--%>
<%--    <input type="submit" value="Log out"/>--%>
<%--    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--</form>--%>
<c:import url="header.jsp"/>
<main>
    <div class="container">
        <div class="row">
            <div class="col">
                <br><br>
                <a href="<c:url value="/user/list" />">Return to user list</a>
                <br><br>
                <h2>Create a User</h2>
                <form:form method="POST" modelAttribute="PBUser">

                    <form:label path="username">Username</form:label><br/>
                    <form:input type="text" path="username"/><br/><br/>

                    <form:label path="password">Password</form:label><br/>
                    <form:input type="text" path="password"/><br/><br/>


                    <form:label path="description">Description</form:label><br/>
                    <form:textarea rows="10" cols="50" path="description"/><br/><br/>

                    <form:label path="email">email</form:label><br/>
                    <form:input type="email" path="email"/><br/><br/>


                    <form:label path="phone">phone</form:label><br/>
                    <form:input type="text" path="phone"/><br/><br/>

                    <form:label path="roles">Roles</form:label><br/>
                    <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER
                    <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN

                    <br/><br/>
                    <input type="submit" value="Add User"/>
                </form:form>
            </div>
        </div>
    </div>
</main>
<c:import url="footer.jsp"/>
</body>
</html>