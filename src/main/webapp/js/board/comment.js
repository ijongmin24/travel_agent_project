$(function () {

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
            data: {
                c_b_no: no,
                c_content: content,
            }
        }).done(function (resData) {
            let html = "";

            resData.forEach(function (comments) {
                // 이미 화면에 있는 댓글인지 확인
                let exists = $("#commentList .comment_item").filter(function () {
                    return $(this).find(".replyBtn").data("no") == comments.c_no;
                }).length > 0;

                // 이미 있으면 건너뛰기
                if (exists) {
                    return;
                }


                let date = new Date(comments.c_created_date);

                let formattedDate =
                    date.getFullYear() + "-" +
                    String(date.getMonth() + 1).padStart(2, "0") + "-" +
                    String(date.getDate()).padStart(2, "0");

                html += `
                <div class="comment_item">
                <div class="comment_writer">
                    ${comments.c_u_id}
                </div>
                
                <div class="comment_content">
                    ${comments.c_content}
                </div>
                
                <div class="comment_info">
                <span>${formattedDate}</span>
                <button type="button"
                class="replyBtn"
                data-no="${comments.c_no}">답글</button>
                </div>
                <div class="reply_list"></div>
                </div>
                `;
                $("#commentList").prepend(html);
            });

            // $("#commentList").html(html);
            // 댓글 입력창 비우기
            $("#c_content").val("");

            // 열려 있는 모든 대댓글 목록 닫기
            $(".reply_list").removeClass("active");

            // 열려 있는 모든 답글 입력창 제거
            $(".reply_write").remove();
        }).fail(function () {
            alert("댓글 등록 실패");
        });

    });
    // 댓글 취소
    $("#cancelBtn").click(function () {
        $("#c_content").val("");
    })

    // 답글 입력창 열기
    $(document).on("click", ".replyBtn", function () {

        let parentNo = $(this).data("no");

        console.log("답글 버튼 클릭");
        console.log("부모 댓글 번호:", parentNo);
        // 대댓글 목록 열고 닫기
        let parentItem = $(this).closest(".comment_item");
        let replyList = parentItem.children(".reply_list");
        console.log("대댓글 추가 대상:", parentItem.length);
        console.log("대댓글 목록:", replyList.length);
        console.log("추가된 답글:", replyList.html());

        // 현재 대댓글 목록이 열려 있는지 확인
        let isOpen = replyList.hasClass("active");

        // 현재 댓글의 답글 입력창만 제거
        parentItem.children(".reply_write").remove();

        // 이미 열려 있었다면 닫기
        if (isOpen) {
            replyList.removeClass("active");
            return;
        }

        // 현재 댓글의 답글 목록 열기
        replyList.addClass("active");

        let html = `
            <div class="reply_write">

                <textarea class="reply_content"
                          placeholder="답글을 입력해주세요."></textarea>

                <div class="reply_write_button">
                    <button type="button" class="replyCancelBtn">
                        취소
                    </button>

                    <button type="button"
                            class="replySubmitBtn"
                            data-parent="${parentNo}">
                        등록
                    </button>
                </div>

            </div>
        `;

        parentItem.append(html);
        // $(this).closest(".comment_item").append(html);

    });

    // 답글 취소
    $(document).on("click", ".replyCancelBtn", function () {
        $(this).closest(".reply_write").remove();
    });

    // 답글 등록
    $(document).on("click", ".replySubmitBtn", function () {

        let parentNo = $(this).data("parent");
        let no = $("#c_content").data("no");

        let replyWrite = $(this).closest(".reply_write");
        let content = replyWrite.find(".reply_content").val().trim();

        if (content === "") {
            alert("답글을 입력해주세요.");
            return;
        }

        $.ajax({
            url: "/board/detail",
            method: "POST",
            data: {
                c_b_no: no,
                c_parent_comment: parentNo,
                c_content: content
            }
        }).done(function () {
            // 현재 답글 입력창이 속한 부모 댓글 찾기
            let parentItem = replyWrite.closest(".comment_item");

            // 해당 부모 댓글의 답글 목록 찾기
            let replyList = parentItem.children(".reply_list");
            console.log("부모 댓글:", parentItem.length);
            console.log("답글 목록:", replyList.length);
            console.log("답글 목록 HTML:", replyList.html());

            // 날짜 생성
            let date = new Date();
            let formattedDate =
                date.getFullYear() + "-" +
                String(date.getMonth() + 1).padStart(2, "0") + "-" +
                String(date.getDate()).padStart(2, "0");

            // 새 답글 요소 생성
            let replyItem = $("<div>").addClass("reply_item");

            $("<div>")
                .addClass("comment_writer")
                .text("bo")
                .appendTo(replyItem);

            $("<div>")
                .addClass("comment_content")
                .text(content)
                .appendTo(replyItem);

            let commentInfo = $("<div>").addClass("comment_info");

            $("<span>")
                .text(formattedDate)
                .appendTo(commentInfo);

            commentInfo.appendTo(replyItem);

            // 해당 답글 목록에만 추가
            replyList.append(replyItem);
            console.log("추가 직후 HTML:", replyList[0].outerHTML);
            console.log("추가된 답글 개수:", replyList.children(".reply_item").length);

            // 입력창 비우기
            replyWrite.find(".reply_content").val("");


        }).fail(function () {
            alert("답글 등록에 실패했습니다.");
        });

    });


});