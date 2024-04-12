<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<c:set var="attr1" value="page value2" scope="page"/>
<div>
    <div>
        <%--        page value2--%>
        navbar5의 ${attr1}
        navbar5의 ${pageScope.attr1}
        navbar5의 ${pageScope["attr1"]}
    </div>
    <div>
        <%--        request value1--%>
        navbar5의 ${requestScope.attr1}
        navbar5의 ${requestScope["attr1"]}
    </div>
</div>