<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - Create Blog</title>
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
                <a href="<c:url value="/blog/list" />">Return to list blog</a>
                <br>
                <br>
                <h2>Create a Blog</h2>
                <form:form method="POST" enctype="multipart/form-data" modelAttribute="createForm">

                    <label for="title">Description</label>
                    <br/>
                    <input type="text" id="title" name="title"/> <br/>
                    <form:label path="body">Body</form:label><br/>
                    <form:textarea path="body" rows="3" cols="20"/><br/><br/>

                    <b>Photo:</b><br/>
                    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
                    <input type="submit" value="Submit"/>
                </form:form>
            </div>
        </div>
    </div>
</main>

<c:import url="footer.jsp"/>
</body>
</html>
