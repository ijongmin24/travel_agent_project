<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/add.css">
</head>
<body>
<form action="/board/add" method="post">
    <div class="container">
        <div>
            제목
            <input type="text" name="b_title">
        </div>
        <div>
            주제
            <select name="b_category" id="category">
                <option value="" selected disabled>주제</option>
                <c:forEach items="${categories}" var="cg">
                    <option value="${cg.cg_no}">${cg.cg_name}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            지역
            <select name="b_region" id="region">
                <option value="" selected disabled>지역</option>
                <c:forEach items="${regions}" var="r">
                    <option value="${r.r_no}">${r.r_name}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <input type="file" name="b_file">
        </div>
        <div>
            <textarea name="b_content" cols="30" rows="10"></textarea>
        </div>
        <div>
            <button type="submit">완료</button>
        </div>
    </div>
</form>
</body>
</html>
