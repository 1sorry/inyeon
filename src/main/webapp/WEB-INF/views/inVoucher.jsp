<%--
  Created by IntelliJ IDEA.
  User: leekk
  Date: 2023-11-20
  Time: 오후 2:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.inyeon.paging.Paging" %>

<%
    Object obj = request.getAttribute("paging");
    Paging paging = (Paging) obj;
    int startPage = paging.getStartPage();
    int endPage = paging.getEndPage();
    boolean prev = paging.isPrev();
    boolean next = paging.isNext();

%>

<html>
<head>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/inVoucher.css">
    <script src="js/sportsvoucherfunctionjs.js"></script> <!-- Separate JavaScript file -->
    <script>
        $(document).ready(function () {

            var startPage = "<%=startPage%>";
            var endPage = "<%=endPage%>";
            var prev = "<%=prev%>";
            var next = "<%=next%>";
            console.log(startPage);
            console.log(endPage);
            console.log(prev);
            console.log(next);

            paging(prev, startPage, endPage, next);

            $("#ctprvn_nm").change(function (){

                var ctprvn_nm = $("#ctprvn_nm").val();
                var main_item_nm = $("#main_item_nm").val();
                var page = 1;
                ajaxselect(ctprvn_nm, main_item_nm, page);
            });

            $("#main_item_nm").change(function () {
                var ctprvn_nm = $("#ctprvn_nm").val();
                var main_item_nm = $("#main_item_nm").val();
                var page = 1;
                ajaxselect(ctprvn_nm, main_item_nm, page);
            });
            /*
            $(".fcltyname").on("mouseenter", function() {
                // 마우스를 가져다 대면 커서를 바꿈
                $(this).css("cursor", "pointer");
            });

            $(".fcltyname").on("mouseleave", function() {
                // 마우스를 벗어나면 기본 커서로 변경
                $(this).css("cursor", "default");
            });
            */
            $(".fcltyname").on("click", function() {
                var fcltyname = $(this).text();
                console.log("class" + fcltyname);
                window.location.href = "/voucherselect" + '?fclty_nm=' + encodeURIComponent(fcltyname);
            });
        });
        // 현재 페이지 번호 강조
        document.addEventListener("DOMContentLoaded", function() {
            // 현재 페이지 URL 가져오기
            var currentPage = window.location.href;

            // 모든 링크에 대해 반복
            var links = document.querySelectorAll("a");
            console.log("links ::", links);
            links.forEach(function(link) {
                console.log("currentPage ::: ", currentPage);
                // 링크의 href 속성과 현재 페이지 URL 비교
                if (link.href === currentPage) {
                    // 현재 페이지와 일치하면 클래스 추가
                    link.classList.add("current-page");
                }
            });
        });
    </script>
</head>

<body>
<!-- header include start -->
<jsp:include page="header.jsp"/>
<!-- header include end -->
<main>
    <div class="mainContainer">
        <div class="select_container">
            <div>
                <select id="ctprvn_nm" name="ctprvn_nm">
                    <option value="-" selected>지역</option>
                    <c:forEach var="citynamelist" items="${cityname}">
                        <option value="${citynamelist}">${citynamelist}</option>
                    </c:forEach>
                </select>
                <select id="main_item_nm" name="main_item_nm">
                    <option value="-" selected>종목</option>
                    <c:forEach var="itemnamelist" items="${itemname}">
                        <option value="${itemnamelist}">${itemnamelist}</option>
                    </c:forEach>
                </select>
            </div>
            <span>* 시설명을 클릭하시면 상세정보로 이동합니다.</span>
        </div>

        <table id="sportsclasslist">
            <tr class="voucher_title">
                <td class="voucher_title_1">지역</td>
                <td class="voucher_title_2">종목명</td>
                <td class="voucher_addr">주소</td>
                <td class="voucher_title_name">시설명</td>
            </tr>
            <c:forEach var="lista" items="${list}">
                <tr>
                    <td class="column1">${lista.ctprvn_nm}</td>
                    <td class="column2">${lista.main_item_nm}</td>
                    <td class="column3">${lista.fclty_addr}, ${lista.fclty_detail_addr}</td>
                    <td class="fcltyname">${lista.fclty_nm }</td>
                </tr>
            </c:forEach>
        </table>
        <div class="ul_container">
            <ul class="paging" id="paging">

            </ul>
        </div>
    </div>
</main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>