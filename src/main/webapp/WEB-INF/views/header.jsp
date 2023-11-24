<%--
  Created by IntelliJ IDEA.
  User: HHS
  Date: 2023-11-22
  Time: 오후 4:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header>
    <link rel="stylesheet" href="css/header.css">
    <form>
        <div class="nav_title">
            <div class="title_text" onclick="moveToPage('/main')">장애체육인 생활체육 정보</div>
        </div>
    </form>
    <nav>
        <div class="nav_items">
            <ul>
                <li><a href="/voucher">강좌이용권 시설정보</a></li>
                <li class="sep_li">|</li>
                <li class="nav_before"><a href="/sportsclass">생활체육 교실</a></li>
                <li class="sep_li">|</li>
                <li class="nav_before"><a href="/sportsclub">생활체육 동호회</a></li>
            </ul>
        </div>
    </nav>
    <script>
        function moveToPage(pageUrl) {
            window.location.href = pageUrl;
        }
    </script>
</header>