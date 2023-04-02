<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
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
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Tickets</h2>


<c:choose>
    <c:when test="${fn:length(owncommentDatabase) == 0}">
        <i>There are no comment in the very blog.</i>
    </c:when>
    <c:otherwise>

        <c:forEach items="${owncommentDatabase}" var="b">



            <c:out value="${b.createBy}"/>
            comment
            in blog ID : <c:out value="${b.blog.id}"/>
            blog title is : <c:out value="${b.blog.title}"/>
            <br>
            [text : <c:out value="${b.body}"/>]

            <security:authorize access="hasRole('ADMIN')">
                [<a href="<c:url value="/blog/${b.blog.id}/deletecomment3/${b.id}"/>">Delete</a>]
            </security:authorize>
            <br>
        </c:forEach>

    </c:otherwise>
</c:choose>

</body>
</html>
