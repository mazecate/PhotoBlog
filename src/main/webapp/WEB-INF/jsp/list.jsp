<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - <spring:message code="blogPage.head"/></title>
    <style>
        .card {
            /* Add shadows to create the "card" effect */
            border: 5px;
            margin-bottom: 5px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 50%;
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
                <h2><spring:message code="blogPage.title"/></h2>
                <spring:message code="User.username"/>: <c:out value="${username}"/>
                [<a href="<c:url value="/user/profile/${username}" />"><spring:message code="User.profile"/></a>]
                <br>
                <security:authorize access="hasRole('ADMIN')">
                    <spring:message code="admin.fn"/>: <br>
                    <a href="<c:url value="/user" />"><spring:message code="User.head"/></a><br/><br/>
                    <a href="<c:url value="/blog/commenthistory" />"><spring:message code="hist.all.comment"/></a><br/><br/>
                    <a href="<c:url value="/blog/upload_history" />"><spring:message code="hist.all.photo"/></a><br/><br/>

                </security:authorize>
                <spring:message code="user.fn"/>: <br>
                <a href="<c:url value="/blog/create" />"><spring:message code="blogPage.create"/></a><br/><br/>
                <a href="<c:url value="/blog/own_commenthistory" />"><spring:message code="hist.own.comment"/></a><br/><br/>
                <a href="<c:url value="/blog/own_upload_history" />"><spring:message code="hist.own.upload"/></a><br/><br/>
                <c:choose>
                    <c:when test="${fn:length(photoDatabase) == 0}">
                        <i><spring:message code="msg.noBlog"/></i>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-striped table-responsive">
                            <tr>
                                <td><spring:message code="blogPage.image"/></td>
                                <td><spring:message code="blogPage.description"/></td>
                                <td><spring:message code="blogPage.creator"/></td>
                                <td><spring:message code="blogPage.create.time"/></td>
                                <td><spring:message code="blogPage.action"/></td>
                            </tr>
                            <c:forEach items="${photoDatabase}" var="entry">
<%--                                <div class="card">--%>
<%--                                    <c:forEach items="${entry.attachments}" var="attachment" varStatus="status">--%>
<%--                                        <img src="data:image/jpg;base64,${attachment.contenttoshow}" width="100" height="100"/>--%>

<%--                                    </c:forEach><br/><br/>--%>

<%--                                    <div class="container">--%>
<%--                                        <a href="<c:url value="/blog/view/${entry.id}" />">--%>
<%--                                            description :--%>
<%--                                            <c:out value="${entry.description}"/></a>--%>
<%--                                        description: <c:out value="${entry.description}"/>)<br>--%>
<%--                                        createby: <c:out value="${entry.createBy}"/><br>--%>
<%--                                        createAt: <c:out value="${entry.createAt}"/>--%>
<%--                                        <security:authorize access="hasRole('ADMIN') or--%>
<%--                                                    principal.username=='${entry.createBy}'">--%>
<%--                                            [<a href="<c:url value="/blog/edit/${entry.id}"/>">edit</a>]--%>
<%--                                        </security:authorize>--%>
<%--                                        <security:authorize access="hasRole('ADMIN')">--%>
<%--                                            [<a href="<c:url value="/blog/delete/${entry.id}"/>">delete</a>]--%>
<%--                                        </security:authorize>--%>
<%--                                        <br/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <tr>
                                    <td>
                                        <c:forEach items="${entry.attachments}" var="attachment" varStatus="status">
                                            <img src="data:image/jpg;base64,${attachment.contenttoshow}" width="100" height="100" class="img-thumbnail"/>
                                        </c:forEach><br/><br/>
                                    </td>
                                    <td><c:out value="${entry.description}"/></td>
                                    <td><c:out value="${entry.createBy}"/></td>
                                    <td><c:out value="${entry.createAt}"/></td>
                                    <td>
                                        [<a href="<c:url value="/blog/view/${entry.id}"/>"><spring:message code="blogPage.view"/></a>]
                                        <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.createBy}'">
                                            [<a href="<c:url value="/blog/edit/${entry.id}"/>"><spring:message code="blogPage.edit"/></a>]
                                        </security:authorize>
                                        <security:authorize access="hasRole('ADMIN')">
                                            [<a href="<c:url value="/blog/delete/${entry.id}"/>"><spring:message code="blogPage.delete"/></a>]
                                        </security:authorize>
                                    </td>
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