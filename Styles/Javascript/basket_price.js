document.addEventListener("DOMContentLoaded", function () {
  const tableBody = document.querySelector(".basket_table tbody")
  tableBody.addEventListener("input", function (event) {
    const target = event.target;
    if (target.classList.contains("basket_quantity")) {
      const row = target.closest(".t_tr")
      const priceInput = row.querySelector(".basket_proPrice")
      const totalPriceCell = row.querySelector("td.basket_total")

      updateTotal(row, priceInput, target, totalPriceCell);
      updateOverallTotal();
    }
  });

  function updateTotal(row, priceInput, quantityInput, totalPriceCell) {
    const price = parseFloat(priceInput.querySelector("input").value.replace(/[^0-9.-]+/g, ""));
    const quantity = parseInt(quantityInput.value);
    const total = price * quantity;
	/*console.log('totalPriceCell');*/
    totalPriceCell.textContent = total.toLocaleString() + "원";
  }

  function updateOverallTotal() {
    const totalCells = document.querySelectorAll("td.basket_total");
    let overallTotal = 0;

    if (totalCells.length === 0) {
      overallTotal = 0;
    }else{
    totalCells.forEach((cell) => {
      const total = parseFloat(cell.textContent.replace(/[^\d.]/g, ""));
      overallTotal += total;
    /*console.log('overallTotal');*/
    });
}
    const totalPriceDiv = document.getElementById("totalPrice")
    totalPriceDiv.textContent =
      "총 주문금액: " + overallTotal.toLocaleString() + "원";
  }

  updateOverallTotal();
});