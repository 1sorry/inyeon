<%@ page import="com.example.inyeon.main.dto.SportsclubDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Object obj = request.getAttribute("list");
    if (obj == null) return;

    List<SportsclubDTO> list = (List<SportsclubDTO>) obj;
    int nCnt = list.size();

    SportsclubDTO dto = null;
    if (nCnt == 1){
        dto = list.get(0);
    }
%>
<html>
<head>
    <title>SportsClub</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="css/sportsclubSelect.css">

</head>
<!--
<script>
    $(document).ready(function(){

        $(document).on("click", "#All", function(){
            $(".clubSelect").attr({"method":"GET", "action":"sportsclub"}).submit();
        });
    });
</script>
-->
<script>
    $(document).on("click", "#All", function(){
        window.history.go(-1);
    });
</script>
<body>

<!-- header include start -->
<jsp:include page="header.jsp"/>
<!-- header include end -->
<main>
    <div class="mainContainer">
        <div class="space_fix"></div>
        <form class="clubSelect" name="clubSelect">
            <table>
                <tr>
                    <td class="club_title" colspan="3" align="center"><%= dto.getClub_nm() %></td>
                </tr>
                <tr>
                    <td class="column1">종목명</td><td class="column2" colspan="2"><%= dto.getItem_nm()%></td>
                </tr>
                <tr>
                    <td class="column1">종목상세</td><td class="column2" colspan="2"><%= dto.getSubitem_nm()%></td>
                </tr>
                <tr>
                    <td class="column1">지역</td><td class="column2" colspan="2"><%= dto.getCtprvn_nm()%></td>
                </tr>
                <tr>
                    <td class="column1">시군구</td><td class="column2" colspan="2"><%= dto.getSigngu_nm()%></td>
                </tr>
                <tr>
                    <td class="column1">장애유형</td><td class="column2" colspan="2"><%= dto.getTrobl_ty_nm()%></td>
                </tr>
                <tr>
                    <td class="column1">운영시간</td><td class="column2" colspan="2"><%= dto.getOper_time_cn()%></td>
                </tr>
                <tr>
                    <td class="club_intro" colspan="3">동호회 소개</td>
                </tr>
                <tr>
                    <td  class="club_intro_text" colspan="3"><%= dto.getClub_intrcn_cn()%></td>
                </tr>
            </table>
            <div class="back_button" onclick="navigateToPage('/sportsclub')">
                <button type="button" id="All">목록으로 돌아가기</button><img class= "back" src="img/backward_flip_icon.png">
            </div>
        </form>
    </div>
</main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>