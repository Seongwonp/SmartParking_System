
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <style>
        /*프로필카드와 남은공간 배치*/
        html, body {
            height: 100%;
            margin: 0 auto;
            display: flex;
            /*flex-direction: column;*/
        }
        body {
            background: #f9f9f9;
            font-family: sans-serif;
        }

        body > .my-page {
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #f9f9f9;
            margin-top:30px;
        }

        body> .my-page .main-content {
            display: flex;
        }

        /*회원정보수정 */
        .modifyInfo {
            width: 450px;
            height: 100%;
            padding: 30px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            background-color: #fafafa;
            margin-bottom: 20px;
        }
        .icon {
            font-size: 12px;
            width: 60px;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        input {
            font-size: 12px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 5px;
        }

        .input-group {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 5px;
            background-color: white;
        }

        .input-group .icon {
            font-size: 18px;
            color: #888;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 30px;
            height: 25px;
        }

        input {
            flex: 1;
            height: 100%;
            border: none;
            padding: 0 10px;
            font-size: 14px;
        }

        .modifyInfo>h2 {
            text-align: center;
            padding: 15px;
            color: #333;
        }
        .input-group {
            display: flex;
            align-items: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 5px;
            background-color: white;
        }
        .button-group {
            margin-top: 24px;
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        input[type="submit"], input[type="button"] {
            width: 250px;
            padding: 12px;
            background-color: #4a97d8;
            color: #ffffff;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #3a7fc1;
        }
    </style>
</head>
<body>
<%@include file="/jsp/include/header.jsp" %>
<div class="my-page">
    <div class="main-content">
        <!-- 우측 프로필 카드 -->
        <div>
            <%@include file="/jsp/user/myPage_profile.jsp" %>
        </div>
        <!-- 회원정보수정 카드 -->
        <div class="modifyInfo">
            <h2 class="mb-3">회원정보수정</h2>
            <form name="frmModifyMember" action="${pageContext.request.contextPath}/user/myPageModify"  method="post">
                <input type="hidden" name="userId" value="${userinfo.getUserId()}" />
                <div class="input-group">
                    <i class="fa-solid fa-envelope icon"></i>  <!-- 이메일 아이콘 -->
                    <input type="email" id="userName" name="userName" class="form-control" value="${userinfo.getUserName()}">
                </div>
                <div class="input-group">
                    <i class="fa-solid fa-lock icon"></i>      <!-- 자물쇠 아이콘 -->
                    <input type="password" id="password" name="password" class="form-control" value="${userinfo.getPassword()}">
                </div>
                <div class="input-group">
                    <i class="fa-solid fa-lock icon"></i>      <!-- 자물쇠 아이콘 -->
                    <input type="password" id="passwdRe" name="passwdRe" class="form-control">
                </div>
                <div class="input-group">
                    <i class="fa-solid fa-user icon"></i>      <!-- 사용자 아이콘 -->
                    <input type="text" id="name" name="name" class="form-control" value="${userinfo.getName()}">
                </div>
                <div class="input-group">
                    <i class="fa-solid fa-mobile-screen icon"></i>  <!-- 휴대폰 아이콘 -->
                    <input type="tel" id="phone" name="phone" class="form-control" value="${userinfo.getPhone()}">
                </div>
                <div class="button-group">
                    <input type="submit" value="수정">
                    <input type="button" value="취소" onclick="history.back()">
                </div>
            </form>
        </div>
    </div>
</div>
<%@include file="/jsp/include/footer.jsp" %>
<script>
    document.addEventListener('DOMContentLoaded', function (){
        const frm = document.querySelector('form[name=frmModifyMember]')
        const submit = document.querySelector('input[type=submit]')

        submit.addEventListener('submit', function(e) {
            if(frm.passwd.value !== frm.passwdRe.value){
                e.preventDefault()
                alert("비밀번호와 비밀번호 확인이 다릅니다.")
            }
        });
    })
</script>
</body>
</html>
