function exitCheck() {
    var checking = confirm("삭제하시겠습니까?");
    if (checking == false) {
        alert("취소되었습니다.");
    } else {
        var p_num = document.getElementById("p_num").value;
        alert("삭제되었습니다.");
        location.href="adminIndex.jsp?pages=productDelete&product_number="+p_num+"";
    }
}
