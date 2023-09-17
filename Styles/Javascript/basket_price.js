/*
document.addEventListener("DOMContentLoaded", function () {
  updateOverallTotal();
});
const quantityInputs = document.querySelectorAll(".basket_quantity input");
quantityInputs.forEach((input) => {
  input.addEventListener("input", function () {
    const row = input.closest("tr");
    updateTotal(row);
    updateOverallTotal();
  });
});

function updateTotal(row) {
  let priceInput = row.querySelector(".basket_proPrice input");
  let quantityInput = row.querySelector(".basket_quantity input");
  let basketTotal = row.querySelector(".basketTotal input");

  let price = parseFloat(priceInput.value);
  let quantity = parseInt(quantityInput.value);
  let total = price * quantity;
  updateTotal();
  basketTotal.value = total.toLocaleString() + " 원";
}

function updateOverallTotal() {
  const totalCells = document.querySelectorAll(".basket_total input");
  let overallTotal = 0;

  totalCells.forEach((input) => {
    const basketTotal = parseFloat(input.value.replace(/[^\d.]/g, ""));
    overallTotal += basketTotal;
  });

  const totalPriceDiv = document.getElementById("totalPrice");
  totalPriceDiv.textContent = "총 주문금액 : " + overallTotal.toLocaleString() + " 원";
  updateOverallTotal();
}*/

// HTML에서 받아온 데이터를 기반으로 총 가격 계산 및 입력
// 여러 상품에 대한 계산을 위한 함수
// HTML에서 받아온 데이터를 기반으로 총 가격 계산 및 입력
function addCommasToNumber(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

document.addEventListener("DOMContentLoaded", function () {
    // 장바구니 항목의 각 요소를 선택합니다.
    const productPrices = document.querySelectorAll(".productprice");
    const productPricesR = document.querySelectorAll(".productpriceR");
    const quantities = document.querySelectorAll(".basket_quantity");
    const totalPrices = document.querySelectorAll(".baksetTotal");
    const result = document.getElementById("totalPrice");
    const returnResult = document.getElementById("ctotalPrice");

    let resultTotal = 0;

    // 초기 로딩 시 총 가격을 계산하고 업데이트합니다.
    for (let i = 0; i < productPrices.length; i++) {
        calculateTotalPrice(i);
    }

    // 총 가격을 계산하고 입력합니다.
    function calculateTotalPrice(index) {
        const price = parseFloat(productPrices[index].value); // 상품 가격 가져오기
        const quantity = parseInt(quantities[index].value, 10); // 수량 가져오기
        const total = price * quantity; // 총 가격 계산
        totalPrices[index].value = addCommasToNumber(total) + "원"; // 총 가격 입력 (포맷팅)
        productPricesR[index].value = addCommasToNumber(price) + "원"; // 총 가격 입력 (포맷팅)

        resultTotal += total;
    }
    returnResult.value = resultTotal.value
    result.textContent = "총 주문금액 : " + addCommasToNumber(resultTotal) + "원";
});









