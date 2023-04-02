<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<c:url var="logoutUrl" value="/logout"/>
<form action="${logoutUrl}" method="post">
    <input type="submit" value="Log out"/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>

<h2>Create a Blog</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="createForm">

    <label for="title">description</label>
    <br/>
    <input type="text" id="title" name="title"/> <br/>
    <form:label path="body">Body</form:label><br/>
    <form:textarea path="body" rows="3" cols="20"/><br/><br/>

    <b>photo:</b><br/>
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
