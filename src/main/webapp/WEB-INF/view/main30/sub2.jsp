<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${not empty message}">
    <div style="padding: 20px; background-color: palegreen">${message}</div>
</c:if>
<h3>직원 조회 / 수정</h3>
<form action="">
    번호
    <input type="number" name="id">
    <button>조회</button>
</form>
<hr>
<h3>${employee.id}번 직원</h3>
<form action="/main30/sub2/update" method="post" onsubmit="return confirm('수정하시겠습니까?')">
    <div>
        last name
        <input type="text" value="${employee.lastName}" name="lastName">
    </div>
    <div>
        first name
        <input type="text" value="${employee.firstName}" name="firstName">
    </div>
    <div>
        birth date
        <input type="date" value="${employee.birthDate}" name="birthDate">
    </div>
    <div>
        photo
        <input type="text" value="${employee.photo}" name="photo">
    </div>
    <div>
        notes
        <textarea name="notes" id="" cols="30" rows="10">${employee.notes}</textarea>
        <%--<input type="text" value="${employee.notes}" name="notes">--%>
    </div>
    <div>
        <%--<input type="submit" value="수정">--%>
        <button>수정</button>
    </div>
</form>

</body>
</html>
