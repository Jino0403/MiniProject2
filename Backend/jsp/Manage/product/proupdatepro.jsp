<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Objects" %>
<%@ include file="../../conn.jsp"%>
<%
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");
  Integer enteredProductNumber = Integer.valueOf(request.getParameter("productNumber"));
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

  // 이 부분은 실제 데이터베이스 조회 등의 로직이 들어가야 합니다.
  boolean productExists = false;
  try {
    String checkQuery = "SELECT COUNT(*) FROM product WHERE pno = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setInt(1, enteredProductNumber);
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
      String updateQuery = "UPDATE product SET pname = ?, pcategory = ?, pprice = ?, pquantity = ?, pml = ?, palcohol = ?, pcountry = ?, ptext = ?, purl = ?, purl2 = ? WHERE pno = ?";
      PreparedStatement preparedStatement = conn.prepareStatement(updateQuery);
      preparedStatement.setString(1, enteredProductName);
      preparedStatement.setString(2, enteredProductCategory);
      preparedStatement.setInt(3, enteredProductPrice);
      preparedStatement.setInt(4, enteredProductQuantity);
      preparedStatement.setInt(5, enteredProductMl);
      preparedStatement.setDouble(6, enteredProductAlcohol);
      preparedStatement.setString(7, enteredProductCountry);
      preparedStatement.setString(8, enteredProductText);
      if (Objects.equals(enteredProductCategory, "맥주")) {
          preparedStatement.setString(9, "/Styles/images/snack_image/beer/"+ enteredProductImg);
        } else if (Objects.equals(enteredProductCategory, "막걸리")) {
          preparedStatement.setString(9, "/Styles/images/alcohol_image/makgeolli/"+ enteredProductImg);
        }else if (Objects.equals(enteredProductCategory, "사케")) {
          preparedStatement.setString(9, "/Styles/images/alcohol_image/sake/"+ enteredProductImg);
        }else if (Objects.equals(enteredProductCategory, "소주")) {
          preparedStatement.setString(9, "/Styles/images/alcohol_image/soju/"+ enteredProductImg);
        }else if (Objects.equals(enteredProductCategory, "보드카")) {
          preparedStatement.setString(9, "/Styles/images/alcohol_image/vodka/"+ enteredProductImg);
        }else if (Objects.equals(enteredProductCategory, "위스키")) {
          preparedStatement.setString(9, "/Styles/images/alcohol_image/whisky/"+ enteredProductImg);
        }else if (Objects.equals(enteredProductCategory, "와인")) {
          preparedStatement.setString(9, "/Styles/images/alcohol_image/wine/"+ enteredProductImg);
        } else {
          preparedStatement.setString(9, "/Styles/images/snack_image/"+ enteredProductImg);
        }

      if (Objects.equals(enteredProductCategory, "고기류")) {
        preparedStatement.setString(10, "/Styles/images/food-detail/" + enteredProductDetailImg);
      } else if (Objects.equals(enteredProductCategory, "해산물류")) {
    	preparedStatement.setString(10, "/Styles/images/food-detail/" + enteredProductDetailImg);  
      } else if (Objects.equals(enteredProductCategory, "탕류")) {
    	preparedStatement.setString(10, "/Styles/images/food-detail/" + enteredProductDetailImg);  
      } else {
        preparedStatement.setString(10, "/Styles/images/alcohol-detail/" + enteredProductDetailImg);
      }
      preparedStatement.setInt(11, enteredProductNumber);
      preparedStatement.executeUpdate();
      out.println("데이터가 성공적으로 업데이트되었습니다.");
      response.sendRedirect("proload.jsp"); // 상품 관리 페이지로 이동
    } catch (Exception e) {
      out.println("오류: " + e.getMessage());
    }
  }
%>
