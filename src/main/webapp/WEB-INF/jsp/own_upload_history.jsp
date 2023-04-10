<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - <spring:message code="hist.own.upload"/></title>
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
                <h2><spring:message code="hist.own.upload"/></h2>
                <c:choose>
                    <c:when test="${fn:length(ownuploadDatabase) == 0}">
                        <i><spring:message code="msg.noUpload"/></i>
                    </c:when>
                    <c:otherwise>

                        <c:forEach items="${ownuploadDatabase}" var="entry">

                            <div class="card">


                                <c:out value="${entry.createBy}"/>
                                create a blog ->title : <c:out value="${entry.description}"/>
                                (blogID) : <c:out value="${entry.id}"/>
                                at : <c:out value="${entry.createAt}"/>
                                <br>


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
