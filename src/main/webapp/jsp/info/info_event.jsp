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
<c:forEach items="${viewBA}" var="ba">
    <div class="ba_name">
            ${ba.ba_name}
    </div>
</c:forEach>

<%-- 이벤트/축제 정보 --%>
<c:forEach items="${viewEvent}" var="e">
    <div class="area-info">
            <%-- 이벤트/축제 사진 --%>
        <div class="area-img">
                <img src="${e.e_img}">
        </div>
            <%-- 이벤트/축제 이름 + 설명 --%>
        <div class="area-details">
            <div class="area-name">${e.e_name}</div>
            <div class="res-description">
                <div>${e.e_info}</div>
                <div>장소: ${e.e_place}</div>
                <div>기간: ${e.e_date}</div>
            </div>
        </div>
    </div>
</c:forEach>


</body>
</html>
