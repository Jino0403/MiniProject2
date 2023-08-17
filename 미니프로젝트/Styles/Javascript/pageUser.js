document.addEventListener("DOMContentLoaded", function () {
  const itemsPerPage = 9
  const tableBody = document.querySelector(".user_table tbody")
  const paginationContainer = document.querySelector("#pagination-container")

  const totalItems = tableBody.querySelectorAll("tr.t_tr").length

  const totalPages = Math.ceil(totalItems / itemsPerPage)

  for (let i = 1; i <= totalPages; i++) {
    const userButton = document.createElement("button")
    userButton.textContent = i
    userButton.addEventListener("click", () => showPage(i))
    paginationContainer.appendChild(userButton)
    paginationContainer.style.margin = "40px auto 20px auto"
    paginationContainer.style.display = "flex"
    paginationContainer.style.justifyContent = "center"
    paginationContainer.style.alignItems = "center"

    userButton.style.padding = "8px"
    userButton.style.margin = "5px"
    userButton.style.border = "1px solid gray"
    userButton.style.borderRadius = "6px"
    userButton.style.backgroundColor = "white"
    userButton.style.boxShadow = "0 0 1px"
    userButton.style.fontSize = "18px"
    userButton.style.color = "black"
    userButton.style.userSelect = "none"
  }

  function showPage(pageNumber) {
    const startIndex = (pageNumber - 1) * itemsPerPage
    const endIndex = startIndex + itemsPerPage

    const rows = tableBody.querySelectorAll("tr.t_tr")
    for (let i = 0; i < rows.length; i++) {
      if (i >= startIndex && i < endIndex) {
        rows[i].style.display = "table-row"
        const firstCell = rows[i].querySelector("td:first-child")
        firstCell.style.marginTop = "10px"
      } else {
        rows[i].style.display = "none"
        const firstCell = rows[i].querySelector("td:first-child")
        firstCell.style.marginTop = "0"
      }
    }
  }

  showPage(1)

  function showPage(pageNumber) {
    const startIndex = (pageNumber - 1) * itemsPerPage
    const endIndex = startIndex + itemsPerPage

    const rows = tableBody.querySelectorAll("tr.t_tr")
    for (let i = 0; i < rows.length; i++) {
      if (i >= startIndex && i < endIndex) {
        rows[i].style.display = "table-row"
        const firstCell = rows[i].querySelector("td:first-child")
        firstCell.style.marginTop = "10px"
      } else {
        rows[i].style.display = "none"
        const firstCell = rows[i].querySelector("td:first-child")
        firstCell.style.marginTop = "0"
      }
    }
  }
})