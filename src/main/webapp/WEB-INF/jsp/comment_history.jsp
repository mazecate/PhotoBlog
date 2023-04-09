<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - Comment History</title>
    <style>
        .card {
            /* Add shadows to create the "card" effect */
            border: 5px;
            margin-bottom: 5px;
            display: block;


        }

        /* On mouse-over, add a deeper shadow */
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }

        /* Add some padding inside the card container */
        .container {
            padding: 2px 16px;
        }
    </style>

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
                <h2>Comment History</h2>
                <c:choose>
                    <c:when test="${fn:length(commentDatabase) == 0}">
                        <i>There are no comment in the very blog.</i>
                    </c:when>
                    <c:otherwise>

                        <c:forEach items="${commentDatabase}" var="entry">

                            <div class="card">
                                blog id : <c:out value="${entry.id}"/><br>

                                <c:if test="${fn:length(entry.comments) == 0}">
                                    There are no comment in this blog.
                                </c:if>
                                <c:forEach items="${entry.comments}" var="comment" varStatus="status">


                                    <c:out value="${comment.createBy}"/>
                                    comment
                                    in blog ID : <c:out value="${comment.blog.id}"/>
                                    blog title is : <c:out value="${comment.blog.title}"/>
                                    <br>
                                    [text : <c:out value="${comment.body}"/>]

                                    <security:authorize access="hasRole('ADMIN')">
                                        [<a href="<c:url value="/blog/${entry.id}/deletecomment2/${comment.id}"/>">Delete</a>]
                                    </security:authorize>
                                    <br>
                                </c:forEach><br/><br/>

                            </div>
                        </c:forEach>

                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</main>
<c:import url="footer.jsp"/>
</body>
</html>
