<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:if test="${not empty message}">
    <div style="padding: 20px; background-color: pink">${message}</div>
</c:if>
<h3>직원 번호 조회</h3>
<form action="">
    번호
    <input type="number" name="id">
    <button>조회</button>
</form>
<hr>
<c:if test="${empty employee}">
    조회된 직원 정보가 없습니다
</c:if>
<c:if test="${not empty employee}">
    <div>
        id
        <input type="text" value="${employee.id}" readonly>
    </div>
    <div>
        last name
        <input type="text" value="${employee.lastName}" readonly>
    </div>
    <div>
        first name
        <input type="text" value="${employee.firstName}" readonly>
    </div>
    <div>
        birth date
        <input type="text" value="${employee.birthDate}" readonly>
    </div>
    <div>
        photo
        <input type="text" value="${employee.photo}" readonly>
    </div>
    <div>
        notes
            <%--<input type="text" value="${employee.notes}" readonly>--%>
        <textarea name="" id="" cols="30" rows="10">${employee.notes}</textarea>
    </div>

    <form action="/main29/sub2/delete" method="post" onsubmit="return confirm('삭제하시겠습니까?')">
        <input hidden type="text" name="id" readonly value="${employee.id}">
        <button>삭제</button>
    </form>
</c:if>

</body>
</html>
