function search() {
  const searchInput = document.getElementById("search_input")
  const searchButton = document.getElementById("search_button")
  const searchResults = document.getElementById("search_results")

  searchButton.addEventListener("click", function () {
    const searchTerm = searchInput.value.trim()

    // Clear previous search results
    searchResults.innerHTML = ""

    if (searchTerm !== "") {
      // Simulate search results display
      const resultCount = 0 // Replace this with your actual result count logic
      const resultElement = document.createElement("p")
      resultElement.textContent = `${searchTerm}과 일치하는 결과는 ${resultCount}개 입니다.`
      searchResults.appendChild(resultElement)
    }
  })
}

export default search
