<%@ page import="com.example.inyeon.main.dto.SportsclubDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.inyeon.paging.Paging" %><%--
  Created by IntelliJ IDEA.
  User: HHS
  Date: 2023-11-22
  Time: 오후 4:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Object obj2 = request.getAttribute("keyW");
    String keyW = (String)obj2;
    Object obj = request.getAttribute("paging");
    Paging paging = (Paging) obj;
    int startPage = paging.getStartPage();
    int endPage = paging.getEndPage();
    boolean prev = paging.isPrev();
    boolean next = paging.isNext();
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/clubSearch.css">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script src="js/clubsearchjs.js"></script> <!-- Separate JavaScript file -->
    <title>메인페이지</title>
</head>
<script>
    $(document).ready(function(){

        var keyW = "<%=keyW%>";
        var startPage = "<%=startPage%>";
        var endPage = "<%=endPage%>";
        var prev = <%=prev%>;
        var next = <%=next%>;
        console.log(next);

        $(".clubname").on("click", function() {
            var clubName = $(this).text();
            window.location.href = "/sportsclubSelect" + '?club_nm=' + encodeURIComponent(clubName);
        });

        paging(prev, startPage, endPage, next, keyW);

    });

    // 현재 페이지 번호 강조
    document.addEventListener("DOMContentLoaded", function() {
        // 현재 페이지 URL 가져오기
        var currentPage = window.location.href;

        // 모든 링크에 대해 반복
        var links = document.querySelectorAll("a");
        links.forEach(function(link) {
            // 링크의 href 속성과 현재 페이지 URL 비교
            if (link.href === currentPage) {
                // 현재 페이지와 일치하면 클래스 추가
                link.classList.add("current-page");
            }
        });
    });
</script>
<body>
<div id="wrap">
    <!--Header include start-->
    <jsp:include page="header.jsp" />
    <!--Header include end-->

    <main>
        <div class="main_container">
            <div class="space_fix"></div>
            <table>
                <tr class="club_title">
                    <td class="club_title_1">종목명</td>
                    <td class="club_title_1">종목상세</td>
                    <td class="club_title_1">지역</td>
                    <td class="club_title_1">시군구</td>
                    <td class="club_title_2">동호회명</td>
                </tr>
                <c:forEach var="lista" items="${list}">
                    <tr>
                        <td class="column1">${lista.item_nm}</td>
                        <td class="column2">${lista.subitem_nm}</td>
                        <td class="column2">${lista.ctprvn_nm}</td>
                        <td class="column2">${lista.signgu_nm}</td>
                        <td class="clubname">${lista.club_nm}</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="ul_container">
                <ul class="paging" id="paging">

                </ul>
            </div>
        </div>
    </main>
    <!-- footer include start -->
    <jsp:include page="footer.jsp" />
    <!-- footer include end -->
</div>
</body>
</html>
