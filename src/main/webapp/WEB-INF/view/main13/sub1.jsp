<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- set : attribute의 값을 추가
           이미 있는 attribute의 property 값을 변경할 수도 있다
--%>
<%-- 사용하기 전에 넣어야 한다--%>
<c:set var="attr1" value="손흥민"></c:set>
<%-- todo : attr2 속성 추가하기--%>
<c:set var="attr2" value="이강인"></c:set>
<c:set var="attr3" value="김하성" scope="page"></c:set>
<%-- attribute의 영역이 4가지 있다
    기본값은 page
    --%>

<p>${attr1}</p>

<%-- 이강인 --%>
<p>${attr2}</p>
<p>${attr3}</p>

<hr>
<c:set target="${obj1}" property="address" value="강남"></c:set>
<%-- todo: obj1 attribute의 age property 값을 55로 바꾸기--%>
<c:set target="${obj1}" property="age" value="55"/>
<p>${obj1.address}</p>
<p>${obj1.city}</p>
<p>${obj1.age}</p>

</body>
</html>
