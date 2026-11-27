<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--  상단 고정 지도맵  --%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일본 지역 지도</title>
    <script src="https://code.jquery.com/jquery-3.8.0.js"
            integrity="sha256-/kBJEgNvXFuC0vfFREdzfv7vyPT1es3X+YuHXzwOmtA=" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="/css/info/map.css">

    <!-- Info　Main CSS -->
    <link rel="stylesheet" href="/css/info/info.css">

    <!-- Slick 기본 CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css">

    <!-- Slick 테마 CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css">
</head>
<body>

<div class="map-warp"></div>

<%-- 메인 지도 사진 --%>
<div class="main-top">
    <main class="page">
        <section class="map-layout">

            <section class="japan-map" aria-label="일본 도도부현 지도">
                <div class="map-region hokkaido">
                    <button class="prefecture" data-id="1">홋카이도
                    </button>
                </div>

                <div class="map-region tohoku">
                    <button class="prefecture" data-id="2">아오모리</button>
                    <button class="prefecture" data-id="5">아키타</button>
                    <button class="prefecture" data-id="3">이와테</button>
                    <button class="prefecture" data-id="6">야마가타</button>
                    <button class="prefecture" data-id="4">미야기</button>
                    <button class="prefecture" data-id="7">후쿠시마</button>
                </div>

                <div class="map-region kanto">
                    <button class="prefecture" data-id="10">군마</button>
                    <button class="prefecture" data-id="9">도치기</button>
                    <button class="prefecture" data-id="11">사이타마</button>
                    <button class="prefecture" data-id="8">이바라키</button>
                    <button class="prefecture" data-id="13">도쿄</button>
                    <button class="prefecture" data-id="12">치바</button>
                    <button class="prefecture" data-id="14">가나가와</button>
                </div>

                <div class="map-region chubu">
                    <button class="prefecture" data-id="17">이시카와</button>
                    <button class="prefecture" data-id="16">도야마</button>
                    <button class="prefecture" data-id="15">니가타</button>
                    <button class="prefecture" data-id="18">후쿠이</button>
                    <button class="prefecture" data-id="21">기후</button>
                    <button class="prefecture" data-id="20">나가노</button>
                    <button class="prefecture" data-id="23">아이치</button>
                    <button class="prefecture" data-id="19">야마나시</button>
                    <button class="prefecture" data-id="22">시즈오카</button>
                </div>

                <div class="map-region kinki">
                    <button class="prefecture" data-id="28">효고</button>
                    <button class="prefecture" data-id="26">교토</button>
                    <button class="prefecture" data-id="25">시가</button>
                    <button class="prefecture" data-id="27">오사카</button>
                    <button class="prefecture" data-id="29">나라</button>
                    <button class="prefecture" data-id="24">미에</button>
                    <button class="prefecture" data-id="30">와카야마</button>
                </div>

                <div class="map-region chugoku">
                    <button class="prefecture" data-id="35">야마구치</button>
                    <button class="prefecture" data-id="32">시마네</button>
                    <button class="prefecture" data-id="31">돗토리</button>
                    <button class="prefecture" data-id="34">히로시마</button>
                    <button class="prefecture" data-id="33">오카야마</button>
                </div>

                <div class="map-region shikoku">
                    <button class="prefecture" data-id="38">에히메</button>
                    <button class="prefecture" data-id="39">고치</button>
                    <button class="prefecture" data-id="37">가가와</button>
                    <button class="prefecture" data-id="36">도쿠시마</button>
                </div>

                <div class="map-region kyushu">
                    <button class="prefecture" data-id="41">사가</button>
                    <button class="prefecture" data-id="40">후쿠오카</button>
                    <button class="prefecture" data-id="44">오이타</button>
                    <button class="prefecture" data-id="42">나가사키</button>
                    <button class="prefecture" data-id="43">구마모토</button>
                    <button class="prefecture" data-id="45">미야자키</button>
                    <button class="prefecture" data-id="46">가고시마</button>
                </div>

                <div class="map-region okinawa">
                    <button class="prefecture" data-id="47">오키나와</button>
                </div>

            </section>
        </section>
    </main>

    <%-- 메인 버튼 4개 --%>
    <div class="main-right">
        <span style="color: #263B50"><h1>어떤걸 보시겠어요?</h1></span>
        <div>
            <button onclick="location.href='/info/product?r_no=1'">지역 특산품 소개</button>
        </div>
        <div>
            <button onclick="location.href='/info/area?r_no=1'">지역별 소도시 소개</button>
        </div>
        <div>
            <button onclick="location.href='/info/restaurant?r_no=1'">지역 맛집 소개</button>
        </div>
        <div>
            <button onclick="location.href='/info/event?r_no=1'">지역 축제 및 이벤트</button>
        </div>
    </div>
</div>
<script src="/js/info/info_mainTOP.js"></script>
</body>
</html>
