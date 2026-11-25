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

<%-- 메인 지도 사진 --%>
<div class="main-top">
    <img src="img/info/main_map/map.png">

    <%-- 메인 버튼 4개 --%>
    <div class="main-right">
        <span style="color: #263B50"><h1>어떤걸 보시겠어요?</h1></span>
        <div>
            <button onclick="location.href='/product'">지역 특산품 소개</button>
        </div>
        <div>
            <button onclick="location.href='/area'">지역별 소도시 소개</button>
        </div>
        <div>
            <button onclick="location.href='/restaurant'">지역 맛집 소개</button>
        </div>
        <div>
            <button onclick="location.href='/event'">지역 축제 및 이벤트</button>
        </div>
    </div>
</div>

</body>
</html>
