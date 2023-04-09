<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - Customer Support</title>
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
                <h2>Blog</h2>
                username: <c:out value="${username}"/>
                [<a href="<c:url value="/user/profile/${username}" />">my Profile</a>]
                <br>
                <security:authorize access="hasRole('ADMIN')">
                    admin function: <br>
                    <a href="<c:url value="/user" />">Manage User Accounts</a><br/><br/>
                    <a href="<c:url value="/blog/commenthistory" />">all user comment history</a><br/><br/>
                    <a href="<c:url value="/blog/upload_history" />">all user update photo history</a><br/><br/>

                </security:authorize>
                user function: <br>
                <a href="<c:url value="/blog/create" />">Create a blog</a><br/><br/>
                <a href="<c:url value="/blog/own_commenthistory" />">my own comment history</a><br/><br/>
                <a href="<c:url value="/blog/own_upload_history" />">my own update photo history</a><br/><br/>
                <c:choose>
                    <c:when test="${fn:length(photoDatabase) == 0}">
                        <i>There are no blog in the system.</i>
                    </c:when>
                    <c:otherwise>

                        <c:forEach items="${photoDatabase}" var="entry">
                            <div class="card">
                                <c:forEach items="${entry.attachments}" var="attachment" varStatus="status">
                                    <img src="data:image/jpg;base64,${attachment.contenttoshow}" width="100" height="100"/>

                                </c:forEach><br/><br/>

                                <div class="container">
                                    <a href="<c:url value="/blog/view/${entry.id}" />">
                                        description :
                                        <c:out value="${entry.description}"/></a>
                                    (description: <c:out value="${entry.description}"/>)<br>
                                    (createby: <c:out value="${entry.createBy}"/>)<br>
                                    (createAt: <c:out value="${entry.createAt}"/>)
                                    <security:authorize access="hasRole('ADMIN') or
                                                principal.username=='${entry.createBy}'">
                                        [<a href="<c:url value="/blog/edit/${entry.id}"/>">Edit</a>]
                                    </security:authorize>
                                    <security:authorize access="hasRole('ADMIN')">
                                        [<a href="<c:url value="/blog/delete/${entry.id}"/>">Delete</a>]
                                    </security:authorize>
                                    <br/>
                                </div>
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