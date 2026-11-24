<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/index.css">
</head>
<body>
<div class="container">
    <h1 style="text-align: center">게시판</h1>
    <div class="content">
        <div class="flex-box" style="display: flex; gap: 16px;">
            <button onclick="location.href='/board/add'">글쓰기</button>
            <button>목록별로 보기</button>
            <button>사진별로 보기</button>
        <div class="drop_down">
            <select name="place" id="place">
                <option value="" selected disabled>지역</option>
                <c:forEach items="${regions}" var="r">
                <option value="">${r.r_name}</option>
                </c:forEach>
            </select>
            <select name="category" id="category">
                <option value="" selected disabled>주제</option>
                <c:forEach items="${categories}" var="cg">
                    <option value="">${cg.cg_name}</option>
                </c:forEach>
            </select>
        </div>
            <div class="search">
                <input type="text" placeholder="검색어를 입력하세요">
                <button>검색</button>
            </div>
        </div>
        <div class="board" style="display: flex; gap: 20px;">
            <div>작성자</div>
            <div>지역</div>
            <div>제목</div>
            <div>좋아요</div>
            <div>조회수</div>
            <div>스크랩수</div>
            <div>날짜</div>
<%--        </div>--%>
<%--        <c:forEach items="${어트리뷰트 값쓰셈}" var="board">--%>
<%--            <div>${작성자}</div>--%>
<%--            <div>${지역}</div>--%>
<%--            <div>${제목}</div>--%>
<%--            <div>${좋아요}</div>--%>
<%--            <div>${조회수}</div>--%>
<%--            <div>${스크랩수}</div>--%>
<%--            <div>${날짜}</div>--%>
<%--        </c:forEach>--%>
    </div>
</div>

</body>
</html>
