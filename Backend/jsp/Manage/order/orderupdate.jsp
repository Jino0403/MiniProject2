<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
	int enteredOrderNumber = Integer.parseInt(request.getParameter("ono"));
	String enteredMemberId = request.getParameter("mid");
	String enteredProductName = request.getParameter("pname");
	int enteredProductPrice = Integer.parseInt(request.getParameter("pprice"));
	int enteredCartQuantity = Integer.parseInt(request.getParameter("cquantity"));
	String enteredMemberName = request.getParameter("mname");
	String enteredMemberAdress = request.getParameter("madress");
	String enteredMemberPhone = request.getParameter("mphone");
	int enteredOrderPay = Integer.parseInt(request.getParameter("opay"));
	int enteredCartTotalPrice = Integer.parseInt(request.getParameter("ctotalprice"));
	String enteredOrderText = request.getParameter("otext"); 
	int enteredCartDiv = Integer.parseInt(request.getParameter("cdiv"));

  // 이 부분은 실제 데이터베이스 조회 등의 로직이 들어가야 합니다.
  boolean orderExists = false;
  try {
    String checkQuery = "SELECT COUNT(*) FROM order WHERE ono = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setInt(1, enteredOrderNumber);
    ResultSet resultSet = checkStatement.executeQuery();
    if (resultSet.next()) {
      int count = resultSet.getInt(1);
      if (count > 0) {
        orderExists = true;
      }
    }
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }

  if (orderExists) {
    try {
      String updateQuery = "UPDATE order SET ono = ?, pname = ?, pprice = ?, cquantity = ? , mname = ? , madress = ?, mphone = ?, opay = ? , ctotalprice = ?, otext = ? , cdiv = ? , where mid = ?";
      PreparedStatement preparedStatement = conn.prepareStatement(updateQuery);
      preparedStatement.setInt(1, enteredOrderNumber);
      preparedStatement.setString(2, enteredProductName);
      preparedStatement.setInt(3, enteredProductPrice);
      preparedStatement.setInt(4, enteredCartQuantity);
      preparedStatement.setString(5, enteredMemberName);
      preparedStatement.setString(6, enteredMemberAdress);
      preparedStatement.setString(7, enteredMemberPhone);
      preparedStatement.setInt(8, enteredOrderPay);
      preparedStatement.setInt(9, enteredCartTotalPrice);
      preparedStatement.setString(10, enteredOrderText);
      preparedStatement.setInt(11,enteredCartDiv);
      preparedStatement.executeUpdate();
      /* out.println("데이터가 성공적으로 저장되었습니다."); */
      response.sendRedirect("orderload.jsp"); // 대시보드 페이지로 이동
    } catch (Exception e) {
      out.println("오류: " + e.getMessage());
    }
  }
%>
