// 광고 슬라이더 (이벤트)
$(document).ready(function () {

    $('.eventslider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        infinite: true,
        autoplay: true
    });

    // 왼쪽 버튼
    $('.prev-btn').click(function () {
        $('.eventslider').slick('slickPrev');
    });

    // 오른쪽 버튼
    $('.next-btn').click(function () {
        $('.eventslider').slick('slickNext');
    });

    // 광고 슬라이더 (맛집)
    $('.restaurant-slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        infinite: true,
        autoplay: true
    });

    // 왼쪽 버튼
    $('.prev-btn2').click(function () {
        $('.restaurant-slider').slick('slickPrev');
    });

    // 오른쪽 버튼
    $('.next-btn2').click(function () {
        $('.restaurant-slider').slick('slickNext');
    });
});