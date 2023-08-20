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
        <a class="snack-category" href="../snack.jsp"
          >전체</a
        >
        <a
          class="snack-category"
          href="snack_soup.jsp"
          >탕류</a
        >
        <a
          class="snack-category"
          href="snack_meat.jsp"
          >고기류</a
        >
        <a
          class="snack-category"
          href="snack_seafood.jsp"
          >해산물류</a
        >
      </div>
      <main>
        <div id="item_lists">
          <div class="item_line">
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/fishcakesoup.png"
              />
              <span class="item_span">어묵탕</span>
              <p class="item_p">9,700원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/gopchangjeongol.png"
              />
              <span class="item_span">곱창전골</span>
              <p class="item_p">12,000원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/kimchijjigae.png"
              />
              <span class="item_span">김치찌개</span>
              <p class="item_p">4,000원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/clamsoup.png"
              />
              <span class="item_span">조개탕</span>
              <p class="item_p">8,000원</p>
            </div>
          </div>
        </div>
      </main>
      <footer><jsp:include page="../../Main/footer.jsp" /></footer>
    </div>
  </body>
  <script>
    includeHTML()
  </script>
</html>
