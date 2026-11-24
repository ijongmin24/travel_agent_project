<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.8.0.js" integrity="sha256-/kBJEgNvXFuC0vfFREdzfv7vyPT1es3X+YuHXzwOmtA=" crossorigin="anonymous"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<body>
    <div>
        <button>내 일정 목록 조회</button>
        <button>나만의 일정 만들기</button>
        <button>다른 회원 일정 찾아보기</button>
        <button>일정 수정 및 삭제</button>
    </div>

    <div class="banner-slider">
<%--        forEach--%>
        <div>your content1</div>
        <div>your content2</div>
        <div>your content3</div>
    </div>

    <h1>다른 회원들이 많이 본 일정</h1>

    <h1><span>모몽가</span> 님을 위한 추천</h1>

    <div class="recommend-slider">
        <%--        forEach--%>
        <div>your content1</div>
        <div>your content2</div>
        <div>your content3</div>
        <div>your content4</div>
        <div>your content5</div>
        <div>your content6</div>
        <div>your content7</div>
    </div>

</body>
<script src="/js/schedule/schedule_main_js.js"></script>
</html>