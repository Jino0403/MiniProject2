<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<%
  HttpSession session1 = request.getSession();
  String userid = (String) session1.getAttribute("username");
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");
  
  int productNumber = Integer.parseInt(request.getParameter("productNumber"));
  int cartQuantity = Integer.parseInt(request.getParameter("productQuantity"));

  // 이 부분은 실제 데이터베이스 조회 등의 로직이 들어가야 합니다.
  boolean productExists = false;
  try {
    String checkQuery = "SELECT COUNT(*) FROM cart WHERE pno = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setInt(1, productNumber);
    ResultSet resultSet = checkStatement.executeQuery();
    if (resultSet.next()) {
      int count = resultSet.getInt(1);
      if (count > 0) {
        productExists = true;
      }
    }
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }

  if (productExists) {
    try {
      String updateQuery = "UPDATE cart SET cquantity = ? WHERE pno = ?";
      PreparedStatement preparedStatement = conn.prepareStatement(updateQuery);
      preparedStatement.setInt(1, cartQuantity);
      preparedStatement.setInt(2, productNumber);

      preparedStatement.executeUpdate();
      out.println("데이터가 성공적으로 업데이트되었습니다.");
    } catch (Exception e) {
      out.println("오류: " + e.getMessage());
    }
  }
%>