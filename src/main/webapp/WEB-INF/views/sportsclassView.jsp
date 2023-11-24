<%@ page import="com.example.inyeon.main.dto.SportsclassDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.inyeon.paging.Paging" %>
<%@ page import="com.example.inyeon.paging.Criteria" %><%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-11-17
  Time: 오후 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 정적자원 resources/static/js/sportsclassfunctionjs.js와 연동 --%>
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
    <title>Title</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="css/sportsclassView.css">
    <script src="js/sportsclassfunctionjs.js"></script> <!-- Separate JavaScript file -->
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

            $(".classname").on("click", function() {
                var classname = $(this).text();
                console.log("class" + classname);
                window.location.href = "/sportsclassselect" + '?clssrm_nm=' + encodeURIComponent(classname);
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
        <table id="sportsclasslist">
            <tr class="class_title">
                <td class="class_title_1">종목명</td>
                <td class="class_title_2">상세종목</td>
                <td class="class_title_3">지역</td>
                <td class="class_title_3">시군구</td>
                <td class="class_title_name">교실명</td>
            </tr>
            <c:forEach var="lista" items="${list}">
               <tr>
                   <td class="column1">${lista.item_nm}</td>
                   <td class="column2">${lista.subitem_nm}</td>
                   <td class="column3">${lista.ctprvn_nm}</td>
                   <td class="column3">${lista.signgu_nm}</td>
                   <td class="classname">${lista.clssrm_nm}</td>
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
