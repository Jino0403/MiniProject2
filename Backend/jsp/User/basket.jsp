<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>



<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/Styles/CSS/style.css" />
  <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/Styles/CSS/user.css" />
  <script
          src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
  <script
          src="${pageContext.request.contextPath}/Styles/Javascript/pageBasket.js"></script>
  <script
          src="${pageContext.request.contextPath}/Styles/Javascript/basket.js"
          defer></script>
  <script
          src="${pageContext.request.contextPath}/Styles/Javascript/basket_price.js"
          defer></script>

  <title>장바구니 목록</title>
</head>
<body>
<div id="wrapper">
  <header>
    <jsp:include page="../Main/header.jsp" />
  </header>
  <nav>
    <jsp:include page="../Main/nav.jsp" />
  </nav>
  <main>
    <div id="mypage_center">
      <div class="mypage_list">
        <ul>
          <li><a href="./basket.jsp"><strong>내 장바구니</strong></a></li>
          <li><a href="./edit.jsp">회원정보수정</a></li>
          <li><a href="./withdraw.jsp">회원탈퇴</a></li>
        </ul>
      </div>
      <div class="mypage_introduction">
        <div class="basket_list">
          <div class="basket_title">내 장바구니</div>
          <p>장바구니에 담긴 상품 목록입니다.</p>
          <div class="basket_tables">
            <table class="basket_table">
              <thead>
              <tr>
                <th></th>
                <th class="basket_num">주문번호</th>
                <th class="basket_name">상품명</th>
                <th>가격</th>
                <th>수량</th>
                <th>총가격</th>
              </tr>
              </thead>
              <!-- HTML 코드 일부분 -->
              <tbody>
              <%
                HttpSession session1 = request.getSession();
                String userid = (String) session1.getAttribute("username");

                try {
                  String selectQuery = "SELECT * FROM cart where mid = ? ";
                  PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
                  preparedStatement.setString(1, "sound19");
                  ResultSet resultSet = preparedStatement.executeQuery();

                  while (resultSet.next()) {
                    int cartNumber = resultSet.getInt("cno");
                    int productNumber = resultSet.getInt("pno");
                    String productName = resultSet.getString("pname");
                    String memberId = resultSet.getString("mid");
                    int productPrice = resultSet.getInt("pprice");
                    int productQuantity = resultSet.getInt("cquantity");
                    String productPriceWon = String.format("%,d 원", productPrice);

                    int basketTotal = productPrice * productQuantity;
              %>
              <tr class="t_tr">
                <th><input type="checkbox" class="cartCheckBox"
                           value="<%=productNumber%>" /></th>
                <td><%=cartNumber%></td>
                <td class="basket_proName"><input type="text"
                                                  id="productname" name="productname" value="<%=productName%>"
                                                  required readonly /></td>
                <td class="basket_proPrice"><input type="text"
                                                   class="productpriceR"
                                                   id="productprice"
                                                   value="" required readonly /></td>
                <input type="hidden"
                       class="productprice"
                       name="productprice"
                       value="<%=productPrice%>"/>
                <td><input
                        type="number"
                        class="basket_quantity"
                        id="cquantity"
                        name="productQuantity"
                        value="<%=productQuantity%>"
                        min="1"
                        max="1000"
                      
                        data-product-quantity="<%=productNumber%>"

                  /></td>
                <td><input type="text" class="baksetTotal"
                           id="baskettotal" value="" readonly /></td>

              </tr>
              <%
                  }
                  resultSet.close();
                  preparedStatement.close();
                  conn.close();
                } catch (Exception e) {
                  e.printStackTrace();
                }
              %>
              </tbody>
            </table>
          </div>
          <div id="pagination-container"></div>
        </div>
        <div class="basket_result">
          <div class="result" id="totalPrice">총 주문금액 :</div>
        </div>
        <div class="basket_btns">
          <form method="post"
                action="${pageContext.request.contextPath}/Backend/jsp/Purchase/purchase-detail.jsp">
            <button class="basket_btn" type="submit">상품주문하기</button>
          </form>
          <form action="cartdelete.jsp" method="post">
            <input type="hidden" value="" id="productNum" name="productNum" />
            <button class="basket_btn" type="submit">상품삭제</button>
          </form>
          <form  action="basketupdate.jsp" method="post">
          	<input id="productNumber" name="productNumber" value="" />
            <input id="productQuantity-return" name="productQuantity" value="" />
            <button id="product-complete" class="basket_edit_btn">수량변경하기</button>
          </form>
       

        </div>
      </div>
    </div>
  </main>
  <footer>
    <jsp:include page="../Main/footer.jsp" />
  </footer>
</div>
</body>
<script>
  includeHTML()
  updateOverallTotal();
</script>
</html>