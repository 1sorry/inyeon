<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <title>Title</title>
    <link rel="stylesheet" href="css/commonBody.css">
    <link rel="stylesheet" href="css/sportsclassSelect.css">

    <script>
        $(document).ready(function(){

            $(document).on("click", "#All", function(){
                window.history.go(-1);
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
        <div class="space_fix">
            <table>
                <tr>
                    <td class="club_title" colspan="3" align="center">${list[0].clssrm_nm}</td>
                </tr>
                <tr>
                    <td class="column1">종목명</td><td class="column2" colspan="2">${list[0].item_nm}</td>
                </tr>
                <tr>
                    <td class="column1">종목상세</td><td class="column2" colspan="2">${list[0].subitem_nm}</td>
                </tr>
                <tr>
                    <td class="column1">지역</td><td class="column2" colspan="2">${list[0].ctprvn_nm}</td>
                </tr>
                <tr>
                    <td class="column1">시군구</td><td class="column2" colspan="2">${list[0].signgu_nm}</td>
                </tr>
                <tr>
                    <td class="column1">장애유형</td><td class="column2" colspan="2">${list[0].trobl_ty_nm}</td>
                </tr>
                <tr>
                    <td class="column1">운영시간</td><td class="column2" colspan="2">${list[0].oper_time_cn}</td>
                </tr>
                <tr>
                    <td class="column1">모집기간</td><td class="column2" colspan="2">${list[0].oper_pd}</td>
                </tr>
                <tr>
                    <td class="column1">운영기간</td><td class="column2" colspan="2">${list[0].rcrit_pd}</td>
                </tr>
                <tr>
                    <td class="class_intro" colspan="3">교실 소개</td>
                </tr>
                <tr>
                    <td class="class_intro_text" colspan="3">${list[0].clssrm_intrcn_cn}</td>
                </tr>
            </table>
            <div class="back_button">
                <button type="button" id="All">목록으로 돌아가기</button><img class="back" src="img/backward_flip_icon.png">
            </div>
        </div>
    </div>
</main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>
