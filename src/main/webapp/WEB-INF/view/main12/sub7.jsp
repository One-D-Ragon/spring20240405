<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .table {
            border: 1px solid black;
            border-collapse: collapse;
            width: 100%;
        }

        .table th, .table td {
            border: 1px solid black;
            text-align: center;
            padding: 5px;
        }
    </style>
</head>
<body>
<h3>선수 목록</h3>
<table class="table">
    <thead>
    <tr>
        <th>No.</th>
        <th>이름</th>
        <th>팀</th>
        <th>국적</th>
        <th>종목</th>
        <th>포지션</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${playerList}" varStatus="status" var="player">
        <tr>
            <td>${status.count}</td>
            <td>${player.name}</td>
            <td>${player.team}</td>
            <td>${player.country}</td>
            <td>${player.event}</td>
            <td>
                <c:forEach items="${player.positions}" var="position" varStatus="stat">
                    ${position}
                    <c:if test="${not stat.last}">
                        ,
                    </c:if>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
