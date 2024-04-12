<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<style>
    a {
        border: 1px solid black;
    }

    .active {
        background: linear-gradient(to right, rgb(229, 201, 229), rgb(204, 159, 236), rgb(163, 163, 255), rgb(148, 252, 148), rgb(246, 246, 176), rgb(251, 225, 176), rgb(243, 161, 161));;
    }
</style>
<div>
    <a class="${param.cur eq 'sub12' ? 'active' : ''}" href="/main15/sub12">sub12</a>
    <a class="${param.cur eq 'sub13' ? 'active' : ''}" href="/main15/sub13">sub13</a>

</div>
