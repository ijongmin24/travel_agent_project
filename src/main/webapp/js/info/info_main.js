    // 광고 슬라이더
    $(document).ready(function(){

    $('.slider').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        dots: true,
        infinite: true,
        autoplay: true
    });

    // 왼쪽 버튼
    $('.prev-btn').click(function(){
        $('.slider').slick('slickPrev');
    });

    // 오른쪽 버튼
    $('.next-btn').click(function(){
        $('.slider').slick('slickNext');
    });
});