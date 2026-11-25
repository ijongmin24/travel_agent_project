<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/detail.css">
</head>
<body>
<div class="container">
    <c:forEach items="${boards}" var="b">
    <div class="wrap">
        <div>${b.b_title}</div>
        <div>${b.cg_name}</div>
        <div>${b.r_name}</div>
        <div>${b.b_content}</div>
    </div>
    </c:forEach>
    <div class="comment">
        <textarea name="c_content" id="" cols="30" rows="10"></textarea>
        <button>취소</button>
        <button>등록</button>
    </div>

</div>




</body>
</html>
