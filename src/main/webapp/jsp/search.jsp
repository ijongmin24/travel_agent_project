
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="search-flex-wrapper" style="display: flex;">
        <div class="search-dropdown">
            <img onclick="handleSearchDropDown()" style="width: 30px; height: 30px;" src="https://thumb.wikimedia.org/wikipedia/commons/thumb/b/b2/Hamburger_icon.svg/120px-Hamburger_icon.svg.png?utm_source=ko.wikipedia.org&utm_campaign=index&utm_content=thumbnail"/>
            <div class="search-dropdown-list" id="search-dropdown-list" style="display: none; position: absolute; background-color: white;">
                <div>주요 소도시 정보</div>
                <div>특산품 구매</div>
                <div>일정 짜는 법 가이드</div>
                <div>게시판 사용법</div>
                <div>공지사항</div>
                <div>자주 묻는 질문</div>
                <div>고객센터</div>
            </div>
        </div>
        <input name="search-keyword">
        <button>검색</button>
    </div>
</body>
<script src="/js/search.js"></script>
</html>
