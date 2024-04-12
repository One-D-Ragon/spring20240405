<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div>
    <div>
        navbar4의 attr1 : ${attr1} <%--navbar4에서 attr1 사용 불가(scope가 page)--%>
    </div>
    <div>
        navbar4의 attr2 : ${attr2} <%--attr2 사용 가능(scope가 request)--%>
    </div>
    <div>
        navbar4의 attr3 : ${attr3} <%-- 좁은 영역에서부터 attribute 찾음 --%>
    </div>

    navbar4
</div>