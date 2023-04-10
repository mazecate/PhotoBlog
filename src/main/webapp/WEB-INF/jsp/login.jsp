<!DOCTYPE html>
<html>
<head>
  <c:import url="head_script.jsp"/>
  <title>Photoblog - <spring:message code="login.title"/></title>
</head>
<body>
<style>
  .center {
    text-align: center;
    padding-top: 30px;
  }
</style>
<c:import url="header.jsp"/>
<main>
  <div class="center">
    <c:if test="${param.error != null}">
      <p><spring:message code="msg.login.fail"/></p>
    </c:if>
    <c:if test="${param.logout != null}">
      <p><spring:message code="msg.logout"/></p>
    </c:if>
    <h2><spring:message code="login.title"/></h2>
    <form action="login" method="POST">
      <label for="username"><spring:message code="login.username"/></label><br/>
      <input type="text" id="username" name="username"/><br/><br/>

      <label for="password"><spring:message code="login.password"/></label><br/>
      <input type="password" id="password" name="password"/><br/><br/>

      <input type="checkbox" id="remember-me" name="remember-me"/>
      <label for="remember-me"><spring:message code="login.remember"/></label><br/><br/>

      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <input type="submit" value='<spring:message code="login.title"/>' />
      <br>
      <br>
      <a href="<c:url value="/register" />"><spring:message code="register.title"/></a>
      <br>
      <br>
    </form>
  </div>
</main>
<c:import url="footer.jsp"/>
</body>
</html>