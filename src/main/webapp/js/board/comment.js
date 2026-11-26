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

            let html = "";

            resData.forEach(function(comments) {
                html +=`
                <div>
                ${comments.c_b_no}
                ${comments.c_content}
                ${comments.c_created_date}
                </div>
                `
            })

            $("#commentList").html(html);

            $("#c_content").val("");
        }).fail(function () {
            alert("failed")
        })

    });

    $("#cancelBtn").click(function () {
        $("#c_content").val("");
    })
});