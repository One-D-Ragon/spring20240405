<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<div>
    <%--텍스트 인풋--%>
    <input type="text">
</div>
<div>
    <%-- 수 입력 --%>
    <input type="number">
</div>
<div>
    <%-- 날짜 입력 --%>
    <input type="date">
</div>
<div>
    <%--날짜 시간 입력--%>
    <input type="datetime-local">
</div>
<div>
    <%--file 입력--%>
    <input type="file">
</div>
<div>
    <%--암호 입력--%>
    <input type="password">
</div>
<div>
    <%--div*3>input[type=radio]--%>
    <%--하나만 선택하려면 같은 name 어트리뷰트를 가지고 있어야 한다--%>
    <div>
        <input type="radio" name="food">
        바나나
    </div>
    <div>
        <input type="radio" name="food">
        커피
    </div>
    <div>
        <input type="radio" name="food">
        피자
    </div>
</div>
<%--div>div*3>input[type=checkbox][name=food]>lorem1--%>
<div>
    <%-- 체크박스는 여러개 선택 가능--%>
    <%-- input element type attribute --%>
    <div>
        <input type="checkbox" name="food">
        Lorem.
    </div>
    <div>
        <input type="checkbox" name="food">
        Minus?
    </div>
    <div>
        <input type="checkbox" name="food">
        Assumenda.
    </div>
</div>


</body>
</html>
