function handleViewPlace(dom){
    console.log(dom);

    const no = $(dom).data("no");
    console.log(no);

    $.ajax({
        url : '/schedule/detail',
        contentType: 'application/json; charset=UTF-8',
        data : {
            spot_no : no
        }
    }).done( (res) => {
        console.log(res);

        $('#place').val(res.spot.spot_name);
        $('#memo').val(res.spot.spot_address);

    }).fail((err) => {
        console.error("error:", err);
    })
}