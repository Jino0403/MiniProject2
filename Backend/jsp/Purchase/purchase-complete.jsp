<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<%
			HttpSession session1 = request.getSession();
		    String userid = (String) session1.getAttribute("username");
		   %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Styles/CSS/purchase-complete.css" />
<title>구매 완료</title>
</head>
<body>
	<h1>구매가 완료되었습니다!</h1>
	<p class="step">
		주문결제 ><span class="step-order">결제완료</span>
	</p>
	<hr class="first-hr" />
			<%
    try {
      String selectQuery = "SELECT * FROM `order` where mid = ? ";
      PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
      preparedStatement.setString(1, "guddn13212");
      ResultSet resultSet = preparedStatement.executeQuery();
      while (resultSet.next()) {
          String ProductName = resultSet.getString("pname");
          int productPrice = resultSet.getInt("pprice");
          int cartQuantity = resultSet.getInt("cquantity");
          String memberName = resultSet.getString("mname");
          String memberAdress = resultSet.getString("madress");
          String memberPhone = resultSet.getString("mphone");
          int carttotalPrice = resultSet.getInt("ctotalprice");
          String orderText = resultSet.getString("otext");
          String orderPayment = resultSet.getString("opay");
      %>
	<table>
		<caption>주문 상세 정보</caption>
		<thead>
			<tr>
				<td class="table-left">제품명</td>
				<td class="table-right"><%= ProductName %></td>
			</tr>
			<tr>
				<td class="table-left">가격</td>
				<td class="table-right"><%= productPrice %></td>
			</tr>
			<tr>
				<td class="table-left">수량</td>
				<td class="table-right"><%= cartQuantity %></td>
			</tr>
			<tr>
				<td class="table-left">고객명</td>
				<td class="table-right"><%= memberName %></td>
			</tr>
			<tr>
				<td class="table-left">주소</td>
				<td class="table-right"><%= memberAdress %></td>
			</tr>
			<tr>
				<td class="table-left">전화번호</td>
				<td class="table-right"><%= memberPhone %></td>
			</tr>
			<tr>
				<td class="table-left">총 가격</td>
				<td class="table-right"><%= carttotalPrice %></td>
			</tr>
			<tr>
				<td class="table-left">배송 메모</td>
				<td class="table-right"><%= orderText %></td>
			</tr>
			<tr>
				<td class="table-left">결제 유형</td>
				<td class="table-right"><%= orderPayment %></td>
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
		</thead>
	</table>
	<hr class="last-hr" />
	<div class="go-index">
		<a href="/Frontend/index.html">홈페이지로 돌아가기</a>
	</div>
</body>
</html>