document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 10
  const tableBody = document.querySelector(".basket_table tbody")
  const paginationContainer = document.querySelector("#pagination-container")

  const totalItems = tableBody.querySelectorAll("tr").length
  const totalPages = Math.ceil(totalItems / itemsPerPage)

  paginationContainer.style.display = "flex"
  paginationContainer.style.justifyContent = "center"
  paginationContainer.style.alignItems = "center"
  paginationContainer.style.margin = "30px auto 10px auto"

  for (let i = 1; i <= totalPages; i++) {
    const basketButton = document.createElement("button")
    basketButton.textContent = i
    basketButton.style.padding = "8px"
    basketButton.style.margin = "5px"
    basketButton.style.border = "1px solid gray"
    basketButton.style.borderRadius = "6px"
    basketButton.style.backgroundColor = "white"
    basketButton.style.boxShadow = "0 0 1px"
    basketButton.style.fontSize = "18px"
    basketButton.style.color = "black"
    basketButton.style.userSelect = "none"

    basketButton.addEventListener(
      "click",
      (function (pageNumber) {
        return function () {
          showPage(pageNumber)
        }
      })(i)
    )

    paginationContainer.appendChild(basketButton)
  }

  showPage(1)

  function showPage(pageNumber) {
    const startIndex = (pageNumber - 1) * itemsPerPage
    const endIndex = startIndex + itemsPerPage

    const rows = tableBody.querySelectorAll("tr.t_tr")
    rows.forEach((row, i) => {
      if (i >= startIndex && i < endIndex) {
        row.style.display = "table-row"
      } else {
        row.style.display = "none"
      }
    })
  }
})
