<%@ page import="com.opentime.smartparking_system.service.UserService" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        body > .my-page {
            flex: 1; /* 나머지 공간을 채움 */
        }

        body {
            background: #f9f9f9;
            font-family: sans-serif;
        }

        .my-page {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 50px;
            box-sizing: border-box;
            font-size: 18px;

        }

        .profile-card {
            position: absolute;
            right: 30px;
            top: 25%;
            transform: translateY(-50%);
            width: 250px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
            height: 400px;

        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .profileImg {
            width: 50px;
            height: 50px;
            object-fit: cover;
            border-radius: 50%;
            margin-right: 12px;
        }

        .profile-name {
            font-weight: bold;
        }

        .logout-btn {
            font-size: 0.8em;
            color: #666;
            text-decoration: underline;
            cursor: pointer;
            margin-top: 5px;
        }

        .points-box span {
            display: block;
        }

        .sub-menu div {
            text-align: center;
        }

        .menu-list {
            border-top: 1px solid #eee;
        }

        .menu-list > div > a {
            text-decoration: none;
            color: #373737;
        }

        .menu-list > div {
            padding: 10px 0;
            border-bottom: 1px solid #eee;
            font-size: 0.9em;
            color: #333;
            cursor: pointer;
        }

        .menu-list div:hover {
            background: #f0f0f0;
        }
    </style>
</head>
<body>

<div class="my-page">
    <div class="profile-card" data-aos="fade-down">
        <div class="profile-header">
            <img src="${pageContext.request.contextPath}/jsp/user/img/icon01.png" alt="profile" class="profileImg">
            <div class="profile-info">
                <%
                    UserDTO userDTO = (UserDTO) session.getAttribute("user");
                    String name = (userDTO != null && userDTO.getName() != null) ? userDTO.getName() : "회원";
                %>
                <div class="profile-name"><%= name %>
                </div>
                <div class="logout-btn">로그아웃</div>
            </div>
        </div>
        <div class="menu-list">
            <div><a href="/user/myPageHome">주차현황</a></div>
            <div><a href="/user/myPageCarForm">차량등록</a></div>
            <div><a href="/user/myPageCarList">등록차량목록</a></div>
            <div><a href="/user/myPageInOut">최근입출차내역</a></div>
            <div><a href="/user/myPageModify">회원정보수정</a></div>
            <div><a href="/user/MembershipJoin">멤버쉽관리</a></div>
        </div>
    </div>
</div>

</body>
</html>
