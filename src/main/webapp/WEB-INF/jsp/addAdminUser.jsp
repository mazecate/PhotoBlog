<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - <spring:message code="User.create"/></title>
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
                <a href="<c:url value="/user/list" />"><spring:message code="backlink.user"/></a>
                <br><br>
                <h2><spring:message code="User.create"/></h2>
                <form:form method="POST" modelAttribute="PBUser">

                    <form:label path="username"><spring:message code="User.username"/></form:label><br/>
                    <form:input type="text" path="username"/><br/><br/>

                    <form:label path="password"><spring:message code="User.password"/></form:label><br/>
                    <form:input type="text" path="password"/><br/><br/>


                    <form:label path="description"><spring:message code="User.description"/></form:label><br/>
                    <form:textarea rows="10" cols="50" path="description"/><br/><br/>

                    <form:label path="email"><spring:message code="User.email"/></form:label><br/>
                    <form:input type="email" path="email"/><br/><br/>


                    <form:label path="phone"><spring:message code="User.phone"/></form:label><br/>
                    <form:input type="text" path="phone"/><br/><br/>

                    <form:label path="roles"><spring:message code="User.role"/></form:label><br/>
                    <form:checkbox path="roles" value="ROLE_USER"/>ROLE_USER
                    <form:checkbox path="roles" value="ROLE_ADMIN"/>ROLE_ADMIN

                    <br/><br/>
                    <input type="submit" value="<spring:message code="User.create"/>"/>
                </form:form>
            </div>
        </div>
    </div>
</main>
<c:import url="footer.jsp"/>
</body>
</html>