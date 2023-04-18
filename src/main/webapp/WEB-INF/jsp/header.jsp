<header data-bs-theme="dark" style="">
    <nav class="navbar navbar-dark bg-dark shadow-sm navbar-expand-lg bg-body-tertiary">
        <div class="container">
            <a href="<c:url value="/" />" class="navbar-brand d-flex align-items-center">
                <strong>PhotoBlog</strong>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="?lang=en"><fmt:message key="label.lang.en" /></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="?lang=zh_TW"><fmt:message key="label.lang.tw" /></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="?lang=zh_CN"><fmt:message key="label.lang.cn" /></a>
                    </li>
                    <security:authorize access="isAuthenticated()">
                        <li class="nav-item">
                            <a class="nav-link" href='<c:url value="/user/list"/>'><fmt:message key="User.h2" /></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href='<c:url value="/blog/list"/>'><fmt:message key="blogPage.head" /></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href='<c:url value="/user/profile/"/><security:authentication property="principal.username" />'><fmt:message key="common.profile" /></a>
                        </li>

                        <li class="nav-item" style="display: flex; align-items: center;">
                            <c:import url="logout.jsp"/>
                        </li>
                    </security:authorize>
                    <security:authorize access="isAnonymous()">
                        <li class="nav-item">
                            <a href="<c:url value="/login" />" class="nav-link d-flex align-items-center"><fmt:message key="common.login" /></a>
                        </li>
                    </security:authorize>
                </ul>
            </div>
        </div>
    </nav>
</header>
