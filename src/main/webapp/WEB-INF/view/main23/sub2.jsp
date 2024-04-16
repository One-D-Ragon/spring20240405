<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>고객 이름들</h1>
<ol>
    <c:forEach items="${nameList}" var="name" varStatus="status">
        <tr>
            <td>
                    ${status.count}
            </td>
            <td>
                    ${name}
            </td>
        </tr>
    </c:forEach>
</ol>

</body>
</html>
