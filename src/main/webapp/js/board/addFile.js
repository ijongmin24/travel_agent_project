
let selectedFiles = [];

$(function () {

    const fileInput = document.getElementById("b_file");
    const uploadFiles = document.getElementById("uploadFiles");
    const preview = document.getElementById("preview");

    // 파일 선택
    fileInput.addEventListener("change", function () {

        // 새로 선택한 파일을 기존 목록에 추가
        let newFiles = Array.from(this.files);
        selectedFiles.push(...newFiles);

        // 실제 전송 파일과 미리보기 갱신
        updateFiles();

        // 같은 파일도 다시 선택할 수 있도록 초기화
        this.value = "";
    });

    // 파일 목록 갱신
    function updateFiles() {

        let dataTransfer = new DataTransfer();

        selectedFiles.forEach(file => {
            dataTransfer.items.add(file);
        });

        // 서버로 전송할 파일 목록 설정
        uploadFiles.files = dataTransfer.files;

        // 미리보기 초기화
        preview.innerHTML = "";

        selectedFiles.forEach((file, index) => {

            let div = document.createElement("div");
            div.textContent = file.name + " ";

            let button = document.createElement("button");
            button.type = "button";
            button.textContent = "x";

            // 개별 파일 삭제
            button.addEventListener("click", function () {
                selectedFiles.splice(index, 1);
                updateFiles();
            });

            div.appendChild(button);
            preview.appendChild(div);
        });
    }

});
