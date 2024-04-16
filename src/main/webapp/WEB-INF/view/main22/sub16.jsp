<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${not empty con}">
    ${con}
</c:if>
<form action="/main22/sub17" method="post">
    <div>
        id
        <input type="text" name="id">
    </div>
    <div>
        pw
        <input type="text" name="pw">
    </div>
    <div>
        <input type="submit" value="로그인">
    </div>
</form>

</body>
</html>
