function formatDate(dateString) {
    let date = new Date(dateString);

    let formattedDate =
        date.getFullYear() + "-" +
        String(date.getMonth() + 1).padStart(2, "0") + "-" +
        String(date.getDate()).padStart(2, "0");

    return formattedDate;
}
// 날짜 js에서 반환 함수 jsp 에서 직접 사용은 불가능함