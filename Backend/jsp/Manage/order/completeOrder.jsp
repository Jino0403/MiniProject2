<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
	try {
		String selectQuery = "SELECT * FROM order";
		PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
		Resultset resultSet = preparedStatement.executeQuery();
		
%>
<%
	try {
		String selectQuery = "SELECT * FROM member";
		PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
		Resultset resultSet = preparedStatement.executeQuery();
		
%>
<%
	try {
		String selectQuery = "SELECT * FROM product";
		PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
		Resultset resultSet = preparedStatement.executeQuery();
		
%>
<%
	try {
		String selectQuery = "SELECT * FROM cart";
		PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
		Resultset resultSet = preparedStatement.executeQuery();
		
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
      src="../../../..../../../Styles/Javascript/pageOrder.js"
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
                <a href="orderload.jsp">주문관리 ▸</a>
              </li>
            </ul>
          </div>

          <div class="manage_logout">
            <a href="../../logout.jsp">로그아웃</a>
          </div>
        </div>

        <div id="manage_section">
          <div id="manage_detail">
            <div class="order_combtns">
              <a href="orderload.jsp"
                ><button class="manage_btn">미완료 주문</button></a
              >
              <button class="manage_btn">주문 삭제</button>
            </div>
		<form action="completeOrder.jsp" method="post">
            <table class="order_table" border="1">
              <thead>
                <tr>
                  <th></th>
                  <th class="order_num">번호</th>
                  <th class="order_th">아이디</th>
                  <th class="order_proname">상품명</th>
                  <th class="order_price">가격</th>
                  <th class="order_th">수량</th>
                  <th class="order_th">이름</th>
                  <th class="order_address">주소</th>
                  <th class="order_phone">전화번호</th>
                  <th class="order_th">결제유형</th>
                  <th class="order_price">총가격</th>
                  <th class="order_memo">배송메모</th>
                </tr>
              </thead>
              <tbody>
              <% 
              	while (resultSet.next()) {
              		int orderNumber = resultSet.getInt("ono");
              		int orderProductNumber = resultSet.getInt("pno");
              		String memberId = resultSet.getString("mid");
              		int cartNumber = resultSet.getInt("cno");
              		String productName = resultSet.getString("pname");
              		int productPrice = resultSet.getInt("pprice");
              		int cartQuantity = resultSet.getInt("cquanity");
              		String memberName = resultSet.getString("mname");
              		String memberAddress = resultSet.getString("madress");
              		String memberPhone = resultSet.getString("mphone");
              		String orderText = resultSet.getString("otext");
              		int orderPay = resultSet.getInt("opay");
              		int cartTotalPrice = resultSet.getInt("ctotalprice");
              		Timestamp orderTime = resultSet.getTimestamp("otime");
                    
              %>
              	<tr class="t_tr">
                  <%-- <td><input type="checkbox" name="orderCheck" value="<%=orderNumber%>" class="orderCheckbox"/></td> --%>
                  <td><%=orderNumber%></td>
                  <td><%=memberId%></td>
                  <td><%=productName%></td>
                  <td><%=productPrice%></td>
                  <td><%=cartQuantity%></td>
                  <td><%=memberName%></td>
                  <td><%=memberAddress %></td>
                  <td><%=memberPhone%></td>
                  <td><%=orderPay %></td>
                  <td><%=cartTotalPrice%></td>
                  <td><%=orderText %></td>
                </tr>

                <%
				}	
                resultSet.close();
                preparedStatement.close();
                conn.close();
                } catch (Excetption e) {
                	e.printStackTrace();
                }
                %>
               
              </tbody>
            </table>
            </form>
          </div>
          <div id="pagination-container"></div>
        </div>
      </main>
    </div>
  </body>
</html>
