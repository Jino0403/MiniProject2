<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");
  try {
    int updateId = Integer.parseInt(request.getParameter("updateselectedProduct"));
    String selectQuery = "SELECT * FROM product where pno = ? ";
    PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
    preparedStatement.setInt(1, updateId);
    ResultSet resultSet = preparedStatement.executeQuery();
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
      src="../../../..../../../Styles/Javascript/manage.js"
      type="text/javascript"
      defer="defer"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="../../../..../../../Styles/CSS/managePage.css" />
    <title>관리자페이지</title>
  </head>
  <body>
    <div id="manage_wrapper">
      <main>
        <div id="manage_menu">
          <div class="manage_menu_section">
            <div class="manage_menu_title">
              <a href="../manageMain.jsp">Alcohol</a>
            </div>

            <h3>관리자페이지</h3>
            <ul id="nav_bar2">
              <li class="menu_bar2">
                <a href="../user/userload.jsp">고객관리 ▸</a>
              </li>
              <li class="menu_bar2">
                <a href="proload.jsp">상품관리 ▸</a>
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
          <div class="manage_pro">
            <div class="manage_protitle">📦 상품 정보 수정</div>
            <form class="proadd_form" action="proupdatepro.jsp">
            <div class="proadd_section">
            	
              <%
                while (resultSet.next()) {
                  int productNumber = resultSet.getInt("pno");
                  String productName = resultSet.getString("pname");
                  String productCategory = resultSet.getString("pcategory");
                  int productPrice = resultSet.getInt("pprice");
                  int productQuantity = resultSet.getInt("pquantity");
                  int productMl = resultSet.getInt("pml");
                  double productAlcohol= resultSet.getDouble("palcohol");
                  String productCountry = resultSet.getString("pcountry");
                  String productText = resultSet.getString("ptext");
                  String productUrl = resultSet.getString("purl");
                  String productUrl2 = resultSet.getString("purl2");
                  String productCharge = resultSet.getString("mid");
              %>
              <input type="hidden" value="<%=productNumber%>" name="productNumber">
              <div class="proadd_section1">
              <label>📛 상품명</label>
              <input type="text" value="<%=productName%>" name="productName"/>
              <label>🍹 카테고리</label>
              <select name="productCategory" class="select_category">
                <option value="위스키" <%=productCategory.equals("위스키") ? "selected" : ""%>>위스키</option>
                <option value="와인" <%=productCategory.equals("와인") ? "selected" : ""%>>와인</option>
                <option value="사케" <%=productCategory.equals("사케") ? "selected" : ""%>>사케</option>
                <option value="보드카" <%=productCategory.equals("보드카") ? "selected" : ""%>>보드카</option>
                <option value="소주" <%=productCategory.equals("소주") ? "selected" : ""%>>소주</option>
                <option value="맥주" <%=productCategory.equals("맥주") ? "selected" : ""%>>맥주</option>
                <option value="막걸리" <%=productCategory.equals("막걸리") ? "selected" : ""%>>막걸리</option>
                <option value="고기류" <%=productCategory.equals("고기류") ? "selected" : ""%>>고기류</option>
                <option value="해산물류" <%=productCategory.equals("해산물류") ? "selected" : ""%>>해산물류</option>
                <option value="탕류" <%=productCategory.equals("탕류") ? "selected" : ""%>>탕류</option>
              </select>
              <label>💰 상품가격</label>
              <input type="text" value="<%=productPrice%>" name="productPrice" />
              <label>🧺 재고량</label>
              <input type="text" value="<%=productQuantity%>" name="productQuantity" />
              <label>🥤 용량</label>
              <input type="text" value="<%=productMl%>" name="productMl" />
              </div>
              <div class="proadd_section2">
              <label>🥛 도수</label>
              <input type="text" value="<%=productAlcohol%>" name="productAlcohol" />
              <label>🇰🇷 국가</label>
              <input type="text" value="<%=productCountry%>" name="productCountry" />
              <label>📄 상품설명</label>
              <input type="text" maxlength="200" value="<%=productText%>" name="productText" />
			  <label>📷 상품이미지</label>
			  <input type="file" name="productImg">
		      <label>📷 상품상세이미지</label>
			  <input type="file" name="productDetailImg">
              
              </div>
              </div>
              <div class="proinfo_btns">
                <button class="pro_btn">수정하기</button>
                <a href="proload.jsp"
                ><button class="pro_btn">뒤로가기</button></a>
              </div>
              <%
                  }
                  resultSet.close();
                  preparedStatement.close();
                  conn.close();
                } catch (Exception e) {
                  e.printStackTrace();
                }
              %>
            </form>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
