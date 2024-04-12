<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:forEach begin="1" end="3" var="num">
    <p>반복 출력 코드 ${num}</p>
</c:forEach>
<hr>
<c:forEach items="${myList}" var="elem">
    <%-- 반복할 어트리뷰트 명을 items에 써준다(반복할 데이터를 지정한다)--%>
    <%-- 여러 개의 엘레멘트를 담고 있는 list를 items에 넣고--%>
    <%-- var에 변수 이름을 지정해주면 items를 전체 탐색할 수 있다--%>
    <p>${elem}</p>
</c:forEach>

<hr>
<c:forEach items="${foods}" var="food" begin="1" end="2">
    <%-- items를사용할 때는 begin과 end를 함께 사용할 수 있다--%>
    <p>${food}</p>
</c:forEach>

<hr>
<c:forEach items="${myMap}" var="entry">
    <p>${entry}</p>
    <p>${entry.key} : ${entry.value}</p>
</c:forEach>

<hr>
<c:forEach items="${cars}" var="car">
    <p>${car} ${car.key} : ${car.value}</p>
</c:forEach>

<hr>
<%-- todo: myList2 라는 이름의 attribute를 List 타입으로 넣기--%>
<c:forEach items="${myList2}" var="elem">
    <p>${elem}</p>
</c:forEach>

<hr>
<%-- todo: myMap2 라는 이름의 attribute를 Map 타입으로 넣기--%>
<c:forEach items="${myMap2}" var="entry2">
    <p>${entry2.key} : ${entry2.value}</p>
</c:forEach>
</body>
</html>
