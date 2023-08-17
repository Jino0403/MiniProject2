<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      rel="stylesheet"
      type="text/css"
      href="../../../Styles/CSS/manageLogin.css"
    />
    <title>관리자 로그인</title>
  </head>
  <body>
    <div id="login_wrapper">
      <div id="login">
        <div class="login_logo">
          <img src="../../../Styles/images/logo%201.png" />
        </div>
        <div class="form_wrapper">
          <h2>관리자 로그인</h2>
          <form class="login_form">
            <label>아이디</label>
            <input type="text" />
            <label>비밀번호</label>
            <input type="password" />
          </form>
          <div class="login_buttonWrapper">
            <button class="login_btn" type="submit">로그인</button>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
