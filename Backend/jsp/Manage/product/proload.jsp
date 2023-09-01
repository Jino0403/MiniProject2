<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
  try {
    String selectQuery = "SELECT * FROM product";
    PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
    ResultSet resultSet = preparedStatement.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="../../../..../../../Styles/Javascript/jquery-3.7.0.js"
      type="text/javascript"></script>
    <script
      src="../../../..../../../Styles/Javascript/pagePro.js"
      type="text/javascript"
      defer="defer"></script>
    <script
            src="../../../..../../../Styles/Javascript/profun.js"
            type="text/javascript"
            defer="defer"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="../../../..../../../Styles/CSS/managePage.css" />
    <title>관리자 페이지</title>
  </head>
  <body>
    <div id="manage_wrapper">
      <main>
        <div id="manage_menu">
          <div class="manage_menu_section">
            <div class="manage_menu_title">
              <a href="../manageMain.jsp">Alcohol</a>
            </div>

            <h3>관리자 페이지</h3>
            <ul id="nav_bar2">
              <li class="menu_bar2">
                <a href="../user/userload.jsp">고객관리 ▸</a>
              </li>
              <li class="menu_bar2">
                <a href="../product/proload.jsp">상품관리 ▸</a>
              </li>
              <li class="menu_bar2">
                <a href="../order/orderload.jsp">주문관리 ▸</a>
              </li>
            </ul>
          </div>

          <div class="manage_logout">
            <a href="../../logout.jsp">로그아웃</a>
          </div>
        </div>

        <div id="manage_section">
          <div id="manage_detail">
            <div class="manage_btns">
              <a href="proadd.jsp"><button class="manage_btn">상품 추가</button></a>
              <form action="prodel.jsp" method="post">
                <button class="manage_btn" type="submit" name="manage_del_btn">상품 삭제</button>
                <input type="hidden" name="delselectedProduct" value="" id="delselectedProduct" />
              </form>
              <form action="proedit.jsp" method="post">
                <button class="manage_btn" type="submit" name="manage_update_btn">상품 수정</button></a>
                <input type="hidden" name="updateselectedProduct" value="" id="updateselectedProduct" />
              </form>
            </div>
            <table class="pro_table">
              <thead>
                <tr>
                  <th></th>
                  <th class="pro_num">번호</th>
                  <th>상품사진</th>
                  <th class="pro_name">상품명</th>
                  <th class="pro_th">카테고리</th>
                  <th class="pro_price">상품가격</th>
                  <th class="pro_count">재고량</th>
                  <th class="pro_th2">용량</th>
                  <th class="pro_th2">도수</th>
                  <th class="pro_th">국가</th>
                  <th class="pro_info">상품설명</th>
                  <th class="pro_name">관리자</th>
                </tr>
              </thead>
              <tbody>
              <%
                while (resultSet.next()) {
                  int productNumber = resultSet.getInt("pno");
                  String productName = resultSet.getString("pname");
                  String productCategory = resultSet.getString("pcategory");
                  int productPrice = resultSet.getInt("pprice");
                  int productQuantity = resultSet.getInt("pquantity");
                  int productMl = resultSet.getInt("pml");
                  double productAlcohol= resultSet.getDouble("palcohol");
                  String productCountry = resultSet.getString("pcountry");
                  String productText = resultSet.getString("ptext");
                  String productUrl = resultSet.getString("purl");
                  String productCharge = resultSet.getString("mid");
                  String productPriceWon = String.format("%,d 원", productPrice);
                
              %>
                <tr class="t_tr">
                  <td><input type="checkbox" name="productCheck" value="<%=productNumber%>" class="productCheckbox"/></td>
                  <td><%=productNumber%></td>
                  <td>
                    <img
                      class="pro_img"
                      src="${pageContext.request.contextPath}<%=productUrl%>" alt="picture"/>
                  </td>
                  <td><%=productName%></td>
                  <td><%=productCategory%></td>
                  <td><%=productPriceWon%></td>
                  <td><%=productQuantity%></td>
                  <td><%=productMl%> mL</td>
                  <td><%=productAlcohol%> %</td>
                  <td><%=productCountry%></td>
                  <td><%=productText%></td>
                  <td><%=productCharge%></td>
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
      </main>
    </div>
  </body>
</html>
