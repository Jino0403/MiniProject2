document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 6 // Number of items to show per page
  const totalItems = document.querySelectorAll(".t_tr").length // Total number of items

  const totalPages = Math.ceil(totalItems / itemsPerPage) // Calculate total number of pages

  const paginationContainer = document.getElementById("pagination-container")

  for (let page = 1; page <= totalPages; page++) {
    const button = document.createElement("button")
    button.textContent = page
    button.addEventListener("click", () => showPage(page))
    paginationContainer.appendChild(button)
    paginationContainer.style.border = "1px solid black"
    paginationContainer.style.display = "flex"
    paginationContainer.style.justifyContent = "center"
    paginationContainer.style.alignItems = "center"
    paginationContainer.style.margin = "15px auto 0 auto"

    button.style.padding = "8px"
    button.style.margin = "5px"
    button.style.backgroundColor = "black"
    button.style.borderRadius = "6px"
    button.style.fontSize = "18px"
    button.style.color = "white"
  }

  function showPage(pageNumber) {
    const items = document.querySelectorAll(".t_tr")

    items.forEach((item, index) => {
      if (
        index >= (pageNumber - 1) * itemsPerPage &&
        index < pageNumber * itemsPerPage
      ) {
        item.style.display = "table-row"
      } else {
        item.style.display = "none"
      }
    })
  }

  // Show the first page initially
  showPage(1)
})
