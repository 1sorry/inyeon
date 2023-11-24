<%@ page import="com.example.inyeon.main.dto.SportsclubDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HHS
  Date: 2023-11-22
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/mainBody.css">

    <title>메인페이지</title>
</head>
<body>
    <div id="wrap">
        <!--Header include start-->
        <jsp:include page="header.jsp" />
        <!--Header include end-->

        <main>
            <div class="main_container">
                <div class="search">
                    <select name="type">
                        <option value="sel_default">메뉴 선택</option>
                        <option value="sel_voucher">강좌이용권 시설정보</option>
                        <option value="sel_class">생활체육 교실</option>
                        <option value="sel_club">생활체육 동호회</option>
                    </select>
                    <input id="search_box" type="text" name="keyword" placeholder="검색어 입력">
                    <!--<button type="button" id="searchBtn"></button>-->
                    <img id="search_icon" src="./img/search_icon.png">
                </div>

                <script>
                    // 이벤트 핸들러 함수 정의
                    function handleSearch() {
                        let type = document.getElementsByName("type")[0].value;
                        let keyword = document.getElementsByName("keyword")[0].value;

                        if (type === "sel_voucher") {
                            location.href = "/voucherSearch?num=1" + "&type=" + type + "&keyword=" + keyword;
                        } else if (type === "sel_class") {
                            location.href = "/classSearch?num=1" + "&type=" + type + "&keyword=" + keyword;
                        } else if (type === "sel_club") {
                            location.href = "/clubSearch?num=1" + "&type=" + type + "&keyword=" + keyword;
                        } else {
                            alert("검색어를 입력해주세요");
                            console.error("type : ", type);
                        }
                    }

                    // 엔터 키 이벤트 처리
                    document.getElementById("search_box").addEventListener("keyup", function(event) {
                        // Enter 키의 keyCode는 13입니다.
                        if (event.keyCode === 13) {
                            handleSearch();
                        }
                    });

                    // 검색 아이콘 클릭 이벤트 처리
                    document.getElementById("search_icon").onclick = handleSearch;
                </script>


                <div class="botton_container">
                    <div id="sportvoucher_div">
                        <div id="voucher_title">
                            강좌이용권 시설정보
                        </div>
                        <div id="voucher_image" onclick="navigateToPage('/voucher')">
                        </div>
                    </div>
                    <div id="sportclass_div">
                        <div id="class_title">
                            생활체육 교실
                        </div>
                        <div id="class_image" onclick="navigateToPage('/sportsclass')">

                        </div>
                    </div>
                    <div id="sportclub_div">
                        <div id="club_title">
                            생활체육 동호회
                        </div>
                        <div id="club_image" onclick="navigateToPage('/sportsclub')">

                        </div>
                    </div>
                </div>
            </div>
        </main>
        <!-- footer include start -->
        <jsp:include page="footer.jsp" />
        <!-- footer include end -->
    </div>

    <script>
        function navigateToPage(pageUrl) {
            window.location.href = pageUrl;
        }
    </script>
</body>
</html>
