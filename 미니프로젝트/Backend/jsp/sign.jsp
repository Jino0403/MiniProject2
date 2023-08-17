<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../css/sign.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&display=swap" rel="stylesheet">
    <title>Login Form</title>
</head>
<body>
    <aside class="login-container">
        <div class="login-picture">
            <img src="images/login.jpg" alt="Login Picture">
        </div>
        <div class="form-text">
            <div class="logo">
                <img src="images/mainLogo.png" alt="Logo Picture" class="form-logo">
                <h2>ALCOHOL</h2>
            </div>
            <form action="signpro.jsp" method="post">
                <input type="text" name="l-username" id="l-userrname" placeholder="아이디를 입력하세요.." required>
                <input type="password" name="l-userpassword" id="l-userpassword" placeholder="비밀번호를 입력하세요.." required>
                <button type="submit">로그인</button>
            </form>
            <div class="reg"><a href="signup.jsp">회원가입</a></div>
        </div>
    </aside>
</body>
</html>
