<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import="java.sql.*"%> <%@ include file="../conn.jsp"%> <% try { int searchId =
Integer.parseInt(request.getParameter("alcoholid")); String selectQuery =
"SELECT * FROM product where pno = ? "; PreparedStatement preparedStatement =
conn.prepareStatement(selectQuery); preparedStatement.setInt(1, searchId);
ResultSet resultSet = preparedStatement.executeQuery(); %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 맥주</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/product-detail.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/style.css"
    />
    <script src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
    <script
      src="${pageContext.request.contextPath}/Styles/Javascript/product-detail.js"
      defer
    ></script>
  </head>
  <body>
    <div id="wrapper">
      <header><jsp:include page="../Main/header.jsp" /></header>
      <nav><jsp:include page="../Main/nav.jsp" /></nav>
      <main>
        <% while (resultSet.next()) { int productNumber =
        resultSet.getInt("pno"); String productName =
        resultSet.getString("pname"); String productCategory =
        resultSet.getString("pcategory"); int productPrice =
        resultSet.getInt("pprice"); int productQuantity =
        resultSet.getInt("pquantity"); int productMl = resultSet.getInt("pml");
        double productAlcohol= resultSet.getDouble("palcohol"); String
        productCountry = resultSet.getString("pcountry"); String productText =
        resultSet.getString("ptext"); String productUrl =
        resultSet.getString("purl"); String productCharge =
        resultSet.getString("mid"); String productPriceWon = String.format("%,d
        원", productPrice); %>
        <div class="product-first">
          <img
            class="main-img"
            src="${pageContext.request.contextPath}<%=productUrl%>"
          />
          <div class="product-buy">
            <h1 class="product-main-title"><%=productName%></h1>
            <hr class="first-hr" />

            <h2><%=productPriceWon%></h2>

            <div class="product-select">
              <div class="count-button">
                <h3>수량</h3>
                <button id="decrement">-</button>
                <span id="quantity">1</span>
                <button id="increment">+</button>
              </div>
              <div class="product-buy-button">
                <form>
                  <input type="hidden" value="" id="cart-value" />
                  <button
                    class="basket-button"
                    type="submit"
                    onclick="location.href='.jsp'"
                  >
                    장바구니에 담기
                  </button>
                </form>
                <form>
                  <input type="hidden" value="" id="buy-value" />
                  <button
                    class="purchase-button"
                    type="submit"
                    onclick="location.href='.jsp'"
                  >
                    구매하기
                  </button>
                </form>
              </div>
            </div>
          </div>
        </div>

        <hr />
        <h2 class="recommend-comment">곁들이면 찰떡궁합인 안주 추천</h2>
        <div class="product-second">
          <div class="second-line">
            <div class="product-recommend-image">
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/안주사진/맥주안주_버팔로윙봉.png"
              />
            </div>
            <h5>버팔로 윙봉</h5>
            <p>16,200원</p>
          </div>
          <div class="second-line">
            <div class="product-recommend-image">
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/안주사진/위스키안주_감바스.png"
              />
            </div>
            <h5>감바스</h5>
            <p>13,200원</p>
          </div>
          <div class="second-line">
            <div class="product-recommend-image">
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/안주사진/와인안주_찹 스테이크.png"
              />
            </div>
            <h5>찹 스테이크</h5>
            <p>16,200원</p>
          </div>
          <div class="second-line">
            <div class="product-recommend-image">
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/안주사진/사케안주_연어구이.png"
              />
            </div>
            <h5>연어구이</h5>
            <p>3,300원</p>
          </div>
          <div class="second-line">
            <div class="product-recommend-image">
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/안주사진/와인안주_홍합스튜.png"
              />
            </div>
            <h5>홍합스튜</h5>
            <p>10,700원</p>
          </div>
        </div>
        <hr />
        <div class="product-third"></div>
        <table>
          <caption>
            주류 정보
          </caption>
          <thead>
            <tr>
              <th class="table-top">술 종류</th>
              <th class="table-top">알코올 도수</th>
              <th class="table-top">원산지</th>
              <th class="table-top">용량</th>
            </tr>
            <tr>
              <th class="table-bottom"><%=productCategory%></th>
              <th class="table-bottom"><%=productAlcohol%> %</th>
              <th class="table-bottom"><%=productCountry%></th>
              <th class="table-bottom"><%=productMl%> ml</th>
            </tr>
          </thead>
        </table>
        <img src="" alt="이미지" />
        <img
          class="seviece-information"
          src="${pageContext.request.contextPath}<%=productUrl%>"
        />
        <img
          class="seviece-information"
          src="${pageContext.request.contextPath}/Styles/images/service.png"
        />
        <% } resultSet.close(); preparedStatement.close(); conn.close(); } catch
        (Exception e) { e.printStackTrace(); } %>
      </main>
      <footer><jsp:include page="../Main/footer.jsp" /></footer>
    </div>
    <script></script>
  </body>
  <script>
    includeHTML()
  </script>
</html>
