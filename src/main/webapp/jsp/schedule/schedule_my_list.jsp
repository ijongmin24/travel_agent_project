<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.8.0.js"
            integrity="sha256-/kBJEgNvXFuC0vfFREdzfv7vyPT1es3X+YuHXzwOmtA=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="/css/content.css">
    <script src="/js/date_share.js"></script>
<body>
<div class="container">
    <h1 style="text-align: center">내 일정 목록</h1>
    <div class="content">
        <div class="board" style="display: flex; gap: 20px;">
            <div>지역</div>
            <div>제목</div>
            <div>시작일</div>
            <div>종료일</div>
            <div>만든 날짜</div>
            <div>수정한 날짜</div>
        </div>
        <c:forEach items="${travels}" var="t">
            <div class="board" style="display: flex; gap: 20px;">
                <div>${t.r_name}</div>
                <div>${t.t_title}</div>
                <div>${t.t_start_date}</div>
                <div>${t.t_end_date}</div>
                <div>${t.t_created_date}</div>
                <div>${t.t_updated_date}</div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>