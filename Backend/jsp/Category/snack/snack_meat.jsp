<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import="java.sql.*"%> <%@ include file="../../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 안주류 > 탕류</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/category.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/style.css"
    />
    <script src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
  </head>
  <body>
    <div id="wrapper">
      <header><jsp:include page="../../Main/header.jsp" /></header>
      <nav><jsp:include page="../../Main/nav.jsp" /></nav>
      <!-- 카테고리 리스트 -->
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
        <!-- 안주류 고기류 상품 첫번째줄 -->
        <div id="item_lists">
          <div class="item_line">
            <div class="items">
              <img
                class="items_img"
                src="../../../../Styles/images/snack_image/beefjeon.png"
              />
              <span class="item_span">육전</span>
              <p class="item_p">11,000원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/jokbal.png"
              />
              <span class="item_span">족발</span>
              <p class="item_p">16,000원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/buffalochickenwingbong.png"
              />
              <span class="item_span">버팔로 윙봉</span>
              <p class="item_p">16,200원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/baconvegetableroll.png"
              />
              <span class="item_span">베이컨 야채말이</span>
              <p class="item_p">11,900원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/footofchicken.png"
              />
              <span class="item_span">무뼈 닭발</span>
              <p class="item_p">6,800원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/slicedmeat.png"
              />
              <span class="item_span">편육</span>
              <p class="item_p">5,020원</p>
            </div>
            <div class="items">
              <img
                class="items_img"
                src="/Styles/images/snack_image/chapsteak.png"
              />
              <span class="item_span">찹 스테이크</span>
              <p class="item_p">16,200원</p>
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
