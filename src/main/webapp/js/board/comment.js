$(function(){
    $("#submitBtn").click(function () {

        let no = $("#c_content").data("no");

        let content = $("#c_content").val();

        $.ajax({
            url: `/board/detail`,
            method: "POST",
            data:{
                c_b_no: no,
                c_content: content,

            }
        }).done(function (resData) {
            console.log(resData);
            $('#commentList').prepend(resData.content);
        }).fail(function () {

        })
    });
});