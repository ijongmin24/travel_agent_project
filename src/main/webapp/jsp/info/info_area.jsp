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

<%-- 소도시명 --%>
<c:forEach items="${viewSA}" var="sa">
    <div class="area-info">
            <%-- 지역 사진 --%>
        <div class="area-img">
                ${sa.sa_img}
        </div>
            <%-- 지역 이름 + 설명 --%>
        <div class="area-details">
            <div class="area-name">${sa.sa_name}</div>
            <div class="area-description">${sa.sa_info}</div>
        </div>
    </div>
</c:forEach>


</body>
</html>
