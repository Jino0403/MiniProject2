document.addEventListener("DOMContentLoaded", function () {
  const tableBody = document.querySelector(".basket_table tbody")

  tableBody.addEventListener("input", function (event) {
    const target = event.target
    if (target.classList.contains("basket_quantity")) {
      const row = target.closest(".t_tr")
      const priceCell = row.querySelector(".basket_proPrice")
      const totalPriceCell = row.querySelector("td.basket_total")

      updateTotal(row, priceCell, target, totalPriceCell)
      updateOverallTotal()
    }
  })

  function updateTotal(row, priceCell, quantityInput, totalPriceCell) {
    const price = parseFloat(priceCell.textContent.replace(/,/g, ""))
    const quantity = parseInt(quantityInput.value)
    const total = price * quantity

    totalPriceCell.textContent = total.toLocaleString() + "원"
  }

  function updateOverallTotal() {
    const totalCells = document.querySelectorAll("td.basket_total")
    let overallTotal = 0

    if (totalCells === null) {
      td.basket_total = 0
    }

    totalCells.forEach((cell) => {
      const total = parseInt(cell.textContent.replace(/\D/g, ""))
      overallTotal += total
    })

    const totalPriceDiv = document.getElementById("totalPrice")
    totalPriceDiv.textContent =
      "총 주문금액: " + overallTotal.toLocaleString() + "원"
  }

  updateOverallTotal()
})
