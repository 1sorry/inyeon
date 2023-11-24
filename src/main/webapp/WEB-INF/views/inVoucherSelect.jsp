<%@ page import="com.example.inyeon.main.dto.SportsclubDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d7d471db687c23809bd48aaf7da534a"></script>
<head>
    <title>SportsClub</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="css/inVoucherSelect.css">
    <script>
        $(document).on("click", "#All", function(){
            window.history.go(-1);
        });
    </script>
</head>
<body>
<!-- header include start -->
<jsp:include page="header.jsp"/>
<!-- header include end -->
<main>
    <div class="mainContainer">
        <div class="space_fix"></div>
        <c:if test="${not empty listS}">
            <c:set var="firstItem" value="${listS[0]}" />
            <c:forEach var="item" items="${listS}">
                <form class="clubSelect" name="clubSelect">
                    <table>
                        <tr class="voucher_title">
                            <td class="voucher_title_1" colspan="2">${item.fclty_nm}</td>
                        </tr>
                        <tr>
                            <td class="column1">지역</td>
                            <td class="column2">${item.ctprvn_nm}</td>
                        </tr>
                        <tr>
                            <td class="column1">전화번호</td>
                            <td class="column2">${item.rprsntv_tel_no }</td>
                        </tr>
                        <tr>
                            <td class="column1">주소</td>
                            <td class="column2">${item.fclty_addr}, ${item.fclty_detail_addr}</td>
                        </tr>
                        <tr>
                            <td class="column1">종목명</td>
                            <td class="column2">${item.main_item_nm}</td>
                        </tr>
                        <tr>
                            <td class="voucher_title_2" colspan="2">지도</td>
                        </tr>
                        <tr>
                            <td class="td_map" colspan="2">
                                <div class="map_container">
                                    <div id="map">
                                        <script>
                                            <c:if test="${not empty listS}">
                                            var mapOption = {
                                                center: new kakao.maps.LatLng(${firstItem.fclty_crdnt_la}, ${firstItem.fclty_crdnt_lo}),
                                                level: 3
                                            };
                                            var markerPosition = new kakao.maps.LatLng(${firstItem.fclty_crdnt_la}, ${firstItem.fclty_crdnt_lo});
                                            var marker = new kakao.maps.Marker({
                                                position: markerPosition
                                            });
                                            </c:if>

                                            var mapContainer = document.getElementById('map');
                                            var mapOption = {
                                                center: new kakao.maps.LatLng(${firstItem.fclty_crdnt_la}, ${firstItem.fclty_crdnt_lo}),
                                                level: 3
                                            };

                                            var map = new kakao.maps.Map(mapContainer, mapOption);
                                            var mapTypeControl = new kakao.maps.MapTypeControl();
                                            var markerPosition = new kakao.maps.LatLng(${firstItem.fclty_crdnt_la}, ${firstItem.fclty_crdnt_lo});
                                            var marker = new kakao.maps.Marker({
                                                position: markerPosition
                                            });

                                            marker.setMap(map);
                                            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

                                            function getInfo() {
                                                var center = map.getCenter();
                                                var level = map.getLevel();
                                                var mapTypeId = map.getMapTypeId();
                                                var bounds = map.getBounds();
                                                var swLatLng = bounds.getSouthWest();
                                                var neLatLng = bounds.getNorthEast();
                                                var boundsStr = bounds.toString();
                                            }

                                            $("#All").on("click", function() {
                                                // voucher 페이지로 이동
                                                window.location.href = "/voucher";
                                            });
                                        </script>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <div class="back_button">
                        <button type="button" id="All">목록으로 돌아가기</button><img class= "back" src="img/backward_flip_icon.png">
                    </div>
                </form>
            </c:forEach>
        </c:if>

    </main>
<!-- footer include start-->
<jsp:include page="footer.jsp" />
<!-- footer include end-->
</body>
</html>
