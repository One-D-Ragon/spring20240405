<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="/main20/sub12">
    <input type="text" name="type">
    <br>
    <textarea name="content"></textarea>
    <br>
    <select name="city" id="">
        <option value="london">런던</option>
        <%--city=lonodn--%>
        <option value="seoul">서울</option>
        <%--city=seoul--%>
        <option value="chicago">시카고</option>
        <%--city=chicago--%>
    </select>
    <br>
    <input type="submit">
</form>

<hr>
<form action="/main20/sub13">
    <%--div>div*3>input:r[name=city]--%>
    <div>
        <div>
            <input type="radio" name="city" value="seoul" id="">
            서울
        </div>
        <div>
            <input type="radio" name="city" value="london" id="">
            런던
        </div>
        <div>
            <input type="radio" name="city" value="incheon" id="">
            인천 <%--텍스트와 상관없다. value 어트리뷰트와 관계가 있다. ?city=incheon--%>
        </div>
        <div>
            <input type="submit">
        </div>
    </div>
</form>

<%--form>div*3>input:c[name=foods]--%>
<form action="/main20/sub14">
    <div>
        <input type="checkbox" name="foods" id="" value="pizza">
        피자
    </div>
    <div>
        <input type="checkbox" name="foods" id="" value="noodle">
        국수
    </div>
    <div>
        <input type="checkbox" name="foods" id="" value="burger">
        햄버거
    </div>
    <div>
        <input type="submit">
    </div>
</form>

<hr>
<form action="/main20/sub15">
    <div>
        <select name="type" id="">
            <option value="type1">타입1</option>
            <option value="type2">타입2</option>
            <option value="type3">타입3</option>
        </select>
    </div>

    <div>
        <input type="radio" name="phone" id="" value="phone1">
        폰1
    </div>
    <div>
        <input type="radio" name="phone" id="" value="phone2">
        폰2
    </div>
    <div>
        <input type="radio" name="phone" id="" value="phone3">
        폰3
    </div>

    <div>
        <input type="checkbox" name="book" id="" value="book1">
        book1
    </div>
    <div>
        <input type="checkbox" name="book" id="" value="book2">
        book2
    </div>
    <div>
        <input type="checkbox" name="book" id="" value="book3">
        book3
    </div>
    <div>
        <input type="submit">
    </div>
</form>
</body>
</html>
