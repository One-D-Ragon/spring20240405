<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- expression language 표현 언어--%>
<%-- 자바 문법이 아니다. jsp el 문법이다. --%>

<%-- 값 1 --%>
<p>${data}</p>
<p>${requestScope.data}</p>
<p>${requestScope["data"]}</p>

<%--requestScope이라는 곳에 들어가있다--%>
<%-- <p>${데이타}</p> --%>
<%-- <p>${requestScope[3]}</p> --%>
<p>${requestScope["데이타"]}</p>
<p>${requestScope["3"]}</p>

</body>
</html>
