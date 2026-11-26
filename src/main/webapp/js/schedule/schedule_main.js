
$(document).ready(function() {
    $('.banner-slider').slick({
        prevArrow: $('.custom-prev'),
        nextArrow: $('.custom-next'),
    });
    $('.recommend-slider').slick({
        isInline: true,
        slidesToShow: 2,
        prevArrow: $('.custom-prev'),
        nextArrow: $('.custom-next'),
    });
});
