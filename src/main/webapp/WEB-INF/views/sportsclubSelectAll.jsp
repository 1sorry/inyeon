<%@ page import="com.example.inyeon.paging.Paging" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <title>SportsClub</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="css/sportsclubSelectAll.css">
    <script src="js/sportsclubfunctionjs.js"></script> <!-- Separate JavaScript file -->
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
                var item_nm = $("#item_nm").val();
                var page = 1;

                ajaxselect(ctprvn_nm, item_nm, page);
            });

            $("#item_nm").change(function () {

                var ctprvn_nm = $("#ctprvn_nm").val();
                var item_nm = $("#item_nm").val();
                var page = 1;
                ajaxselect(ctprvn_nm, item_nm, page);
            });

            $(".clubname").on("click", function() {
                var classname = $(this).text();
                console.log("class" + classname);
                classclick(classname);
            });
        });

        // 현재 페이지 번호 강조
        document.addEventListener("DOMContentLoaded", function() {
            // 현재 페이지 URL 가져오기
            var currentPage = window.location.href;

            // 모든 링크에 대해 반복
            var links = document.querySelectorAll("a");
            console.log("links ::: ", links);
            links.forEach(function(link) {
                // 링크의 href 속성과 현재 페이지 URL 비교
                console.log("currentPage : ", currentPage);
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
                <select id="ctprvn_nm" name="ctprvn_nm">
                    <option value="-" selected>지역</option>
                    <c:forEach var="citynamelist" items="${cityname}">
                        <option value="${citynamelist}">${citynamelist}</option>
                    </c:forEach>
                </select>
                <select id="item_nm" name="item_nm">
                    <option value="-" selected>종목</option>
                    <c:forEach var="itemnamelist" items="${itemname}">
                        <option value="${itemnamelist}">${itemnamelist}</option>
                    </c:forEach>
                </select>
            </div>
            <table id="sportsclublist">
                <tr class="club_title">
                    <td class="club_title_1">종목명</td>
                    <td class="club_title_2">상세종목</td>
                    <td class="club_title_2">지역</td>
                    <td class="club_title_2">시군구</td>
                    <td class="club_title_name">동호회명</td>
                </tr>
                <c:forEach var="club" items="${sportsclub}">
                    <tr>
                        <td class="column1">${club.item_nm}</td>
                        <td class="column2">${club.subitem_nm}</td>
                        <td class="column2">${club.ctprvn_nm}</td>
                        <td class="column2">${club.signgu_nm}</td>
                        <td class="clubname">${club.club_nm}</td>
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
