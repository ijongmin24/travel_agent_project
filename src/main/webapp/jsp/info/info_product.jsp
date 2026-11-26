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
<c:forEach items="${viewSAProduct}" var="sa">
    <div class="sa_name">
            ${sa.sa_name}
    </div>
</c:forEach>

<%-- 특산품 전체 영역 --%>
<div class="product-container">
    <c:forEach items="${products}" var="p">
        <%-- 제품 하나의 영역 --%>
        <div class="product-info">
                <%-- 제품 사진 박스 --%>
            <div class="product-info-img">
                    ${p.p_img}
            </div>
                <%-- 제품 상세정보 박스 --%>
            <div class="product-Details">
                <div>${p.p_name}</div>
                <div>${p.p_price}</div>
                <div>${p.p_info}</div>
            </div>
        </div>
    </c:forEach>
</div>


</body>
</html>
