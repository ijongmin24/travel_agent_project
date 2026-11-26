$(function(){

    // 댓글 등록
    $("#submitBtn").click(function () {

        let no = $("#c_content").data("no");
        let content = $("#c_content").val().trim();

        // 빈 댓글 방지
        if (content === "") {
            alert("댓글을 입력해주세요")
            return;
        }

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
                let date = new Date(comments.c_created_date);

                let formattedDate =
                    date.getFullYear() + "-" +
                    String(date.getMonth() + 1).padStart(2, "0") + "-" +
                    String(date.getDate()).padStart(2, "0");

                html +=`
                <div class="comment_item">
                <div class="comment_writer">
                    ${comments.c_u_id}
                </div>
                
                <div class="comment_content">
                    ${comments.c_content}
                </div>
                
                <div class="comment_info">
                <span>${formattedDate}</span>
                <button>답글</button>
                </div>
                
                </div>
                `;
            });

            $("#commentList").html(html);
            $("#c_content").val("");
        }).fail(function () {
            alert("failed")
        });

    });

    $("#cancelBtn").click(function () {
        $("#c_content").val("");
    })
});