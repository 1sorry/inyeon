function paging(prev, startPage, endPage, next, keyW){
    console.log("start page : " + startPage);
    console.log("end page : " + endPage);
    console.log(prev);
    console.log(next);

    if (prev) {
        $("#paging").append('<span><a href="/voucherSearch?page=' + (parseInt(startPage) - 1) + '&keyword='+keyW +'"><img src="img/prev_icon.png" width="15px">이전</a></span>');
    }
    // 페이지 숫자 링크
    for (var num = startPage; num <= endPage; num++) {
        $("#paging").append('<span><a href="/voucherSearch?page=' + num + '&keyword='+keyW +'">' + num + '</a></span>');
    }
    // 다음 페이지 링크
    if (next && endPage > 0) {
        $("#paging").append('<span><a href="/voucherSearch?page=' + (parseInt(endPage) + 1) + '&keyword='+keyW +'">다음<img src="img/next_icon.png" width="15px"></a></span>');
    }
}


