<!DOCTYPE html>
<html>
<head>
  <c:import url="head_script.jsp"/>
  <title>Photoblog - User Management</title>
</head>
<body>
<%--<c:url var="logoutUrl" value="/logout"/>--%>
<%--<form action="${logoutUrl}" method="post">--%>
<%--  <input type="submit" value="Log out"/>--%>
<%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--</form>--%>

<c:import url="header.jsp"/>

<main>
  <div class="container">
    <div class="row">
      <div class="col">
        <br>
        <br>
        <a href="<c:url value="/blog/list" />">Return to list blog</a>
        <br>
        <br>

        <h2>Users</h2>

        <a href="<c:url value="/user/create" />">Create a User</a><br/><br/>

        <c:choose>
          <c:when test="${fn:length(userList) == 0}">
            <i>There are no users in the system.</i>
          </c:when>
          <c:otherwise>
            <table class="table table-striped table-responsive">
              <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Description</th>
                <th>Phone</th>
                <th>Email</th>
                <th>Roles</th>
                <th>Action</th>
              </tr>
              <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.username}</td>
                    <td>${fn:substringAfter(user.password, '{noop}')}</td>
                    <td>${user.description}</td>
                    <td>${user.phone}</td>
                    <td>${user.email}</td>
                  <td>
                    <c:forEach items="${user.roles}" var="role" varStatus="status">
                      <c:if test="${!status.first}">, </c:if>
                      ${role.role}
                    </c:forEach>
                  </td>
                  <td>
                    [<a href="<c:url value="/user/profile/${user.username}" />">Profile</a>]
                    <br>
                    [<a href="<c:url value="/user/edit/${user.username}" />">Edit</a>]
                    <br>
                    [<a href="<c:url value="/user/delete/${user.username}" />">Delete</a>]
                  </td>
                </tr>
              </c:forEach>
            </table>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</main>

<c:import url="footer.jsp"/>
</body>
</html>