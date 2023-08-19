<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 사케</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles/CSS/category.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Styles/CSS/style.css" />
    <script src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
  </head>
  <body>
  <div id="wrapper">
    <header><jsp:include page="../Main/header.jsp" /></header>
    <nav><jsp:include page="../Main/nav.jsp" /></nav>
    <main>
      <div id="item_lists">
        <div class="item_line">
          <%
            try {
              String sakeSelectQuery = "SELECT * FROM product where pcategory = '사케';";
              PreparedStatement preparedStatement = conn.prepareStatement(sakeSelectQuery);
              ResultSet sakeResultSet = preparedStatement.executeQuery();
              while (sakeResultSet.next()) {
                int productNumber = sakeResultSet.getInt("pno");
                String productName = sakeResultSet.getString("pname");
                int productPrice = sakeResultSet.getInt("pprice");
                String productUrl = sakeResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="items">
            <form id="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" id="items-submit">
                <input type="hidden" value="<%=productNumber%>" id="alcoholid" name="alcoholid">
                <img class="items_img" id="items-img" src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span class="item_span"><%=productName%></span>
                <p class="item_p"><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              sakeResultSet.close();
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
