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

<h3>고객 목록</h3>
<%--<form action="/main25/sub4">--%>
<%-- action의 값이 없거나 생략되면 현재 요청 경로로 보냄 --%>
<hr>
<table>
    <thead>
    <tr>
        <th>id</th>
        <th>name</th>
        <th>contact</th>
        <th>address</th>
        <th>city</th>
        <th>post</th>
        <th>country</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${customerList}" var="customer">
        <tr>
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.contactName}</td>
            <td>${customer.address}</td>
            <td>${customer.city}</td>
            <td>${customer.postalCode}</td>
            <td>${customer.country}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div>
    <c:if test="${currentPage != 1}">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="1"/>
        </c:url>
        <span>
            <a href="${link}">맨앞</a>
        </span>
    </c:if>
    <c:if test="${not empty prevPageNumber}">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="${prevPageNumber}"/>
        </c:url>
        <span>
            <a href="${link}">이전</a>
        </span>
    </c:if>
    <c:forEach begin="${beginPageNumber}" end="${endPageNumber}" var="pageNumber">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="${pageNumber}"/>
        </c:url>
        <span>
        <%-- <a href="/main27/sub1?page=${pageNumber}">${pageNumber}</a>
             코드가 단순할 경우에는 사용이 가능
             코드가 복잡할 경우 <c:url> 사용 --%>
            <a class="${currentPage eq pageNumber ? 'active' : ''}" href="${link}">${pageNumber}</a>
        </span>
    </c:forEach>

    <c:if test="${not empty nextPageNumber}">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="${nextPageNumber}"/>
        </c:url>
        <span>
            <a href="${link}">다음</a>
        </span>
    </c:if>
    <c:if test="${currentPage != lastPageNumber}">
        <c:url var="link" value="/main27/sub1">
            <c:param name="page" value="${lastPageNumber}"/>
        </c:url>
        <span>
            <a href="${link}">맨뒤</a>
        </span>
    </c:if>
</div>

</body>
</html>
