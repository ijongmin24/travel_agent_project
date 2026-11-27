<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/add.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="/js/board/addFile.js"></script>
</head>
<body>
<form action="/board/add" method="post" enctype="multipart/form-data">
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
        <div class="file-upload-box">
            <input type="file" id="b_file" multiple accept="image/*">
            <div id="preview"></div>
            <input type="file" name="b_file" id="uploadFiles" multiple hidden>
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
