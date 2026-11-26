function handleViewPlace(dom) {
    console.log(dom);

    const no = $(dom).data("no");

    $.ajax({
        url: '/schedule/detail',
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

$("#map-container").html(`<iframe
                width="600"
                height="450"
                style="border:0"
                loading="lazy"
                allowfullscreen
                referrerpolicy="strict-origin-when-cross-origin"
                src="https://www.google.com/maps/embed/v1/place?key=${CONFIG.GOOGLE_MAPS_API_KEY}&q=Space+Needle,Seattle+WA">
        </iframe>
`);