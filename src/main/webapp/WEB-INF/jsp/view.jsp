<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - <spring:message code="backlink.blog"/> #${blogid}</title>
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

                <h2><spring:message code="blogPage.title"/> #${blogid}: <c:out value="${blog.description}"/></h2>
                <security:authorize access="hasRole('ADMIN') or principal.username=='${blog.createBy}'">
                    [<a href="<c:url value="/blog/edit/${blog.id}"/>"><spring:message code="blogPage.edit"/></a>]
                </security:authorize>
                <security:authorize access="hasRole('ADMIN')">
                    [<a href="<c:url value="/blog/delete/${blog.id}"/>"><spring:message code="blogPage.delete"/></a>]
                </security:authorize>

                <br/>
                <br/>

                <i><spring:message code="blogPage.creator"/> - <c:out value="${blog.createBy}"/></i>
                <br/><br/>
                <spring:message code="blogPage.description"/>:
                <br><c:out value="${blog.description}"/>

                <br/>
                <br/>

                <c:if test="${!empty blog.attachments}">
                    <spring:message code="blogPage.attachment"/>:<br>
                    <c:forEach items="${blog.attachments}" var="attachment" varStatus="status">
                        <c:if test="${!status.first}">, </c:if>
<%-- Comment for generate as link                       --%>
<%--                        <a href="<c:url value="/blog/${blogid}/attachment/${attachment.id}" />">--%>
<%--                            <c:out value="${attachment.name}"/>--%>
<%--                        </a>--%>

                        <img src="data:image/jpg;base64,${attachment.contenttoshow}" width="20%" height="auto" class="img-thumbnail"/>
                        <security:authorize access="hasRole('ADMIN') or principal.username=='${blog.createBy}'">
                        [<a href="<c:url value="/blog/${blogid}/delete/${attachment.id}"/>"><spring:message code="blogPage.delete"/></a>]
                        </security:authorize>
                        <br>
                        <br>
                    </c:forEach><br/><br/>
                </c:if>


                <table class="table table-striped table-responsive">
                    <tr>
                        <th><spring:message code="hist.comment.creator"/></th>
                        <th><spring:message code="blogPage.comment"/></th>
                        <th><spring:message code="blogPage.create.time"/></th>
                        <th><spring:message code="blogPage.action"/></th>
                    </tr>
                    <c:forEach items="${blog.comments}" var="c" varStatus="status">
                        <tr>
<%--                        <c:out value="${c.createBy}"/></a> say:--%>
<%--                        <c:out value="${c.body}"/></a> at--%>
<%--                        <c:out value="${c.createAt}"/></a>--%>
<%--                            <security:authorize access="hasRole('ADMIN') or principal.username=='${c.createBy}'">--%>
<%--                                [<a href="<c:url value="/blog/${blogid}/deletecomment/${c.id}"/>"><spring:message code="blogPage.delete"/></a>]--%>
<%--                            </security:authorize>--%>
        <%--                        <br>--%>
                            <td><c:out value="${c.createBy}"/></td>
                            <td><c:out value="${c.body}"/></td>
                            <td><c:out value="${c.createAt}"/></td>
                            <td>
                                <security:authorize access="hasRole('ADMIN') or principal.username=='${c.createBy}'">
                                    [<a href="<c:url value="/blog/${blogid}/deletecomment/${c.id}"/>"><spring:message code="blogPage.delete"/></a>]
                                </security:authorize>
                            </td>
                        </tr>
                    </c:forEach>
                </table>


                <form:form method="POST" enctype="multipart/form-data" modelAttribute="commentForm">
                    <form:label path="body"><spring:message code="blogPage.comment"/></form:label>
                    <br>
                    <form:textarea path="body" rows="1" cols="20"/>
                    <br/>
                    <br/>
                    <input type="submit" value="<spring:message code="btn.submit"/>"/>
                </form:form>
            </div>
        </div>
    </div>
</main>

<c:import url="footer.jsp"/>
</body>
</html>
