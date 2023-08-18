document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 10
  const totalItems = 14
  const totalPages = Math.ceil(totalItems / itemsPerPage)
  const pageButtonsContainer = document.getElementById("page-buttons")
  const itemsContainer = document.querySelector(".item_line")
  const allItems = itemsContainer.querySelectorAll(".items")

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
    firstButton.textContent = "«"
    firstButton.addEventListener("click", () => goToPage(1))
    pageButtonsContainer.appendChild(firstButton)

    const prevButton = document.createElement("button")
    prevButton.textContent = "〈"
    prevButton.addEventListener("click", () => goToPage(currentPage - 1))
    pageButtonsContainer.appendChild(prevButton)

    for (let page = start; page <= end; page++) {
      const button = document.createElement("button")
      button.textContent = page
      button.addEventListener("click", () => goToPage(page))
      if (page === currentPage) {
        button.classList.add("active")
        button.style.backgroundColor = "black"
      }
      pageButtonsContainer.appendChild(button)
    }

    const nextButton = document.createElement("button")
    nextButton.textContent = "〉"
    nextButton.addEventListener("click", () => goToPage(currentPage + 1))
    pageButtonsContainer.appendChild(nextButton)

    const lastButton = document.createElement("button")
    lastButton.textContent = "»"
    lastButton.addEventListener("click", () => goToPage(totalPages))
    pageButtonsContainer.appendChild(lastButton)
  }

  function goToPage(page) {
    currentPage = Math.max(1, Math.min(page, totalPages)) // 페이지 범위 제한
    updateItemsDisplay()
    updatePageButtons()
  }

  updateItemsDisplay()
  updatePageButtons()
})
