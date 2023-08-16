<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="../../Styles/Javascript/jquery-3.7.0.js"
      type="text/javascript"></script>
    <script
      src="../../Styles/Javascript/manage.js"
      type="text/javascript"
      defer="defer"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="../../Styles/CSS/managePage.css" />
    <title>관리자 페이지</title>
  </head>
  <body>
    <div id="manage_wrapper">
      <main>
        <div class="manage_menu">
          <div>
            <a href="manageMain.jsp"
              ><img src="../../Styles/images/logo 1.png"
            /></a>

            <h3>관리자페이지</h3>
            <ul id="nav_bar2">
              <li class="menu_bar2">
                <a href="Manage/user/userload.jsp">고객 관리</a>
              </li>
              <li class="menu_bar2">
                <a href="Manage/product/proload.jsp">상품 관리</a>
              </li>
              <li class="menu_bar2">
                <a href="Manage/order/orderload.jsp">주문 관리</a>
              </li>
                <li class="menu_bar2">
                  <a href="Manage/inquery/receipt.jsp">1:1 문의</a>
                </li>
            </ul>
          </div>

          <div class="manage_logout">
            <a href="">로그아웃</a>
          </div>
        </div>

        <div id="manage_section">dd</div>
      </main>
    </div>
  </body>
</html>