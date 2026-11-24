<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>
<form action="/board/add" method="post">
    <div class="container">
        <div>제목
        <input type="text">
        </div>
    </div>
    <div>
        <div>주제<select name="category" id="category">
            <option value="" selected disabled>주제</option>
            <c:forEach items="${categories}" var="cg">
                <option value="">${cg.cg_name}</option>
            </c:forEach>
        </select></div>
    </div>
    <div>
        <div>지역<select name="place" id="place">
            <option value="" selected disabled>지역</option>
            <c:forEach items="${regions}" var="r">
                <option value="">${r.r_name}</option>
            </c:forEach>
        </select></div>
    </div>
    <div>
        <div>
            <input type="file">
        </div>
    </div>
    <div>
        <div><textarea name="" id="" cols="30" rows="10"></textarea></div>
    </div>
    <div>
        <button>완료</button>
    </div>
</form>


</body>
</html>
