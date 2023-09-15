document.addEventListener("DOMContentLoaded", function () {
  const editButtons = document.querySelectorAll(".basket_edit_btn");
  const quantityInputs = document.querySelectorAll(".basket_quantity");
  const checkboxes = document.querySelectorAll(".cartCheckBox");
  const hiddenInput = document.getElementById("productNum");
  const returnquantity = document.getElementById("productQuantity-return");

  let selectedProduct = null;
  let originalQuantity = null;

  checkboxes.forEach(checkbox => {
    checkbox.addEventListener("change", function () {
      const cartNumber = this.value;
      const cquantityInput = document.getElementById(`cquantity-${cartNumber}`);
      const quantityInput = document.querySelector(`#cquantity-${cartNumber}`); // 수정: querySelector로 변경

      if (this.checked) {
        // 이미 다른 체크박스가 선택된 경우, 체크를 해제합니다.
        if (selectedProduct !== null && selectedProduct !== cartNumber) {
          const previousCheckbox = document.querySelector(`.cartCheckBox[value="${selectedProduct}"]`);
          previousCheckbox.checked = false;
          const previousCquantityInput = document.getElementById(`cquantity-${selectedProduct}`);
          previousCquantityInput.setAttribute('readonly', true);
          const previousQuantityInput = document.querySelector(`#cquantity-${selectedProduct}`); // 수정: querySelector로 변경
          previousQuantityInput.setAttribute('readonly', true);
        }

        selectedProduct = cartNumber;
        originalQuantity = quantityInputs.value;
        returnquantity.value = originalQuantity;

        // cquantity input의 readonly 속성 제거

      } else if (selectedProduct === cartNumber) {
        selectedProduct = null;
        originalQuantity = null;
        returnquantity.value = "";
        cquantityInput.setAttribute('readonly', true);
        quantityInput.setAttribute('readonly', true);
      }

      updateHiddenInputValue();
    });
  });

  // 수량 입력 필드의 값을 실시간으로 업데이트
  quantityInputs.forEach((input, index) => {
    input.addEventListener("input", function () {
      if (selectedProduct !== null) {
        returnquantity.value = this.value;
      }
    });
  });

  function updateHiddenInputValue() {
    hiddenInput.value = selectedProduct || "";
    if (!selectedProduct) {
      returnquantity.value = "";
    }
  }
});