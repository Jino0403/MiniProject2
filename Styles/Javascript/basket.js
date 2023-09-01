document.addEventListener("DOMContentLoaded", function () {
  const editButtons = document.querySelectorAll(".basket_edit_btn");
  const quantityInputs = document.querySelectorAll(".basket_quantity");
    const checkboxes = document.querySelectorAll(".cartCheckBox");
    const hiddenInput = document.getElementById("productNum");

    let selectedProduct = null;

    checkboxes.forEach(checkbox => {
      checkbox.addEventListener("change", function () {
        const cartNumber = this.value;

        if (this.checked) {
          if (selectedProduct !== null && selectedProduct !== cartNumber) {
            // 이미 다른 상품이 선택된 경우, 체크를 해제하고 선택한 상품으로 업데이트
            const previousCheckbox = document.querySelector(`.cartCheckBox[value="${selectedProduct}"]`);
            previousCheckbox.checked = false;
          }

          selectedProduct = cartNumber;
        } else if (selectedProduct === cartNumber) {
          selectedProduct = null;
        }

        updateHiddenInputValue();
      });
    });

    function updateHiddenInputValue() {
      hiddenInput.value = selectedProduct || "";
    }
  editButtons.forEach((button, index) => {
    button.addEventListener("click", () => {
      if (quantityInputs[index].hasAttribute("readonly")) {
        // Remove the readonly attribute from all quantityInputs
        quantityInputs.forEach(input => input.removeAttribute("readonly"));
        button.innerText = "완료하기";
      } else {
        // Set the readonly attribute back to all quantityInputs
        quantityInputs.forEach(input => input.setAttribute("readonly", true));
        button.innerText = "수정하기";
      }
    });
  });
  });


