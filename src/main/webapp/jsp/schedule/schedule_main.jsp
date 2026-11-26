<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.8.0.js"
            integrity="sha256-/kBJEgNvXFuC0vfFREdzfv7vyPT1es3X+YuHXzwOmtA=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="/css/schedule/schedule_main.css"/>
<body>
<div class="schedule-button-container">
    <div>
        <button onclick="location.href='/schedule/list'">내 일정 목록 조회</button>
        <button onclick="location.href='/schedule/add/pre'">나만의 일정 만들기</button>
    </div>
    <div>
        <button onclick="location.href='/schedule/list/others'">다른 회원 일정 찾아보기</button>
        <button>내 일정 수정 및 삭제</button>
    </div>
</div>

<div class="banner-slider-wrapper">
    <button type="button" class="custom-prev">❮</button>
    <div class="banner-slider">
        <%--        forEach--%>
        <div><img src="img/info/slider-event/matsuyama.jpeg"></div>
        <div><img src="img/info/slider-event/nagasaki.jpeg"></div>
        <div><img src="img/info/slider-event/yakusima.jpeg"></div>
    </div>
    <button type="button" class="custom-next">❯</button>
</div>

<h1>다른 회원들이 많이 본 일정</h1>

<h1><span>모몽가</span> 님을 위한 추천</h1>

<div class="recommend-slider-wrapper">
    <button type="button" class="custom-prev">❮</button>
    <div class="recommend-slider">
        <%--        forEach--%>
        <div><img src="img/info/slider-event/matsuyama.jpeg"></div>
            <div><img src="img/info/slider-event/nagasaki.jpeg"></div>
            <div><img src="img/info/slider-event/yakusima.jpeg"></div>
            <div><img src="img/info/slider-event/matsuyama.jpeg"></div>
            <div><img src="img/info/slider-event/yakusima.jpeg"></div>
    </div>
    <button type="button" class="custom-next">❯</button>
</div>

</body>
<script src="/js/schedule/schedule_main.js"></script>
</html>