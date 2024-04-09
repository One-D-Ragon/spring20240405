<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h3>choose, when, otherwise</h3>
<c:choose>
    <c:when test="true">
        <p>첫번째 when</p>
    </c:when>
    <%--
        첫번째 when의 연산결과가 true이면 첫번째 when이 출력되고
        첫번째 when이 true가 아니면 두번째 when을 확인해서 true면 출력되고
        모든 when이 false면 otherwise가 출력된다
    --%>
    <c:when test="true">
        <p>두번째 when</p>
    </c:when>
    <c:otherwise>
        <p>otherwise 부분</p>
    </c:otherwise>
</c:choose>

<hr>
<c:choose>
    <c:when test="${age < 10}">
        <p>어린이용 콘텐츠</p>
    </c:when>
    <c:when test="${age < 20}">
        <p>청소년용 콘텐츠</p>
    </c:when>
    <c:otherwise>
        <p>성인용 콘텐츠</p>
    </c:otherwise>
</c:choose>


</body>
</html>
