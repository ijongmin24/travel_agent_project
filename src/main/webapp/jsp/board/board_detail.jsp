<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/detail.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="/js/board/comment.js"></script>
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
        <div id="commentList">
            <c:forEach items="${comments}" var="com">

                <div class="comment_item">
                    <div class="comment_writer"> ${com.c_u_id} </div>
                    <div class="comment_content"> ${com.c_content}</div>
                    <div class="comment_info">
                        <span><fmt:formatDate value="${com.c_created_date}" pattern="yyyy-MM-dd"/></span>
                        <button>답글</button>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <div class="comment_write">
        <textarea name="c_content" id="c_content"
                  placeholder="댓글을 입력해주세요."
                  data-no="${boards[0].b_no}"></textarea>
        <div class="comment_write_button">
            <button type="button" id="cancelBtn">취소</button>
            <button type="button" id="submitBtn">등록</button>
        </div>
    </div>

</div>


</body>
</html>
