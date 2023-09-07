<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
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
				
            </div>
        </main>
        <footer><jsp:include page="../Main/footer.jsp" /></footer>
    </div>
    <script>
        includeHTML();

        const contextPath = '<%= request.getContextPath() %>';

        const searchResultsHTML = [
            <%
            try {
                String selectQuery = "SELECT * FROM product";
                PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                	int productDiv = resultSet.getInt("pdiv");
                	int productNumber = resultSet.getInt("pno");
                    String productUrl = resultSet.getString("purl");
                    String productName = resultSet.getString("pname");
                    int productPrice = resultSet.getInt("pprice");
            %>
            `<div class='items'>
            	<form name="searchResult" action="../product-detail/product-detail.jsp" method="post">
            		<button class="item_btn" type="submit">
            			<input type="hidden" name="productDiv" value="<%=productDiv%>" />
		                <input type="hidden" name="alcoholid" value="<%=productNumber%>"/>
		                <img class='items_img' src='${contextPath}<%=productUrl%>' alt='picture"/>
		                <span class='item_span'></span>
		                <p class='item_span'><%=productName%></p>
		                <p class='item_p'><%= productPrice %>원</p>
                	</button>
                </form>
            </div>`,
            
            
            <% 
                }
                resultSet.close();
                preparedStatement.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            } 
            %>
        ];
		
        const searchButton = document.getElementById('searchButton');
        const searchInput = document.getElementById('searchInput');
        const searchResultsContainer = document.getElementById('searchResults');

        searchButton.addEventListener('click', () => {
            const searchTerm = searchInput.value.toLowerCase();

            // Clear previous search results
            searchResultsContainer.innerHTML = '';

            // Filter and display search results
            searchResultsHTML.forEach(resultHTML => {
                const lowerCaseResult = resultHTML.toLowerCase();

                if (lowerCaseResult.includes(searchTerm)) {
                    searchResultsContainer.innerHTML += resultHTML;

                }
            });
        });
    </script>
</body>
</html>