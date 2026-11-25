$(function(){
    $("#submitBtn").click(function () {

        let content = $("#c_content").val();

        $.ajax({
            url: `/board/detail`, method: "POST",
            data:{
                c_b_no: 
            }
        }).done(function (resData) {
            console.log(resData);
        }).fail(function () {

        })
    });
});