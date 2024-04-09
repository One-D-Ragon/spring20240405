<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:forEach begin="1" end="3">
    <p>반복 출력 할 코드</p>
</c:forEach>
<%--
    begin : 시작 숫자 (0보다 작을 수 없다 = 마이너스 값 x)
    end : 종료 숫자
--%>

<hr>
<c:forEach begin="0" end="7" var="num"> <%--8번 반복 --%>
    <p>code...${num}</p>
</c:forEach>

<hr>
<c:forEach begin="1" end="9" var="num">
    <p>2 X ${num} = ${num * 2}</p>
</c:forEach>

<hr>
<h5>구구단 ${dan}단</h5>
<c:forEach begin="1" end="9" var="num">
    <p>${dan} x ${num} = ${dan * num}</p>
</c:forEach>

<hr>
<h5>구구단 ${dan}단 거꾸로</h5>
<%--todo: 거꾸로 출력 *9~ *1--%>
<c:forEach begin="1" end="9" var="n">
    <p>${dan} x ${10-n} = ${dan * n}</p>
</c:forEach>
</body>
</html>
