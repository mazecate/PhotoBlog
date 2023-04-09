<header data-bs-theme="dark" style="border-bottom: 1px #adb5bd solid;">
    <div class="navbar navbar-dark bg-dark shadow-sm">
        <div class="container">
            <a href="<c:url value="/" />" class="navbar-brand d-flex align-items-center">
                <strong>PhotoBlog</strong>
            </a>
            <security:authorize access="isAuthenticated()">
                <c:import url="logout.jsp"/>
            </security:authorize>
            <security:authorize access="isAnonymous()">
                <a href="<c:url value="/login" />" class="navbar-brand d-flex align-items-center">Login</a>
            </security:authorize>
        </div>
    </div>
</header>