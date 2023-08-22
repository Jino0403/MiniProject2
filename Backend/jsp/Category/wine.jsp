<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 와인</title>
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
                String wineSelectQuery = "SELECT * FROM product where pcategory = '와인';";
                PreparedStatement preparedStatement = conn.prepareStatement(wineSelectQuery);
                ResultSet wineResultSet = preparedStatement.executeQuery();
                while (wineResultSet.next()) {
                  int productNumber = wineResultSet.getInt("pno");
                  String productName = wineResultSet.getString("pname");
                  int productPrice = wineResultSet.getInt("pprice");
                  String productUrl = wineResultSet.getString("purl");
                  String productPriceWon = String.format("%,d 원", productPrice);
            %>
            <div class="items">
              <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
                <button type="submit" class="items-submit">
                  <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                  <img class="items_img" id="items-img" src="${pageContext.request.contextPath}<%=productUrl%>" />
                  <span class="item_span"><%=productName%></span>
                  <p class="item_p"><%=productPriceWon%></p>
                </button>
              </form>
            </div>
            <%
                }
                wineResultSet.close();
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
