<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Info　Main CSS -->
    <link rel="stylesheet" href="css/info/info.css">

    <!-- Slick 기본 CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">

    <!-- Slick 테마 CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
</head>
<body>

<%-- 메인 top 고정부분 --%>
<jsp:include page="info_mainTOP.jsp"></jsp:include>

<%-- Main slider --%>
<div class="single-item">
    <button class="prev-btn">❮</button>

    <div class="slider eventslider">
        <div><img src="img/info/slider-event/matsuyama.jpeg"></div>
        <div><img src="img/info/slider-event/nagasaki.jpeg"></div>
        <div><img src="img/info/slider-event/yakusima.jpeg"></div>
    </div>

    <button class="next-btn">❯</button>
</div>

<%-- 특산품 추천 --%>
<div class="specialty-product-recommend">
    <h1>요즘 많이 찾는 지역 특산품은 뭘까?</h1>
    <div class="recommend">
        <div>
            <img src="img/info/slider-restaurant/우사기2.jpeg">
            <span>우사기 1</span>
        </div>
        <div>
            <img src="img/info/slider-restaurant/우사기2.jpeg">
            <span>우사기 2</span>
        </div>
        <div>
            <img src="img/info/slider-restaurant/우사기2.jpeg">
            <span>우사기 3</span>
        </div>
    </div>
</div>

<div class="recommend-board">
    <%-- 식당 추천 --%>
    <div>
        <h1>유행하는 요즘 맛집 🍚</h1>
        <div class="single-item2">
            <button class="prev-btn2">❮</button>

            <div class="slider restaurant-slider">
                <div><img src="img/info/slider-restaurant/우사기1.jpeg"></div>
                <div><img src="img/info/slider-restaurant/우사기2.jpeg"></div>
                <div><img src="img/info/slider-restaurant/우사기3.jpeg"></div>
            </div>

            <button class="next-btn2">❯</button>
        </div>
    </div>
    <%-- 게시판 --%>
    <div>
        <h1>현재 <span style="font-size:35px; color:red;">HOT</span>한 커뮤니케이션 💬</h1>
        <c:forEach items="${boards}" var="b">
            <div>
            제목: ${b.b_title}
            날짜: ${b.b_created_date}
            유저: ${b.b_u_id}
            </div>
        </c:forEach>
    </div>
</div>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<!-- Slick JS -->
<script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<%-- Main Slider JS --%>
<script src="js/info/info_main.js"></script>

</body>
</html>
