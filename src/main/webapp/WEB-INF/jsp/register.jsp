<!DOCTYPE html>
<html>
<head>
    <c:import url="head_script.jsp"/>
    <title>Photoblog - Register</title>
</head>
<body>
<style>
    .center {
        text-align: center;
        padding-top: 30px;
    }

    form {
        padding: 10px 0;
    }

    #back {
        display: inline-block;
        margin-bottom: 10px;
    }
</style>
<c:import url="header.jsp"/>
<main>
    <div class="center">
        <c:import url="changelang.jsp"/>
        <h2><spring:message code="register.title"/></h2>
        <form action="register" method="POST">
            <label for="username"><spring:message code="register.username"/>:</label><br/>
            <input type="text" id="username" name="username"/>
            <br/>
            <label for="password"><spring:message code="register.password"/>:</label>
            <br/>
            <input type="password" id="password" name="password"/>
            <br/>
            <label for="description">description</label>
            <br/>
            <input type="text" id="description" name="description"/>
            <br/>
            <label for="email">email</label>
            <br/>
            <input type="text" id="email" name="email"/>
            <br/>
            <label for="phone">phone</label>
            <br/>
            <input type="text" id="phone" name="phone"/>


            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <br>
            <br>
            <input type="submit" value="<spring:message code="register.create" />"/>
        </form>
        <br>
        <br>
        <a href="login" id="back"/><spring:message code="register.back"/></a>
    </div>
</main>
<c:import url="footer.jsp"/>
</body>
</html>
