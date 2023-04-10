<!DOCTYPE html>
<html>
<head>
  <c:import url="head_script.jsp"/>
  <title>Photoblog - <spring:message code="blogPage.edit.blog"/></title>
</head>
<body>
<%--<c:url var="logoutUrl" value="/logout"/>--%>
<%--<form action="${logoutUrl}" method="post">--%>
<%--  <input type="submit" value="Log out" />--%>
<%--  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
<%--</form>--%>
<c:import url="header.jsp"/>
<main>
  <div class="container">
    <div class="row">
      <div class="col">
          <br><br>
          <a href="<c:url value="/blog" />"><spring:message code="backlink.blog"/></a>
          <br><br>

          <h2><spring:message code="blogPage.edit.blog"/> #${blog.id}</h2>
            <form:form method="POST" enctype="multipart/form-data" modelAttribute="createForm">
              <form:label path="title"><spring:message code="blogPage.blog.title"/></form:label><br/>
              <form:textarea path="title"/>
                <br/><br/>
              <form:label path="body"><spring:message code="blogPage.description"/></form:label><br/>
              <form:textarea path="body" rows="5" cols="30" /><br/><br/>
              <b><spring:message code="blogPage.add.more"/></b><br />
              <input type="file" name="attachments" multiple="multiple" accept="image/*" /><br/><br/>
              <input type="submit" value="<spring:message code="btn.save"/>"/><br/><br/>
            </form:form>

      </div>
    </div>
  </div>
</main>
<c:import url="footer.jsp"/>
</body>
</html>