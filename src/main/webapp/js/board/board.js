$(function () {
    $("#searchBtn").click(function () {

        let place = $("#place").val();
        let category = $("#category").val();

        location.href =
            "/board?place=" + place +
            "&category=" + category;
    });

});