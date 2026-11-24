<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/index.css">
</head>
<body>

<div class="header">
    <div class="main-logo">
        <img src="/img/main/main.png">
    </div>

    <div class="login-box">
        <div>dokoe를 더 안전하고 편리하게 이용하세요</div>
        <div><button class="login-button">dokoe 로그인</button></div>
    </div>
</div>

<div class="main-button-warp">
    <button onclick="location.href='/schedule'">일정</button>
    <button onclick="">관광지 소개</button>
    <button onclick="">게시판</button>
    <button onclick="">마이페이지</button>
</div>

<div class="search">
    <jsp:include page="/jsp/search.jsp"></jsp:include>
</div>

<div class="content">
    <jsp:include page="${content}"></jsp:include>
</div>



</body>
</html>