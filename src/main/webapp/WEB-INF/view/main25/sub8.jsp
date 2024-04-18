<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, tr, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        table {
            width: 100%;
        }
    </style>
</head>
<body>

<h3>직원 조회</h3>
<form action="/main25/sub8">
    <input value="${prevSearch}" type="text" name="search" placeholder="직원 이름을 입력하세요">
    <button>조회</button>
</form>
<hr>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Last Name</th>
        <th>First Name</th>
        <th>Birth Date</th>
        <th>Photo</th>
        <th>Notes</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${employees}" var="employee">
        <tr>
            <td>${employee.id}</td>
            <td>${employee.lastName}</td>
            <td>${employee.firstName}</td>
            <td>${employee.birthDate}</td>
            <td>${employee.photo}</td>
            <td>${employee.notes}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
