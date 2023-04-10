<!DOCTYPE html>
<html>
<head>
  <c:import url="head_script.jsp"/>
  <title>Photoblog - <spring:message code="User.head"/></title>
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
        <a href="<c:url value="/blog/list" />"><spring:message code="backlink.blog"/></a>
        <br>
        <br>

        <h2><spring:message code="User.head"/></h2>

        <a href="<c:url value="/user/create" />"><spring:message code="User.create"/></a><br/><br/>

        <c:choose>
          <c:when test="${fn:length(userList) == 0}">
            <i><spring:message code="msg.noUser"/></i>
          </c:when>
          <c:otherwise>
            <table class="table table-striped table-responsive">
              <tr>
                <th><spring:message code="User.username"/></th>
                <th><spring:message code="User.password"/></th>
                <th><spring:message code="User.description"/></th>
                <th><spring:message code="User.phone"/></th>
                <th><spring:message code="User.email"/></th>
                <th><spring:message code="User.role"/></th>
                <th><spring:message code="User.action"/></th>
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
                    [<a href="<c:url value="/user/profile/${user.username}" />"><spring:message code="User.profile"/></a>]
                    <br>
                    [<a href="<c:url value="/user/edit/${user.username}" />"><spring:message code="User.edit"/></a>]
                    <br>
                    [<a href="<c:url value="/user/delete/${user.username}" />"><spring:message code="User.delete"/></a>]
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