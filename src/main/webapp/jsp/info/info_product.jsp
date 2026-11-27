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


<%-- 소도시명 --%>
<div>
    <c:forEach items="${viewSA}" var="sa">
    <div class="sa_names">${sa.sa_name}</div>

    <c:forEach items="${sa.products}" var="p">
        <%-- 제품 하나의 영역 --%>
    <div class="product-info">
            <%-- 제품 사진 박스 --%>
        <div class="product-info-img">
            <img src="${p.p_img}">
        </div>
            <%-- 제품 상세정보 박스 --%>
        <div class="product-Details">
            <span style="font-size: 30px; color: white"><div>${p.p_name}</div></span>
            <div>가격: ${p.p_price} 원</div>
            <div>${p.p_info}</div>
        </div>
        </c:forEach>
        </c:forEach>
    </div>
</div>




</body>
</html>
