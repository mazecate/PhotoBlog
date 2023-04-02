<!DOCTYPE html>
<html>
<head><title>Customer Support</title></head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<security:authorize access="hasRole('ADMIN') ">
    <a href="<c:url value="/user/list" />">Return to user list</a>
</security:authorize>


<a href="<c:url value="/blog/list" />">Return to blog list</a>
<h2>User Details #${userData.username}</h2>
<p>Username: ${userData.username}</p>
<p>Description: ${userData.description}</p>
<p>Phone: ${userData.phone}</p>
<p>Email: ${userData.email}</p>
<p>Role(s):
<c:forEach items="${userData.roles}" var="role" varStatus="status">
    <c:if test="${!status.first}">, </c:if>
    ${role.role}
</c:forEach>
</p>

</body>
</html>