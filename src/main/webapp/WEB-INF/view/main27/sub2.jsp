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

        .active {
            background-color: blue;
            color: white;
        }
    </style>
</head>
<body>

<h3>직원 조회</h3>

<table>
    <thead>
    <tr>
        <th>no</th>
        <th>id</th>
        <th>last name</th>
        <th>first name</th>
        <th>birth date</th>
        <th>photo</th>
        <th>notes</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${employeeList}" var="employee" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${employee.id}</td>
            <td>${employee.firstName}</td>
            <td>${employee.lastName}</td>
            <td>${employee.birthDate}</td>
            <td>${employee.photo}</td>
            <td>${employee.notes}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<div>
    <c:if test="${currentPage != 1}">
        <c:url var="link" value="/main27/sub2">
            <c:param name="page" value="1"/>
        </c:url>
        <span>
        <a href="${link}">맨앞</a>
    </span>
    </c:if>

    <c:if test="${not empty prevPageNumber}">
        <c:url var="link" value="/main27/sub2">
            <c:param name="page" value="${prevPageNumber}"/>
        </c:url>
        <span>
        <a href="${link}">이전</a>
    </span>
    </c:if>

    <c:forEach begin="${beginPageNumber}" end="${endPageNumber}" var="pageNumber">
        <c:url var="link" value="/main27/sub2">
            <c:param name="page" value="${pageNumber}"/>
        </c:url>
        <span>
            <a class="${currentPage eq pageNumber ? 'active' : ''}" href="${link}">${pageNumber}</a>
        </span>
    </c:forEach>

    <c:if test="${not empty nextPageNumber}">
        <c:url var="link" value="/main27/sub2">
            <c:param name="page" value="${nextPageNumber}"/>
        </c:url>
        <span>
        <a href="${link}">다음</a>
    </span>
    </c:if>


    <c:if test="${currentPage != lastPageNumber}">
        <c:url var="link" value="/main27/sub2">
            <c:param name="page" value="${endPageNumber}"/>
        </c:url>
        <span>
        <a href="${link}">맨뒤</a>
    </span>
    </c:if>
</div>


</body>
</html>
