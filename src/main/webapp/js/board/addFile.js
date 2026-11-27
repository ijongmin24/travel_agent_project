    let selectedFiles = [];

    $("#b_file").change(function () {

    let files = Array.from(this.files);

    selectedFiles = selectedFiles.concat(files);

    let dataTransfer = new DataTransfer();

    selectedFiles.forEach(file => {
    dataTransfer.items.add(file);
});

    $("#uploadFiles")[0].files = dataTransfer.files;

    $("#preview").empty();

    selectedFiles.forEach((file, index) => {
    $("#preview").append(`
                <div>
                    ${file.name}
                    <button type="button" class="deleteFile" data-index="${index}">
                        삭제
                    </button>
                </div>
            `);
});

    this.value = "";
});

    $(document).on("click", ".deleteFile", function () {

    let index = $(this).data("index");

    selectedFiles.splice(index, 1);

    let dataTransfer = new DataTransfer();

    selectedFiles.forEach(file => {
    dataTransfer.items.add(file);
});

    $("#uploadFiles")[0].files = dataTransfer.files;

    $("#preview").empty();

    selectedFiles.forEach((file, index) => {
    $("#preview").append(`
                <div>
                    ${file.name}
                    <button type="button" class="deleteFile" data-index="${index}">
                        삭제
                    </button>
                </div>
            `);
});
});
