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
                <a href="./basket.jsp"><strong>내 장바구니</strong></a>
              </li>
              <li><a href="./edit.jsp"><strong>회원정보수정</strong></a></li>
              <li><a href="./withdraw.jsp">회원탈퇴</a></li>
            </ul>
          </div>
          <div class="mypage_introduction">
            <div class="mypage_form">
              <div class="mypage_form_title">
                <span>내 정보 수정</span>
                <p>아이디와 이름을 제외한 수정하실 사항을 입력해주세요.</p>
              </div>
              <form class="mypage_edit" method="post">
                <label name="username">아이디</label>
                <input
                  type="text"
                  id="username"
                  name="username"
                  placeholder="아이디 입력 (6-20)"
                  required
                  readonly
                />
                <label name="password">비밀번호</label>
                <input
                  type="password"
                  id="password"
                  name="password"
                  placeholder="비밀번호 입력 (문자,숫자,특수문자 포함 6-20자리)"
                  required
                />
                <label name="confirm-password">비밀번호 확인</label>
                <input
                  type="password"
                  id="confirm-password"
                  name="confirm-password"
                  placeholder="비밀번호 재입력"
                  required
                />
                <label name="name">이름</label>
                <input
                  type="text"
                  id="name"
                  name="name"
                  placeholder="이름을 입력해주세요"
                  required
                  readonly
                />
                <label name="address">주소</label>
                <input
                  type="text"
                  id="address"
                  name="address"
                  placeholder="상세 주소"
                  required
                />
                <label name="phone">전화번호</label>
                <input
                  type="tel"
                  id="phone"
                  name="phone"
                  placeholder="휴대폰 번호 입력 (010-1111-1111)"
                  required
                />
                <label name="birthday">생년월일</label>
                <input
                  type="date"
                  id="birthday"
                  name="birthday"
                  min="1930-01-01"
                  required
                />
              </form>
            </div>
            <div class="edit_btns">
              <button type="submit" class="edit_btn">수정하기</button>
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
