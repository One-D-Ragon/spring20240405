<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
    <style>
        table, th, tr, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        table {
            width: 100%;
        }
    </style>
</head>
<body>
<h3>상품명으로 상품들 조회</h3>
<form action="/main25/sub6">
    <input value="${prevSearch}" type="text" name="search" placeholder="상품명을 입력하세요">
    <%--form 내의 button 요소는 submit 버튼 역할함--%>
    <button>조회</button>
    <%--    <input type="submit" value="조회">--%>
</form>
<hr>
<c:if test="${empty products}" var="emptyProducts">
    <p>조회된 상품이 없습니다.</p>
</c:if>
<c:if test="${not empty products}">
    <table>
        <thead>
        <tr>
            <th>id</th>
            <th>name</th>
            <th>supplier id</th>
            <th>category id</th>
            <th>unit</th>
            <th>price</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${products}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.supplierId}</td>
                <td>${product.categoryId}</td>
                <td>${product.unit}</td>
                <td>${product.price}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

</body>
</html>
