<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - <spring:message code="hist.own.comment"/></title>
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
                <h2><spring:message code="hist.own.comment"/></h2>


                <c:choose>
                    <c:when test="${fn:length(owncommentDatabase) == 0}">
                        <i><spring:message code="msg.noComment"/></i>
                    </c:when>
                    <c:otherwise>

                        <table class="table table-striped table-responsive">
                            <tr>
                                <th><spring:message code="blogPage.blogId"/></th>
                                <th><spring:message code="hist.comment.creator"/></th>
                                <th><spring:message code="blogPage.blog.title"/></th>
                                <th><spring:message code="blogPage.comment"/></th>
                                <security:authorize access="hasRole('ADMIN')"><th><spring:message code="blogPage.action"/></th></security:authorize>
                            </tr>
                            <c:forEach items="${owncommentDatabase}" var="b">
<%--                                <c:out value="${b.createBy}"/>--%>
<%--                                comment--%>
<%--                                in blog ID : <c:out value="${b.blog.id}"/>--%>
<%--                                blog title is : <c:out value="${b.blog.title}"/>--%>
<%--                                <br>--%>
<%--                                [text : <c:out value="${b.body}"/>]--%>
<%--    --%>
<%--                                <security:authorize access="hasRole('ADMIN')">--%>
<%--                                    [<a href="<c:url value="/blog/${b.blog.id}/deletecomment3/${b.id}"/>"><spring:message code="blogPage.delete"/></a>]--%>
<%--                                </security:authorize>--%>
<%--                                <br>--%>

                                <tr>
                                    <td><c:out value="${b.blog.id}"/></td>
                                    <td><c:out value="${b.createBy}"/></td>
                                    <td><c:out value="${b.blog.title}"/></td>
                                    <td><c:out value="${b.body}"/></td>
                                    <security:authorize access="hasRole('ADMIN')">
                                    <td>
                                        [<a href="<c:url value="/blog/${b.blog.id}/deletecomment3/${b.id}"/>"><spring:message code="blogPage.delete"/></a>]
                                    </td>
                                    </security:authorize>
                                </tr>
                            </c:forEach>
                        </table>

                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</main>

<c:import url="footer.jsp"/>
</body>
</html>
