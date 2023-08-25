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
    <script
    	src="../../../..../../../Styles/Javascript/orderdel.js"
    	type="text/javascript"
    	defer="defer"
    ></script>
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
            <div class="order_btns">
              <a href="completeOrder.jsp"
                ><button class="manage_btn">완료된 주문</button></a
              >
            <form action="completeOrder.jsp" method="post">
              <button class="manage_btn">주문 확인</button>
              <input type="hidden" name="completedOrder" value="" id="completedOrder" />
            </form>
            <form action="orderdel.jsp" method="post">
              <button class="manage_btn delete_btn">주문 삭제</button>
              <input type="hidden" name="deleteOrder" value="" id="deleteorder" />
            </form>
            </div>

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
                
                <!-- <tr class="t_tr">
                  <td><input type="checkbox" /></td>
                  <td>1</td>
                  <td>soundasads</td>
                  <td>칸티나 자키니니 달 트랄체토 체라수올로 외 3건</td>
                  <td>10,800,800원</td>
                  <td>1000개</td>
                  <td>독고진호</td>
                  <td>서울특별시 강북구 개포동 삼동전보아파트 102동 333호</td>
                  <td>010-0000-0000</td>
                  <td>강남사랑상품권</td>
                  <td>10,300,000원</td>
                  <td>배송메모의 제한은 20자로 하겠습니다</td>
                </tr> -->
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
          </div>
          <div id="pagination-container"></div>
        </div>
      </main>
    </div>
  </body>
  <script>
  
 
  </script>
</html>
