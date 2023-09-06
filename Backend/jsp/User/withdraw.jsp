<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="../conn.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles/CSS/user.css" />
    <script src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
    <title>장바구니 목록</title>
  </head>
  <body>
    <div id="wrapper">
      <header>
        <jsp:include page="../Main/header.jsp"/>
      </header>
      <nav>
        <jsp:include page="../Main/nav.jsp"/>
      </nav>
      <main>
        <div id="mypage_center">
          <div class="mypage_list">
            <ul>
              <li>
                <a href="./basket.jsp">내 장바구니</a>
              </li>
              <li><a href="./edit.jsp">회원정보수정</a></li>
              <li>
                <a href="./withdraw.jsp"><strong>회원탈퇴</strong></a>
              </li>
            </ul>
          </div>
          <div class="mypage_introduction">
            <h2>정말 탈퇴하시고자 한다면 비밀번호를 입력해주세요.</h2>
            <div>
              <form class="withdraw_form" action="withdrawpro.jsp" method="post">
                <label>아이디</label>
                <input type="text" name="mid" value=""/>
                <label>비밀번호</label>
                <input type="password" name="mpw" value=""/>
                <div class="withdraw_btns">
                  <button class="withdraw_btn" type="submit">탈퇴하기</button>
                </div>
              </form>

            </div>
          </div>
        </div>
      </main>
      <footer>
        <jsp:include page="../Main/footer.jsp"/>
      </footer>
    </div>
  </body>
  <script>
    includeHTML()
  </script>
</html>
