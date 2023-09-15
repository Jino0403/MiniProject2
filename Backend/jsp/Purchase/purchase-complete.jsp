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

<table>
   <caption>주문 상세 정보</caption>
   <thead>
   <%
      try {
         String selectQuery = "SELECT * FROM `order` where mid = ? ";
         PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
         preparedStatement.setString(1, "kms1109");
         ResultSet resultSet = preparedStatement.executeQuery();

         // 각 주문 정보를 저장할 변수
         String memberName = null;
         String memberAdress = null;
         String memberPhone = null;
         int carttotalPrice = 0;
         String orderText = null;
         String orderPayment = null;

         while (resultSet.next()) {
            String ProductName = resultSet.getString("pname");
            int productPrice = resultSet.getInt("pprice");
            int cartQuantity = resultSet.getInt("cquantity");

            // 첫 번째 주문 정보 저장
            if (memberName == null) {
               memberName = resultSet.getString("mname");
               memberAdress = resultSet.getString("madress");
               memberPhone = resultSet.getString("mphone");
               carttotalPrice = resultSet.getInt("ctotalprice");
               orderText = resultSet.getString("otext");
               orderPayment = resultSet.getString("opay");
            }
   %>
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
   <%
      }

      // 주문 정보 출력
   %>
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
   <a href="../Main/index.jsp">홈페이지로 돌아가기</a>
</div>
</body>
</html>