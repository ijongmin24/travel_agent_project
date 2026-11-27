$(function () {
    $("#searchBtn").click(function () {

        let place = $("#place").val();
        let category = $("#category").val();

        location.href =
            "/board?place=" + place +
            "&category=" + category;
    });
});

$(function () {

    $("#searchBtn").click(function () {

        let place = $("#place").val();
        let category = $("#category").val();

        let url = new URL(window.location.href);

        // 지역 파라미터 설정
        if (place) {
            url.searchParams.set("place", place);
        } else {
            url.searchParams.delete("place");
        }

        // 주제 파라미터 설정
        if (category) {
            url.searchParams.set("category", category);
        } else {
            url.searchParams.delete("category");
        }

        // 선택값을 URL에 반영하고 페이지 이동
        location.href = url.toString();

    });

});


$(function () {

    $("#searchBtn").click(function () {

        let place = $("#place").val();
        let category = $("#category").val();
        let keyword = $("#searchInput").val().trim();

        let url = new URL(window.location.href);

        // 지역
        if (place) {
            url.searchParams.set("place", place);
        } else {
            url.searchParams.delete("place");
        }

        // 주제
        if (category) {
            url.searchParams.set("category", category);
        } else {
            url.searchParams.delete("category");
        }

        // 제목 검색어
        if (keyword) {
            url.searchParams.set("keyword", keyword);
        } else {
            url.searchParams.delete("keyword");
        }

        location.href = url.toString();
    });

    // Enter 키로 검색
    $("#searchInput").keydown(function (e) {
        if (e.key === "Enter") {
            $("#searchBtn").click();
        }
    });

});
