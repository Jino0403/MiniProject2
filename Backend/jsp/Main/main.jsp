<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>


<div id="main_banner">
  <img
    src="${pageContext.request.contextPath}/Styles/images/login.jpg"
  />
</div>
<hr />
  <div id="main_list_wrapper">

    <div class="main_category_list">
      <div class="main_category_introduction">
        <h3>🏆 이달의 BEST Item</h3>
        <p>고객들에게 큰 사랑을 받은 아이템들을 선보입니다.</p>
      </div>
      <div class="main_product_list">
        <%
          try {
            String bestSelectQuery = "SELECT * FROM product where pdiv = '1' order by RAND() LIMIT 5;";
            PreparedStatement preparedStatement = conn.prepareStatement(bestSelectQuery);
            ResultSet bestResultSet = preparedStatement.executeQuery();
            while (bestResultSet.next()) {
              int productDiv = bestResultSet.getInt("pdiv");
              int productNumber = bestResultSet.getInt("pno");
              String productName = bestResultSet.getString("pname");
              int productPrice = bestResultSet.getInt("pprice");
              String productUrl = bestResultSet.getString("purl");
              String productPriceWon = String.format("%,d 원", productPrice);
        %>
        <div class="main_product">
          <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
            <button type="submit" class="items-submit">
              <input type="hidden" value="<%=productDiv %>" class="alcoholid" name="productDiv" />
              <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
          <img src="${pageContext.request.contextPath}<%=productUrl%>" />
          <span><%=productName%></span>
          <p><%=productPriceWon%></p>
            </button>
          </form>
          </div>
        <%
            }
            bestResultSet.close();
            preparedStatement.close();
          } catch (Exception e) {
            e.printStackTrace();
          }
        %>
          </div>
        </div>

      <div class="main_category_list">
        <div class="main_category_introduction">
          <h3>🍾 위스키 Best Item</h3>
          <p>고객들에게 큰 사랑을 받은 위스키를 지금 확인해보세요!</p>
        </div>
        <div class="main_product_list">
          <%
            try {
              String whiskeySelectQuery = "SELECT * FROM product where pcategory = '위스키' LIMIT 5;";
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
          <div class="main_product">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">
              	<input type="hidden" value="<%=productDiv %>" class="alcoholid" name="productDiv" />
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span><%=productName%></span>
                <p><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              whiskeyResultSet.close();
              preparedStatement.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </div>
        </div>
      </div>

      <div class="main_category_list">
        <div class="main_category_introduction">
          <h3>🍷 와인 Best Item</h3>
          <p>고객들에게 큰 사랑을 받은 와인을 지금 확인해보세요!</p>
        </div>
        <div class="main_product_list">
          <%
            //위스키 와인 사케 보드카 소주 맥주 막걸리
            try {
              String wineSelectQuery = "SELECT * FROM product where pcategory = '와인' LIMIT 5;";
              PreparedStatement preparedStatement = conn.prepareStatement(wineSelectQuery);
              ResultSet wineResultSet = preparedStatement.executeQuery();
              while (wineResultSet.next()) {
            	int productDiv = wineResultSet.getInt("pdiv");
                int productNumber = wineResultSet.getInt("pno");
                String productName = wineResultSet.getString("pname");
                int productPrice = wineResultSet.getInt("pprice");
                String productUrl = wineResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="main_product">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">
              	<input type="hidden" value="<%=productDiv %>" class="alcoholid" name="productDiv" />
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span><%=productName%></span>
                <p><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              wineResultSet.close();
              preparedStatement.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </div>
        </div>
      </div>

      <div class="main_category_list">
        <div class="main_category_introduction">
          <h3>🍶 사케 Best Item</h3>
          <p>고객들에게 큰 사랑을 받은 사케를 지금 확인해보세요!</p>
        </div>
        <div class="main_product_list">
          <%
            try {
              String sakeSelectQuery = "SELECT * FROM product where pcategory = '사케' LIMIT 5;";
              PreparedStatement preparedStatement = conn.prepareStatement(sakeSelectQuery);
              ResultSet sakeResultSet = preparedStatement.executeQuery();
              while (sakeResultSet.next()) {
            	int productDiv = sakeResultSet.getInt("pdiv");
                int productNumber = sakeResultSet.getInt("pno");
                String productName = sakeResultSet.getString("pname");
                int productPrice = sakeResultSet.getInt("pprice");
                String productUrl = sakeResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="main_product">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">
              	<input type="hidden" value="<%=productDiv %>" class="alcoholid" name="productDiv" />
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span><%=productName%></span>
                <p><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              sakeResultSet.close();
              preparedStatement.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </div>
        </div>
      </div>

      <div class="main_category_list">
        <div class="main_category_introduction">
          <h3>🥃 보드카 Best Item</h3>
          <p>고객들에게 큰 사랑을 받은 보드카를 지금 확인해보세요!</p>
        </div>
        <div class="main_product_list">
          <%
            try {
              String vodkaSelectQuery = "SELECT * FROM product where pcategory = '보드카' LIMIT 5;";
              PreparedStatement preparedStatement = conn.prepareStatement(vodkaSelectQuery);
              ResultSet vodkaResultSet = preparedStatement.executeQuery();
              while (vodkaResultSet.next()) {
            	int productDiv = vodkaResultSet.getInt("pdiv");
                int productNumber = vodkaResultSet.getInt("pno");
                String productName = vodkaResultSet.getString("pname");
                int productPrice = vodkaResultSet.getInt("pprice");
                String productUrl = vodkaResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="main_product">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">
              	<input type="hidden" value="<%=productDiv %>" class="alcoholid" name="productDiv" />
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span><%=productName%></span>
                <p><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              vodkaResultSet.close();
              preparedStatement.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </div>
        </div>
      </div>

      <div class="main_category_list">
        <div class="main_category_introduction">
          <h3>🥛 소주 Best Item</h3>
          <p>고객들에게 큰 사랑을 받은 소주를 지금 확인해보세요!</p>
        </div>
        <div class="main_product_list">
          <%
            try {
              String sojuSelectQuery = "SELECT * FROM product where pcategory = '소주' LIMIT 5;";
              PreparedStatement preparedStatement = conn.prepareStatement(sojuSelectQuery);
              ResultSet sojuResultSet = preparedStatement.executeQuery();
              while (sojuResultSet.next()) {
            	int productDiv = sojuResultSet.getInt("pdiv");
                int productNumber = sojuResultSet.getInt("pno");
                String productName = sojuResultSet.getString("pname");
                int productPrice = sojuResultSet.getInt("pprice");
                String productUrl = sojuResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="main_product">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">
              	<input type="hidden" value="<%=productDiv %>" class="alcoholid" name="productDiv" />
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span><%=productName%></span>
                <p><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              sojuResultSet.close();
              preparedStatement.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </div>
        </div>
      </div>

      <div class="main_category_list">
        <div class="main_category_introduction">
          <h3>🍺 맥주 Best Item</h3>
          <p>고객들에게 큰 사랑을 받은 소주를 지금 확인해보세요!</p>
        </div>
        <div class="main_product_list">
          <%
            try {
              String beerSelectQuery = "SELECT * FROM product where pcategory = '맥주' LIMIT 5;";
              PreparedStatement preparedStatement = conn.prepareStatement(beerSelectQuery);
              ResultSet sojuResultSet = preparedStatement.executeQuery();
              while (sojuResultSet.next()) {
            	int productDiv = sojuResultSet.getInt("pdiv");
                int productNumber = sojuResultSet.getInt("pno");
                String productName = sojuResultSet.getString("pname");
                int productPrice = sojuResultSet.getInt("pprice");
                String productUrl = sojuResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="main_product">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">
              	<input type="hidden" value="<%=productDiv %>" class="alcoholid" name="productDiv" />
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span><%=productName%></span>
                <p><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              sojuResultSet.close();
              preparedStatement.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </div>
        </div>
      </div>

      <div class="main_category_list">
        <div class="main_category_introduction">
          <h3>🥣 막걸리 Best Item</h3>
          <p>고객들에게 큰 사랑을 받은 막걸리를 지금 확인해보세요!</p>
        </div>
        <div class="main_product_list">
          <%
            try {
              String makSelectQuery = "SELECT * FROM product where pcategory = '막걸리' LIMIT 5;";
              PreparedStatement preparedStatement = conn.prepareStatement(makSelectQuery);
              ResultSet makResultSet = preparedStatement.executeQuery();
              while (makResultSet.next()) {
            	int productDiv = makResultSet.getInt("pdiv");
                int productNumber = makResultSet.getInt("pno");
                String productName = makResultSet.getString("pname");
                int productPrice = makResultSet.getInt("pprice");
                String productUrl = makResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="main_product">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">
              	<input type="hidden" value="<%=productDiv %>" class="alcoholid" name="productDiv" />
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span><%=productName%></span>
                <p><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              makResultSet.close();
              preparedStatement.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </div>
        </div>
      </div>

      <div class="main_category_list">
        <div class="main_category_introduction">
          <h3>🍲 안주류 Best Item</h3>
          <p>고객들에게 큰 사랑을 받은 안주를 지금 확인해보세요!</p>
        </div>
        <div class="main_product_list">
          <%
            try {
              String foodSelectQuery = "SELECT * FROM product where pdiv = 2 LIMIT 5;";
              PreparedStatement preparedStatement = conn.prepareStatement(foodSelectQuery);
              ResultSet foodResultSet = preparedStatement.executeQuery();
              while (foodResultSet.next()) {
            	int productDiv = foodResultSet.getInt("pdiv");
                int productNumber = foodResultSet.getInt("pno");
                String productName = foodResultSet.getString("pname");
                int productPrice = foodResultSet.getInt("pprice");
                String productUrl = foodResultSet.getString("purl");
                String productPriceWon = String.format("%,d 원", productPrice);
          %>
          <div class="main_product">
            <form class="alcohol-detail" action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp" method="post">
              <button type="submit" class="items-submit">              	
                <input type="hidden" value="<%=productDiv%>" class="alcoholid" name="productDiv">
                <input type="hidden" value="<%=productNumber%>" class="alcoholid" name="alcoholid">
                <img src="${pageContext.request.contextPath}<%=productUrl%>" />
                <span><%=productName%></span>
                <p><%=productPriceWon%></p>
              </button>
            </form>
          </div>
          <%
              }
              foodResultSet.close();
              preparedStatement.close();
              conn.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
