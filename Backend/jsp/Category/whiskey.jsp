<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 위스키</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles/CSS/category.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles/CSS/style.css" />
    <script src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
    <script src="${pageContext.request.contextPath}/Styles/Javascript/category.js"></script>
  </head>
  <body>
  <body>
  <div id="wrapper">
    <header><jsp:include page="../Main/header.jsp" /></header>
    <nav><jsp:include page="../Main/nav.jsp" /></nav>
    <main>
      <div id="item_lists">
        <div class="item_line">
          <%
            try {
              String whiskeySelectQuery = "SELECT * FROM product where pcategory = '위스키';";
              PreparedStatement preparedStatement = conn.prepareStatement(whiskeySelectQuery);
              ResultSet whiskeyResultSet = preparedStatement.executeQuery();
              while (whiskeyResultSet.next()) {
            	int productDiv = whiskeyResultSet.getInt("pdiv");
                int productNumber = whiskeyResultSet.getInt("pno");
                String productName = whiskeyResultSet.getString("pname");
                int productPrice = whiskeyResultSet.getInt("pprice");
                String productUrl = whiskeyResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="items">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">
                <input type="hidden" value="<%=productDiv%>" class="alcoholid" name="productDiv">
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img class="items_img" id="items-img" src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span class="item_span"><%=productName%></span>
                <p class="item_p"><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              whiskeyResultSet.close();
              preparedStatement.close();
              conn.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>

        </div>
      </div>
    </main>
    <footer><jsp:include page="../Main/footer.jsp" /></footer>
  </div>
  </body>
  <script>
    includeHTML()
  </script>
</html>
