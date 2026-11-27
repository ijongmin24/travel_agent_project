function handleViewPlace(dom) {
    // detail db에서 가져오기

    const no = $(dom).data("no");

    $.ajax({
        url: '/spot/detail',
        data: {
            spot_no: no
        }
    }).done((res) => {
        console.log(res);

        $('#place').val(res.spot.spot_name);
        $('#memo').val(res.spot.spot_address);

    }).fail((err) => {
        console.error("error:", err);
    })
}

function addSpot(){
    console.log('data : ', data);

    $.ajax({
        url: '/spot/add',
        method: 'POST',
        data: {
            spot_name : data.spot_name,
            spot_address: data.spot_address,
            spot_latitude : data.spot_latitude,
            spot_longitude : data.spot_longitude,
            spot_spotcode: data.spot_spotcode,
            spot_phone : data.spot_phone,
            spot_postal : data.spot_postal,
            spot_category: data.spot_category,
            spot_subcategory: data.spot_subcategory
        }
    }).done((res) => {
        console.log(res);

    }).fail((err) => {
        console.error("error:", err);
    })
}

function getSpots(){
    $.ajax({
        url: '/spot/list',
        data: {
            t_no: 1
        }
    }).done((res) => {
        console.log(res);

    }).fail((err) => {
        console.error("error:", err);
    })
}
getSpots();