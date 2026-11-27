<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
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

<%-- 메인 top 고정부분 --%>
<jsp:include page="info_mainTOP.jsp"></jsp:include>

<%-- 대도시명 --%>
<div class="ba_name">
    ${viewBA[0].ba_name}
</div>

<%-- 가게 정보 --%>
<div>
    <c:forEach items="${viewRes}" var="sa">
        <div class="sa_names">${sa.sa_name}</div>

        <c:forEach items="${sa.restaurants}" var="r">
            <div class="area-info">
                    <%-- 가게 사진 --%>
                <div class="area-img">
                    <img src="${r.rs_img}">
                </div>
                    <%-- 가게 이름 + 설명 --%>
                <div class="area-details">
                    <div class="area-name">${r.rs_name}</div>
                    <div class="res-description">
                        <div>가게위치: ${r.rs_place}</div>
                        <div>영업시간: ${r.rs_time}</div>
                        <div>가게전화: ${r.rs_call}</div>
                        <div>기타정보: ${r.rs_info}</div>
                    </div>
                </div>
            </div>

        </c:forEach>
    </c:forEach>
</div>


</body>
</html>
