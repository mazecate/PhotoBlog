<!DOCTYPE html>
<html>
<head>
  <c:import url="head_script.jsp"/>
  <title>Photoblog - Login</title>
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
      <p>Login failed.</p>
    </c:if>
    <c:if test="${param.logout != null}">
      <p>You have logged out.</p>
    </c:if>
    <h2>Customer Support Login</h2>
    <form action="login" method="POST">
      <label for="username"><spring:message code="register.username"/></label><br/>
      <input type="text" id="username" name="username"/><br/><br/>
      <label for="password">Password</label><br/>
      <input type="password" id="password" name="password"/><br/><br/>
      <input type="checkbox" id="remember-me" name="remember-me"/>
      <label for="remember-me">Remember me</label><br/><br/>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      <input type="submit" value="Log In"/>
      <br>
      <br>
      <a href="<c:url value="/register" />">Sing up</a>
      <br>
      <br>
    </form>
  </div>
</main>
<c:import url="footer.jsp"/>
