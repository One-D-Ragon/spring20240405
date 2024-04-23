<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div>
    <c:if test="${not empty message}">
        <div>${message}</div>
    </c:if>
</div>

<h3>직원 정보 입력</h3>
<form action="" method="post">
    <div>
        Last Name
        <input type="text" name="lastName">
    </div>
    <div>
        First Name
        <input type="text" name="firstName">
    </div>
    <div>
        Birth Date
        <input type="date" name="birthDate">
    </div>
    <div>
        Photo
        <input type="text" name="photo">
    </div>
    <div>
        Notes
        <textarea name="notes" id="" cols="30" rows="10"></textarea>
    </div>
    <div>
        <input type="submit" value="등록">
    </div>
</form>

</body>
</html>
