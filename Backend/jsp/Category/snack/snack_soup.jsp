<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import="java.sql.*"%> <%@ include file="../../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 안주류 > 탕류</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/category.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/style.css"
    />
    <script src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
  </head>
  <body>
    <div id="wrapper">
      <header><jsp:include page="../../Main/header.jsp" /></header>
      <nav src="../../Main/nav.jsp">
        <jsp:include page="../../Main/nav.jsp" />
      </nav>
      <div class="snack-category-list">
        <a class="snack-category" href="../snack.jsp">전체</a>
        <a class="snack-category" href="../snack/snack_soup.jsp">탕류</a>
        <a class="snack-category" href="snack_meat.jsp">고기류</a>
        <a class="snack-category" href="snack_seafood.jsp">해산물류</a>
      </div>
      <main>
        <div id="item_lists">
          <div class="item_line">
            <%
              try {
                String soupSelectQuery = "SELECT * FROM product where pcategory = '탕류';";
                PreparedStatement preparedStatement = conn.prepareStatement(soupSelectQuery);
                ResultSet soupResultSet = preparedStatement.executeQuery();
                while (soupResultSet.next()) {
                  int productNumber = soupResultSet.getInt("pno");
                  String productName = soupResultSet.getString("pname");
                  int productPrice = soupResultSet.getInt("pprice");
                  String productUrl = soupResultSet.getString("purl");
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
                soupResultSet.close();
                preparedStatement.close();
                conn.close();
              } catch (Exception e) {
                e.printStackTrace();
              }
            %>
          </div>
        </div>
      </main>
      <footer><jsp:include page="../../Main/footer.jsp" /></footer>
    </div>
  </body>
  <script>
    includeHTML()
  </script>
</html>
