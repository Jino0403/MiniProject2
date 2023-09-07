/*const searchResultsHTML = [
            <% 
            try {
                String selectQuery = "SELECT * FROM product";
                PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
                ResultSet resultSet = preparedStatement.executeQuery();

                while (resultSet.next()) {
                    String productUrl = resultSet.getString("purl");
                    String productName = resultSet.getString("pname");
                    int productPrice = resultSet.getInt("pprice");
                    
                    // Generate the HTML for each item directly here
            %>
            `<div class='items'>
                <img class='items_img' src='<%= pageContext.request.contextPath %>${productUrl}' alt='picture' />
                <span class='item_span'><%= productName %></span>
                <p class='item_p'><%= productPrice %></p>
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
        });*/