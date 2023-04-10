<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - <spring:message code="blogPage.create"/></title>
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
                <br>
                <br>
                <a href="<c:url value="/blog/list" />"><spring:message code="backlink.blog"/></a>
                <br>
                <br>
                <h2><spring:message code="blogPage.create"/></h2>
                <form:form method="POST" enctype="multipart/form-data" modelAttribute="createForm">

                    <label for="title"><spring:message code="blogPage.blog.title"/></label>
                    <br/>
                    <input type="text" id="title" name="title"/> <br/>
                    <form:label path="body"><spring:message code="blogPage.description"/></form:label><br/>
                    <form:textarea path="body" rows="3" cols="20"/><br/><br/>

                    <b><spring:message code="blogPage.image"/></b><br/>
                    <input type="file" name="attachments" multiple="multiple" accept="image/*" /><br/><br/>
                    <input type="submit" value="<spring:message code="btn.submit"/>"/>
                </form:form>
            </div>
        </div>
    </div>
</main>

<c:import url="footer.jsp"/>
</body>
</html>
