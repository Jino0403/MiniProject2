<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="../../../..../../../Styles/Javascript/jquery-3.7.0.js"
	type="text/javascript"></script>
<script src="../../../..../../../Styles/Javascript/pageOrder.js"
	type="text/javascript" defer="defer"></script>
<link rel="stylesheet" type="text/css"
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
						<li class="menu_bar2"><a href="../user/userload.jsp">고객관리
								▸</a></li>
						<li class="menu_bar2"><a href="../product/proload.jsp">상품관리
								▸</a></li>
						<li class="menu_bar2"><a href="orderload.jsp">주문관리 ▸</a></li>
					</ul>
				</div>
				<div class="manage_logout">
					<a href="../../logout.jsp">로그아웃</a>
				</div>
			</div>


			<div id="manage_section">
				<div id="manage_detail">
					<div class="order_combtns">
						<a href="orderload.jsp"><button class="manage_btn">미완료
								주문</button></a>
						<form action="orderdel.jsp" method="post">
							<button class="manage_btn">주문 삭제</button>
							<input type="hidden" name="delselectedOrders" value=""
								id="delselectedOrders" />
						</form>
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
                                try {
                                
                                	
                                    String selectQuery = "SELECT * FROM `order` where odiv = 3" ; // Make sure the table name is correct
                                    PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
                                    ResultSet resultSet = preparedStatement.executeQuery();

                                    while (resultSet.next()) {
                                        int orderNumber = resultSet.getInt("ono");
                                        String memberId = resultSet.getString("mid");
                                        String productName = resultSet.getString("pname");
                                        int productPrice = resultSet.getInt("pprice");
                                        int cartQuantity = resultSet.getInt("cquantity");
                                        String memberName = resultSet.getString("mname");
                                        String memberAdress = resultSet.getString("madress");
                                        String memberPhone = resultSet.getString("mphone");
                                        int orderPay = resultSet.getInt("opay");
                                        int cartTotalPrice = resultSet.getInt("ctotalprice");
                                        String orderText = resultSet.getString("otext");
                                        int cartDiv = resultSet.getInt("odiv");
                                %>
								<tr class="t_tr">
									<td><input type="checkbox" name="orderCCheck" value="<%=orderNumber%>" class="orderCCheckbox"/></td>
									<td><%=orderNumber %></td>
									<td><%=memberId%></td>
									<td><%=productName%></td>
									<td><%=productPrice%></td>
									<td><%=cartQuantity%></td>
									<td><%=memberName%></td>
									<td><%=memberAdress%></td>
									<td><%=memberPhone%></td>
									<td><%=orderPay%></td>
									<td><%=cartTotalPrice%></td>
									<td><%=orderText%></td>
									<td><input type="hidden" name="cartDiv" value="<%=cartDiv %>" /></td>
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
					</form>
				</div>
				<div id="pagination-container"></div>
			</div>
		</main>
	</div>
</body>
</html>
