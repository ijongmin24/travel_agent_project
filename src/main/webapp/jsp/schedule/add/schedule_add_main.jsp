<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/js/config.js"></script>
    <script src="https://code.jquery.com/jquery-3.8.0.js"
            integrity="sha256-/kBJEgNvXFuC0vfFREdzfv7vyPT1es3X+YuHXzwOmtA=" crossorigin="anonymous"></script>
</head>
<body>

<div style="display: flex; flex-direction: row; width: 100%; margin-top : 20px">
    <div style="display:flex; flex-direction: column; justify-content:center; align-items:center; gap:16px;min-width: 50%;">
        <button>출발지</button>
        <button onclick="handleViewPlace(this)" data-no="1">히루젠</button>
        <button onclick="handleViewPlace(this)" data-no="2">구라시키 미관지구</button>
        <button>+</button>
        <button>도착지</button>
    </div>

    <div style="display:flex; flex-direction:column; align-items:center; justify-content:center;  min-width: 50%;">
        <div style="display: flex; width: 100%; gap :12px; justify-content:center; margin-bottom: 20px">
            <button>보조 기능</button>
            <div>상세 보기</div>
            <button>다른 사람 일정 가져오기</button>
        </div>

        <div id="map-container" style="height: 400px; width: 400px;"></div>

        <label for="startDate">날짜</label>
        <input type="date" id="startDate">
        <label for="place">장소</label>
        <%--    검색 및 등록--%>
        <input type="text" id="place">
        <label for="memo">메모</label>
        <textarea id="memo"></textarea>

        <div style="display: flex; align-items: center; justify-content: center; gap: 16px">
            <button>등록</button>
            <button>취소</button>
        </div>
    </div>
</div>
</body>
<script src="/js/schedule/schedule_add_main.js"></script>
</html>
