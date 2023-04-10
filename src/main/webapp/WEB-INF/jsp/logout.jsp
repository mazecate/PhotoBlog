<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
  <input type="submit" value="<fmt:message key="common.logout" />"/>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>