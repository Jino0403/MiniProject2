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

document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 10
  const itemsContainer = document.querySelector(".item_line")
  const allItems = itemsContainer.querySelectorAll(".items")
  const totalItems = allItems.length
  const totalPages = Math.ceil(totalItems / itemsPerPage)

  const pageButtonsContainer = document.createElement("div")
  pageButtonsContainer.id = "page-buttons"
  pageButtonsContainer.style.textAlign = "center"
  pageButtonsContainer.style.margin = "20px 0"
  itemsContainer.after(pageButtonsContainer) // itemsContainer 다음에 추가

  let currentPage = 1

  function updateItemsDisplay() {
    const startIndex = (currentPage - 1) * itemsPerPage
    const endIndex = Math.min(startIndex + itemsPerPage, totalItems)

    allItems.forEach((item, index) => {
      if (index >= startIndex && index < endIndex) {
        item.style.display = "block"
      } else {
        item.style.display = "none"
      }
    })
  }

  function updatePageButtons() {
    pageButtonsContainer.innerHTML = ""

    const maxVisibleButtons = 5
    const start = Math.max(1, currentPage - Math.floor(maxVisibleButtons / 2))
    const end = Math.min(totalPages, start + maxVisibleButtons - 1)

    const firstButton = document.createElement("button")
    firstButton.textContent = "≪"
    firstButton.style.fontSize = "25px"
    firstButton.style.border = "1px solid transparent"
    firstButton.style.backgroundColor = currentPage === 1 ? "gray" : "white"
    firstButton.style.margin = "0 5px"
    firstButton.addEventListener("click", () => goToPage(1))
    firstButton.addEventListener("mouseover", () => {
      if (currentPage > 1) {
        firstButton.style.backgroundColor = "gray"
      }
    })
    firstButton.addEventListener("mouseout", () => {
      firstButton.style.backgroundColor = currentPage === 1 ? "gray" : "white"
    })
    pageButtonsContainer.appendChild(firstButton)

    const prevButton = document.createElement("button")
    prevButton.textContent = "<"
    prevButton.style.fontSize = "25px"
    prevButton.style.border = "1px solid transparent"
    prevButton.style.backgroundColor = currentPage === 1 ? "gray" : "white"
    prevButton.style.margin = "0 5px"
    prevButton.addEventListener("click", () => goToPage(currentPage - 1))
    prevButton.addEventListener("mouseover", () => {
      if (currentPage > 1) {
        prevButton.style.backgroundColor = "gray"
      }
    })
    prevButton.addEventListener("mouseout", () => {
      prevButton.style.backgroundColor = currentPage === 1 ? "gray" : "white"
    })
    pageButtonsContainer.appendChild(prevButton)

    for (let page = start; page <= end; page++) {
      const button = document.createElement("button")
      button.textContent = page
      button.style.fontSize = "25px"
      button.style.border = "1px solid transparent"
      button.style.backgroundColor = page === currentPage ? "gray" : "white"
      button.style.color = page === currentPage ? "white" : "black"
      button.style.margin = "0 5px"
      button.addEventListener("click", () => goToPage(page))
      button.addEventListener("mouseover", () => {
        button.style.borderRadius = "6px"
        button.style.backgroundColor = "gray"
        button.style.color = "white"
      })
      button.addEventListener("mouseout", () => {
        button.style.backgroundColor = page === currentPage ? "gray" : "white"
        button.style.color = "black"
      })
      pageButtonsContainer.appendChild(button)
    }

    const nextButton = document.createElement("button")
    nextButton.textContent = ">"
    nextButton.style.fontSize = "25px"
    nextButton.style.border = "1px solid transparent"
    nextButton.style.backgroundColor =
      currentPage === totalPages ? "gray" : "white"
    nextButton.style.margin = "0 5px"
    nextButton.addEventListener("click", () => goToPage(currentPage + 1))
    nextButton.addEventListener("mouseover", () => {
      if (currentPage < totalPages) {
        nextButton.style.backgroundColor = "gray"
      }
    })
    nextButton.addEventListener("mouseout", () => {
      nextButton.style.backgroundColor =
        currentPage === totalPages ? "gray" : "white"
    })
    pageButtonsContainer.appendChild(nextButton)

    const lastButton = document.createElement("button")
    lastButton.textContent = "≫"
    lastButton.style.fontSize = "25px"
    lastButton.style.border = "1px solid transparent"
    lastButton.style.backgroundColor =
      currentPage === totalPages ? "gray" : "white"
    lastButton.style.margin = "0 5px"
    lastButton.addEventListener("click", () => goToPage(totalPages))
    lastButton.addEventListener("mouseover", () => {
      if (currentPage < totalPages) {
        lastButton.style.backgroundColor = "gray"
      }
    })
    lastButton.addEventListener("mouseout", () => {
      lastButton.style.backgroundColor =
        currentPage === totalPages ? "gray" : "white"
    })
    pageButtonsContainer.appendChild(lastButton)
  }

  function goToPage(page) {
    currentPage = Math.max(1, Math.min(page, totalPages))
    updateItemsDisplay()
    updatePageButtons()
  }

  updateItemsDisplay()
  updatePageButtons()
})
