<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach items="${myList}" var="item" varStatus="status">
    <%-- varStatus : 태그 내에서 반복 관련 정보를 제공하는 속성--%>
    <%-- 몇 번째 attribute인지 알 수 있다--%>
    <div style="border: 1px solid black; margin: 5px;">
        <p>index : ${status.index}</p>
            <%-- 현재 반복의 횟수(0부터 시작), items에서 정의한 항목을 가리키는 index 번호--%>
        <p>count : ${status.count}</p>
            <%-- 현재 반복의 횟수(1부터 시작)--%>
        <p>first : ${status.first}</p>
            <%-- 현재 루프가 첫번째인지를 판단한다. boolean값이 출력된다--%>
        <p>last : ${status.last}</p>
            <%-- 현재 루프가 마지막인지를 판단한다. boolean값이 출력된다--%>
        <p>current : ${status.current}</p>
            <%--현재 for문의 해당하는 items/번호--%>
            <%--
                begin : for문의 시작 인덱스
                end : for문의 마지막 인덱스
                step : for문의 증가값(간격)
            --%>
    </div>
</c:forEach>

<hr>
<p>
    <c:forEach items="${myList}" varStatus="status" var="item">
        ${item}
        <c:if test="${not status.last}">
            ,
        </c:if>
    </c:forEach>
</p>

<%-- todo : forEach 작성해보기--%>
<%-- 기술들: java, css, react--%>
<c:forEach items="${myList}" varStatus="status">
    <c:if test="${status.first}">
        기술들:
    </c:if>
    ${status.current}
    <c:if test="${not status.last}">
        ,
    </c:if>
</c:forEach>
</body>
</html>
