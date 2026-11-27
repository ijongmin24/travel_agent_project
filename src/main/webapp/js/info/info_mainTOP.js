$('.prefecture').each( function () {
    $(this).on('click', function () {
        let id = $(this).data('id');
        location.href = `/info/main?r_no=${id}`;
    })
})
