<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Objects" %>
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
  String enteredProductImg = request.getParameter("productImg");
  String enteredProductDetailImg = request.getParameter("productDetailImg");

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
      String insertQuery = "INSERT INTO product (pname, pcategory, pprice, pquantity, pml, palcohol, pcountry, ptext, mid, purl, purl2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
      if (Objects.equals(enteredProductCategory, "맥주")) {
        preparedStatement.setString(10, "/Styles/images/snack_image/beer/"+ enteredProductImg);
      } else if (Objects.equals(enteredProductCategory, "막걸리")) {
        preparedStatement.setString(10, "/Styles/images/alcohol_image/makgeolli/"+ enteredProductImg);
      }else if (Objects.equals(enteredProductCategory, "사케")) {
        preparedStatement.setString(10, "/Styles/images/alcohol_image/sake/"+ enteredProductImg);
      }else if (Objects.equals(enteredProductCategory, "소주")) {
        preparedStatement.setString(10, "/Styles/images/alcohol_image/soju/"+ enteredProductImg);
      }else if (Objects.equals(enteredProductCategory, "보드카")) {
        preparedStatement.setString(10, "/Styles/images/alcohol_image/vodka/"+ enteredProductImg);
      }else if (Objects.equals(enteredProductCategory, "위스키")) {
        preparedStatement.setString(10, "/Styles/images/alcohol_image/whisky/"+ enteredProductImg);
      }else if (Objects.equals(enteredProductCategory, "와인")) {
        preparedStatement.setString(10, "/Styles/images/alcohol_image/wine/"+ enteredProductImg);
      } else {
        preparedStatement.setString(10, "/Styles/images/snack_image/"+ enteredProductImg);
      }
      
      
      
      if (Objects.equals(enteredProductCategory, "고기류")) {
        preparedStatement.setString(11, "/Styles/images/food-detail/" + enteredProductDetailImg);
      } else if (Objects.equals(enteredProductCategory, "해산물류")) {
    	preparedStatement.setString(11, "/Styles/images/food-detail/" + enteredProductDetailImg);  
      } else if (Objects.equals(enteredProductCategory, "탕류")) {
    	preparedStatement.setString(11, "/Styles/images/food-detail/" + enteredProductDetailImg);  
      } else {
        preparedStatement.setString(11, "/Styles/images/alcohol-detail/" + enteredProductDetailImg);
      }
      preparedStatement.executeUpdate();
      out.println("상품 추가 완료.");
    }
    response.sendRedirect("proload.jsp"); // 대시보드 페이지로 이동
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }
%>