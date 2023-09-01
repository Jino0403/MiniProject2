<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
  String enteredProductName = request.getParameter("productName");
  String enteredProductCategory = request.getParameter("productCategory");
  Integer enteredProductPrice = Integer.valueOf(request.getParameter("productPrice"));
  Integer enteredProductQuantity = Integer.valueOf(request.getParameter("productQuantity"));
  Integer enteredProductMl = Integer.valueOf(request.getParameter("productMl"));
  Double enteredProductAlcohol = Double.valueOf(request.getParameter("productAlcohol"));
  String enteredProductCountry = request.getParameter("productCountry");
  String enteredProductText = request.getParameter("productText");

  HttpSession session1 = request.getSession();
  String ProductUserName = (String) session1.getAttribute("username");

  // 이 부분은 실제 데이터베이스 조회 등의 로직이 들어가야 합니다.
  boolean productExists = false;
  try {
    String checkQuery = "SELECT COUNT(*) FROM product WHERE pname = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setString(1, enteredProductName);
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

  try {
    if (productExists) {
      // 이미 존재하는 사용자인 경우 업데이트 수행
      out.println("존재하는 상품 입니다.");
    } else {
      String insertQuery = "INSERT INTO product (pname, pcategory, pprice, pquantity, pml, palcohol, pcountry, ptext, mid) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
      PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
      preparedStatement.setString(1, enteredProductName);
      preparedStatement.setString(2, enteredProductCategory);
      preparedStatement.setInt(3, enteredProductPrice);
      preparedStatement.setInt(4, enteredProductQuantity);
      preparedStatement.setInt(5, enteredProductMl);
      preparedStatement.setDouble(6, enteredProductAlcohol);
      preparedStatement.setString(7, enteredProductCountry);
      preparedStatement.setString(8, enteredProductText);
      preparedStatement.setString(9, ProductUserName);
      preparedStatement.executeUpdate();
      out.println("상품 추가 완료.");
    }
    response.sendRedirect("proload.jsp"); // 대시보드 페이지로 이동
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }
%>
