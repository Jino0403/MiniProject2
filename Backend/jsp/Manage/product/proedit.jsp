<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="../../../../Styles/Javascript/jquery-3.7.0.js"
      type="text/javascript"></script>
    <script
      src="../../../../Styles/Javascript/manage.js"
      type="text/javascript"
      defer="defer"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="../../../../Styles/CSS/managePage.css" />
    <title>관리자 페이지</title>
  </head>
  <body>
    <div id="manage_wrapper">
      <main>
        <div class="manage_menu">
          <div>
            <a href="../manageMain.jsp"
              ><img src="../../../../Styles/images/logo 1.png"
            /></a>

            <h3>관리자페이지</h3>
            <ul id="nav_bar2">
              <li class="menu_bar2">
                <a href="../user/userload.jsp">고객 관리</a>
              </li>
              <li class="menu_bar2">
                <a href="proload.jsp">상품 관리</a>
              </li>
              <li class="menu_bar2">
                <a href="../order/orderload.jsp">주문 관리</a>
              </li>
              <li class="menu_bar2">
                <a href="../inquery/receipt.jsp">1:1 문의</a>
              </li>
            </ul>
          </div>

          <div class="manage_logout">
            <a href="">로그아웃</a>
          </div>
        </div>

        <div id="manage_section">
          <div class="manage_pro">
            <div class="manage_protitle">상품 정보 수정</div>
            <form class="proadd_form">
              <label>상품명</label>
              <input type="text" />
              <label>카테고리</label>
              <select name="category" class="select_category">
                <option value="whiskey">위스키</option>
                <option value="wine">와인</option>
                <option value="sake">사케</option>
                <option value="vodka">보드카</option>
                <option value="soju">소주</option>
                <option value="beer">맥주</option>
                <option value="makgeolli">막걸리</option>
                <option value="snack">안주류</option>
              </select>
              <label>상품가격</label>
              <input type="text" placeholder="10000" />
              <label>재고량</label>
              <input type="text" />
              <label>용량</label>
              <input type="text" />
              <label>도수</label>
              <input type="text" />
              <label>국가</label>
              <input type="text" />
              <label>상품설명</label>
              <input type="text" maxlength="200" />
            </form>
            <div class="proinfo_btns">
              <button class="pro_btn">수정하기</button>
              <a href="proload.jsp"
                ><button class="pro_btn">뒤로가기</button></a
              >
            </div>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
