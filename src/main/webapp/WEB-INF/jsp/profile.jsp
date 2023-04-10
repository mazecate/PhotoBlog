<!DOCTYPE html>
<html>
    <head>
        <c:import url="head_script.jsp"/>
        <title>Photoblog - <spring:message code="profile.title"/></title>
    </head>
    <body>
        <c:import url="header.jsp"/>
        <main>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <security:authorize access="hasRole('ADMIN') ">
                            <br>
                            <br>
                            <a href="<c:url value="/user/list" />"><spring:message code="backlink.user"/></a>
                        </security:authorize>

                        <br>
                        <br>
                        <a href="<c:url value="/blog/list" />"><spring:message code="backlink.blog"/></a>
                        <br>
                        <br>

                        <h2><spring:message code="profile.title"/> #${userData.username}</h2>
                        <p><spring:message code="profile.username"/>: ${userData.username}</p>
                        <p><spring:message code="profile.description"/>: ${userData.description}</p>
                        <p><spring:message code="profile.phone"/>: ${userData.phone}</p>
                        <p><spring:message code="profile.email"/>: ${userData.email}</p>
                        <p><spring:message code="profile.role"/>:
                        <c:forEach items="${userData.roles}" var="role" varStatus="status">
                            <c:if test="${!status.first}">, </c:if>
                            ${role.role}
                        </c:forEach>
                        </p>
                    </div>
                </div>
            </div>
        </main>
        <c:import url="footer.jsp"/>
    </body>
</html>