<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--  상단 고정 지도맵  --%>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일본 지역 지도</title>
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
                    <button onclick="location.href='/info/main?r_no=1'" class="prefecture" data-id="hokkaido">홋카이도</button>
                </div>

                <div class="map-region tohoku">
                    <button class="prefecture" data-id="aomori">아오모리</button>
                    <button class="prefecture" data-id="akita">아키타</button>
                    <button class="prefecture" data-id="iwate">이와테</button>
                    <button class="prefecture" data-id="yamagata">야마가타</button>
                    <button class="prefecture" data-id="miyagi">미야기</button>
                    <button class="prefecture" data-id="fukushima">후쿠시마</button>
                </div>

                <div class="map-region kanto">
                    <button class="prefecture" data-id="gunma">군마</button>
                    <button class="prefecture" data-id="tochigi">도치기</button>
                    <button class="prefecture" data-id="saitama">사이타마</button>
                    <button class="prefecture" data-id="ibaraki">이바라키</button>
                    <button class="prefecture" data-id="tokyo">도쿄</button>
                    <button class="prefecture" data-id="chiba">치바</button>
                    <button class="prefecture" data-id="kanagawa">가나가와</button>
                </div>

                <div class="map-region chubu">
                    <button class="prefecture" data-id="ishikawa">이시카와</button>
                    <button class="prefecture" data-id="toyama">도야마</button>
                    <button class="prefecture" data-id="niigata">니가타</button>
                    <button class="prefecture" data-id="fukui">후쿠이</button>
                    <button class="prefecture" data-id="gifu">기후</button>
                    <button class="prefecture" data-id="nagano">나가노</button>
                    <button class="prefecture" data-id="aichi">아이치</button>
                    <button class="prefecture" data-id="yamanashi">야마나시</button>
                    <button class="prefecture" data-id="shizuoka">시즈오카</button>
                </div>

                <div class="map-region kinki">
                    <button class="prefecture" data-id="hyogo">효고</button>
                    <button class="prefecture" data-id="kyoto">교토</button>
                    <button class="prefecture" data-id="shiga">시가</button>
                    <button class="prefecture" data-id="osaka">오사카</button>
                    <button class="prefecture" data-id="nara">나라</button>
                    <button class="prefecture" data-id="mie">미에</button>
                    <button class="prefecture" data-id="wakayama">와카야마</button>
                </div>

                <div class="map-region chugoku">
                    <button class="prefecture" data-id="yamaguchi">야마구치</button>
                    <button class="prefecture" data-id="shimane">시마네</button>
                    <button class="prefecture" data-id="tottori">돗토리</button>
                    <button class="prefecture" data-id="hiroshima">히로시마</button>
                    <button class="prefecture" data-id="okayama">오카야마</button>
                </div>

                <div class="map-region shikoku">
                    <button class="prefecture" data-id="ehime">에히메</button>
                    <button class="prefecture" data-id="kochi">고치</button>
                    <button class="prefecture" data-id="kagawa">가가와</button>
                    <button class="prefecture" data-id="tokushima">도쿠시마</button>
                </div>

                <div class="map-region kyushu">
                    <button class="prefecture" data-id="saga">사가</button>
                    <button class="prefecture" data-id="fukuoka">후쿠오카</button>
                    <button class="prefecture" data-id="oita">오이타</button>
                    <button class="prefecture" data-id="nagasaki">나가사키</button>
                    <button class="prefecture" data-id="kumamoto">구마모토</button>
                    <button class="prefecture" data-id="miyazaki">미야자키</button>
                    <button class="prefecture" data-id="kagoshima">가고시마</button>
                </div>

                <div class="map-region okinawa">
                    <button class="prefecture" data-id="okinawa">오키나와</button>
                </div>

            </section>
        </section>
    </main>

    <%-- 메인 버튼 4개 --%>
    <div class="main-right">
        <span style="color: #263B50"><h1>어떤걸 보시겠어요?</h1></span>
        <div>
            <button onclick="location.href='/info/product'">지역 특산품 소개</button>
        </div>
        <div>
            <button onclick="location.href='/info/area'">지역별 소도시 소개</button>
        </div>
        <div>
            <button onclick="location.href='/info/restaurant'">지역 맛집 소개</button>
        </div>
        <div>
            <button onclick="location.href='/info/event'">지역 축제 및 이벤트</button>
        </div>
    </div>
</div>

</body>
</html>
