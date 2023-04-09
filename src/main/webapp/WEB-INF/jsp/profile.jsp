<!DOCTYPE html>
<html>
    <head>
        <c:import url="head_script.jsp"/>
        <title>Photoblog - Profile</title>
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
                            <a href="<c:url value="/user/list" />">Return to user list</a>
                        </security:authorize>

                        <br>
                        <br>
                        <a href="<c:url value="/blog/list" />">Return to blog list</a>
                        <br>
                        <br>

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
                    </div>
                </div>
            </div>
        </main>
        <c:import url="footer.jsp"/>
    </body>
</html>