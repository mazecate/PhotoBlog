<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - View Blog #${blogid}</title>
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

                <h2>Blogid #${blogid}: <c:out value="${blog.description}"/></h2>
                <security:authorize access="hasRole('ADMIN') or
                                          principal.username=='${blog.createBy}'">
                    [<a href="<c:url value="/blog/edit/${blog.id}"/>">Edit</a>]
                </security:authorize>
                <security:authorize access="hasRole('ADMIN')">
                    [<a href="<c:url value="/blog/delete/${blog.id}"/>">Delete</a>]
                </security:authorize>
                <br/><br/>
                <i>create By - <c:out value="${blog.createBy}"/></i><br/><br/>
                <c:out value="${blog.description}"/><br/><br/>
                <c:if test="${!empty blog.attachments}">
                    Attachments:
                    <c:forEach items="${blog.attachments}" var="attachment" varStatus="status">
                        <c:if test="${!status.first}">, </c:if>
                        <a href="<c:url value="/blog/${blogid}/attachment/${attachment.id}" />">
                            <c:out value="${attachment.name}"/></a>

                        <img src="data:image/jpg;base64,${attachment.contenttoshow}" width="20" height="30"/>
                        <security:authorize access="hasRole('ADMIN') or principal.username=='${blog.createBy}'">
                        [<a href="<c:url value="/blog/${blogid}/delete/${attachment.id}"/>">Delete</a>]
                        </security:authorize>
                    </c:forEach><br/><br/>
                </c:if>


                <c:forEach items="${blog.comments}" var="c" varStatus="status">
                    <c:out value="${c.createBy}"/></a> say:
                    <c:out value="${c.body}"/></a> at
                    <c:out value="${c.createAt}"/></a>
                    <security:authorize access="hasRole('ADMIN') or principal.username=='${c.createBy}'">
                        [<a href="<c:url value="/blog/${blogid}/deletecomment/${c.id}"/>">Delete</a>]
                    </security:authorize>
                    <br>
                </c:forEach>


                <form:form method="POST" enctype="multipart/form-data" modelAttribute="commentForm">
                    <form:label path="body">comment</form:label>
                    <form:textarea path="body" rows="1" cols="20"/><br/><br/>


                    <input type="submit" value="Submit"/>
                </form:form>
            </div>
        </div>
    </div>
</main>

<c:import url="footer.jsp"/>
</body>
</html>
