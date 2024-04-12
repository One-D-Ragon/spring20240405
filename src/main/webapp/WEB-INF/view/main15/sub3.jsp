<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:set var="current1" value="sub3 value1" scope="page"/>
<%-- view 간 값 전달시 request 영역 attribute를 활용하면 됨--%>
<c:set var="current2" value="sub3" scope="request"/>

<%-- attribute의 4개의 영역 : page, request, session, application
    c:set의 scope의 기본 설정은 page (scope를 생략하면)
    page : 같은 페이지 영역 내에서 사용 가능(가장 좁은 영역)
    request 영역 : 같은 요청을 처리중인 상태에서만 모델의 어트리뷰트를 공유하는 영역(page 영역 포함)
                  서로 다른 페이지 영역
    --%>
<c:import url="navbar2.jsp"/>
<div>
    ${current1}, ${current2}
    sub3의 내용...
</div>

</body>
</html>
