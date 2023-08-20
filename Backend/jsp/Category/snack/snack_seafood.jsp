<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 안주류 > 탕류</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles/CSS/category.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles/CSS/style.css" />
    <script src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
  </head>
  <body>
    <div id="wrapper">
      <header><jsp:include page="../../Main/header.jsp" /></header>
      <nav><jsp:include page="../../Main/nav.jsp" /></nav>
      <div class="snack-category-list">
        <a class="snack-category" href="/Frontend/HTML/Category/snack.jsp"
          >전체</a
        >
        <a
          class="snack-category"
          href="/Frontend/HTML/Category/snack/snack_soup.jsp"
          >탕류</a
        >
        <a
          class="snack-category"
          href="/Frontend/HTML/Category/snack/snack_meat.jsp"
          >고기류</a
        >
        <a
          class="snack-category"
          href="/Frontend/HTML/Category/snack/snack_seafood.jsp"
          >해산물류</a
        >
      </div>
      <main>
        <div id="item_lists">
          <div class="item_line">
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/broiledsalmon.png"
              />
              <span class="item_span">연어구이</span>
              <p class="item_p">3,300원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/musselstew.png"
              />
              <span class="item_span">홍합 스튜</span>
              <p class="item_p">10,700원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/gambas.png"
              />
              <span class="item_span">감바스</span>
              <p class="item_p">13,200원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/broiledmyungran.png"
              />
              <span class="item_span">명란구이</span>
              <p class="item_p">12,500원</p>
            </div>
          </div>
        </div>
        <hr />
      </main>
      <footer><jsp:include page="../../Main/footer.jsp" /></footer>
    </div>
  </body>
  <script>
    includeHTML()
  </script>
</html>
