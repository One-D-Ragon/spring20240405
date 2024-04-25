<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, tr, th, td {
            border-collapse: collapse;
            border: 1px solid black;
        }
    </style>
</head>
<body>

<h3>새 데이터 입력</h3>
<form action="" method="post">
    <%--    div*6>input[name][value]--%>
    <div>
        책 이름
        <input type="text" name="title" value="책 이름">
    </div>
    <div>
        저자
        <input type="text" name="name" value="저자 이름">
    </div>
    <div>
        나이
        <input type="number" name="age" value="30">
    </div>
    <div>
        가격
        <input type="number" name="price" value="12000.00" step="0.01">
    </div>
    <div>
        출판일
        <input type="date" name="published" value="2024-03-03">
    </div>
    <div>
        inserted??
        <input type="datetime-local" name="inserted" value="2024-03-03T12:12:12">
    </div>
    <div>
        <input type="submit" value="저장">
    </div>

</form>
<hr>
<h3>my_table10 책들</h3>
<table>
    <thead>
    <tr>
        <th>책 이름</th>
        <th>저자</th>
        <th>나이</th>
        <th>가격</th>
        <th>출판일</th>
        <th>inserted??</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${datas}" var="data">
        <tr>
            <td>${data.title}</td>
            <td>${data.name}</td>
            <td>${data.age}</td>
            <td>${data.price}</td>
            <td>${data.published}</td>
            <td>${data.inserted}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
