<!doctype html>
<html lang="en" data-bs-theme="auto">
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog</title>
</head>
<body>
<style>
    .card-img-top {
        width: 100%;
        height: 15vw;
        object-fit: contain;
        background-color: #2b3035;
    }
</style>
<c:import url="header.jsp"/>
<main>
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">Photo Blog</h1>
                <p class="lead text-body-secondary">${aaa}</p>
            </div>
        </div>
    </section>

    <div class="album py-5 bg-body-tertiary">
        <div class="container">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                <c:choose>
                    <c:when test="${fn:length(photoList) == 0}">
                        <i>There are no blog in the system.</i>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${photoList}" var="entry">
                            <div class="col position-relative">
                                <div class="card shadow-sm">
                                    <c:forEach items="${entry.attachments}" var="attachment" varStatus="status">
                                        <img src="data:image/jpg;base64,${attachment.contenttoshow}" class="card-img-top" width="100%" height="auto"/>
                                    </c:forEach>
                                    <div class="card-body">
                                        <div class="card-text">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <small class="text-body-secondary"><c:out value="${entry.createBy}"/></small>
                                                <small class="text-body-secondary"><c:out value="${entry.createAt}"/></small>
                                            </div>
                                            <c:out value="${entry.description}"/>
                                        </div>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="btn-group">
                                                <security:authorize access="isAuthenticated()">
                                                    <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.createBy}'">
                                                        <a href="<c:url value="/blog/edit/${entry.id}"/>" class="btn btn-sm btn-outline-secondary">Edit</a>
                                                    </security:authorize>
                                                </security:authorize>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <a href="<c:url value="/blog/view/${entry.id}" />" class="stretched-link"></a>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</main>

<c:import url="footer.jsp"/>