<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - <spring:message code="hist.all.comment"/></title>
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
                <a href="<c:url value="/blog/list" />"><spring:message code="backlink.blog"/></a>
                <br>
                <br>
                <h2><spring:message code="hist.all.comment"/></h2>
                <c:choose>
                    <c:when test="${fn:length(commentDatabase) == 0}">
                        <i><spring:message code="msg.noComment"/></i>
                    </c:when>
                    <c:otherwise>

                        <c:forEach items="${commentDatabase}" var="entry">
                            <div class="card mt-5 p-3" style="border: 1px #FFFFFF solid;">
                                <h1><spring:message code="blogPage.blogId"/>: <c:out value="${entry.id}"/></h1>
                                <hr>
                                <c:if test="${fn:length(entry.comments) == 0}">
                                    <spring:message code="msg.noComment.single"/>
                                </c:if>
                                <c:forEach items="${entry.comments}" var="comment" varStatus="status">
                                    <div class="mb-3">
                                        <p><spring:message code="blogPage.blogId"/>: <c:out value="${comment.blog.id}"/></p>
                                        <p><spring:message code="blogPage.blog.title"/>: <c:out value="${comment.blog.title}"/></p>
                                        <p><spring:message code="hist.comment.creator"/>: <c:out value="${comment.createBy}"/></p>
                                        <p><spring:message code="blogPage.comment"/>: [<c:out value="${comment.body}"/>]</p>
    <%--                                    comment--%>
    <%--                                    in blog ID : <c:out value="${comment.blog.id}"/> and--%>
    <%--                                    blog title is : <c:out value="${comment.blog.title}"/>--%>
    <%--                                    <br>--%>
    <%--                                    [text : <c:out value="${comment.body}"/>]--%>

                                        <security:authorize access="hasRole('ADMIN')">
                                            [<a href="<c:url value="/blog/${entry.id}/deletecomment2/${comment.id}"/>"><spring:message code="blogPage.delete"/></a>]
                                        </security:authorize>
                                    </div>
                                    <hr>
                                </c:forEach>


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
