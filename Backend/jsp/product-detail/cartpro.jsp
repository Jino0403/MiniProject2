<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<%
  String enteredmemberId = request.getParameter("memberId");
  Integer enteredProductNo = Integer.valueOf(request.getParameter("productNo"));
  Integer enteredProductQuan = Integer.valueOf(request.getParameter("productQuan"));

  String enteredProductName = null;
  Integer enteredProductPrice = null;

  try {
    String checkQuery = "SELECT pname, pprice, cquantity FROM cart WHERE pno = ? AND mid = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setInt(1, enteredProductNo);
    checkStatement.setString(2, enteredmemberId);
    ResultSet resultSet = checkStatement.executeQuery();

    if (resultSet.next()) {
      enteredProductName = resultSet.getString("pname");
      enteredProductPrice = resultSet.getInt("pprice");
      int currentQuantity = resultSet.getInt("cquantity");

      enteredProductQuan += currentQuantity; // Increase quantity
      resultSet.close();

      String updateQuery = "UPDATE cart SET cquantity = ? WHERE pno = ? AND mid = ?";
      PreparedStatement updateStatement = conn.prepareStatement(updateQuery);
      updateStatement.setInt(1, enteredProductQuan);
      updateStatement.setInt(2, enteredProductNo);
      updateStatement.setString(3, enteredmemberId);
      updateStatement.executeUpdate();

      updateStatement.close();
    } else {
      resultSet.close();

      String selectQuery = "SELECT pname, pprice FROM product WHERE pno = ?";
      PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
      selectStatement.setInt(1, enteredProductNo);
      ResultSet productResultSet = selectStatement.executeQuery();

      if (productResultSet.next()) {
        enteredProductName = productResultSet.getString("pname");
        enteredProductPrice = productResultSet.getInt("pprice");
      }

      productResultSet.close();
      selectStatement.close();

      String insertQuery = "INSERT INTO cart (pno, pname, mid, pprice, cquantity) VALUES (?, ?, ?, ?, ?)";
      PreparedStatement insertStatement = conn.prepareStatement(insertQuery);
      insertStatement.setInt(1, enteredProductNo);
      insertStatement.setString(2, enteredProductName);
      insertStatement.setString(3, enteredmemberId);
      insertStatement.setInt(4, enteredProductPrice);
      insertStatement.setInt(5, enteredProductQuan);
      insertStatement.executeUpdate();

      insertStatement.close();
    }

    out.println("상품 추가 완료.");
    response.sendRedirect("../User/basket.jsp"); // 대시보드 페이지로 이동
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }
%>
