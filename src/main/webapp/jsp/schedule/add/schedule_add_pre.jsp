<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/schedule/add/pre" method="post"
      style="display: flex; align-items: center; justify-content: center; width: 100%; height: 300px; gap : 16px">
    <label for="region">지역</label>
    <select name="region" id="region">
        <option value="" selected>-- 지역 선택 --</option>
        <c:forEach items="${regions}" var="r">
            <option value="${r_no}">${r.r_name}</option>
        </c:forEach>
    </select>

    <label for="startDate">시작일</label>
    <input type="date" name="startDate">
    <label for="endDate">종료일</label>
    <input type="date" name="endDate">

    <button>다음</button>
</form>
</body>
</html>
