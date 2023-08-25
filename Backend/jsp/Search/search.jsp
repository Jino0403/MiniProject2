<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<%
try {
    String selectQuery = "SELECT * FROM product";
    PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
    ResultSet resultSet = preparedStatement.executeQuery();
    
    String searchResultHTML = ""; // Initialize the HTML content
    
    while (resultSet.next()) {
      String productUrl = resultSet.getString("purl");
      String productName = resultSet.getString("pname");
      int productPrice = resultSet.getInt("pprice");
      
      // Generate the HTML for each item
      searchResultHTML += "<div class='items'>";
      searchResultHTML += "<img class='items_img' src='" + pageContext.request.contextPath + productUrl + "' alt='picture' />";
      searchResultHTML += "<span class='item_span'>" + productName + "</span>";
      searchResultHTML += "<p class='item_p'>" + productPrice + "</p>";
      searchResultHTML += "</div>";
    }
    
    resultSet.close();
    preparedStatement.close();
    conn.close();
  } catch (Exception e) {
    e.printStackTrace();
  }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="../../../Styles/CSS/style.css" />
    <link rel="stylesheet" type="text/css" href="../../../Styles/CSS/search.css" />
    <link rel="stylesheet" type="text/css" href="../../../Styles/CSS/category.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Orbit&display=swap"
      rel="stylesheet"
    />
    <script src="../../../Styles/Javascript/search.js"></script>
    <script src="../../../Styles/Javascript/includeHTML.js"></script>
    <title>메인 페이지</title>
  </head>
  <body>
    <div id="wrapper">
      <header><jsp:include page="../Main/header.jsp" /></header>
      <nav><jsp:include page="../Main/nav.jsp" /></nav>
      <main>
        <div id="search_title">
          <h2>찾으시는 상품명을 입력해주세요 !</h2>
        </div>
        <div id="header_search">
          <input id="searchInput" type="text" maxlength="30" />
          <a class="header_menu_item">
            <button id="searchButton" type="button">
              <img src="../../../Styles/images/search 1.png" />
            </button>
          </a>
        </div>
        <div id="searchResults" class="item_line">
       		<%= out.print(searchResultHTML) %>
          <!-- 여기에 검색 결과 아이템을 동적으로 추가할 예정 -->
        </div>
        <script>
          includeHTML();

          const searchButton = document.getElementById('searchButton');
          const searchInput = document.getElementById('searchInput');
          const searchResultsContainer = document.getElementById('searchResults');

          searchButton.addEventListener('click', () => {
            const searchTerm = searchInput.value;

            <% while (resultSet.next()) { %>
            const productUrl = "<%= resultSet.getString("purl") %>";
            const productName = "<%= resultSet.getString("pname") %>";
            const productPrice = <%= resultSet.getInt("pprice") %>;

            const searchResultHTML = `
              <div class="items">
                <img class="items_img" src="${pageContext.request.contextPath}${productUrl}" alt="picture" />
                <span class="item_span">${productName}</span>
                <p class="item_p">${productPrice}</p>
              </div>
            `;

            searchResultsContainer.innerHTML += searchResultHTML;
            <% } %>
          });
        </script>
      </main>
      <footer><jsp:include page="../Main/footer.jsp" /></footer>
    </div>
  </body>
  <script>
  includeHTML();

  const searchButton = document.getElementById('searchButton');
  const searchInput = document.getElementById('searchInput');
  const searchResultsContainer = document.getElementById('searchResults');

  searchButton.addEventListener('click', () => {
    const searchTerm = searchInput.value;

    // Dynamically insert the search results HTML here
    <% while (resultSet.next()) { %>
    const productUrl = "<%= resultSet.getString("purl") %>";
    const productName = "<%= resultSet.getString("pname") %>";
    const productPrice = <%= resultSet.getInt("pprice") %>;

    const searchResultHTML = `
      <div class="items">
        <img class="items_img" src="${pageContext.request.contextPath}${productUrl}" alt="picture" />
        <span class="item_span">${productName}</span>
        <p class="item_p">${productPrice}</p>
      </div>
    `;

    searchResultsContainer.innerHTML += searchResultHTML;
    <% } %>
  });
</script>

</html>
