document.addEventListener("DOMContentLoaded", function () {
  const editButtons = document.querySelectorAll(".basket_edit_btn")
  const quantityInputs = document.querySelectorAll(".basket_quantity")

  editButtons.forEach((button, index) => {
    button.addEventListener("click", () => {
      if (quantityInputs[index].hasAttribute("readonly")) {
        // Remove the readonly attribute from all quantityInputs
        quantityInputs.forEach((input) => input.removeAttribute("readonly"))

        button.innerText = "완료하기"
      } else {
        // Set the readonly attribute back to all quantityInputs
        quantityInputs.forEach((input) => input.setAttribute("readonly", true))

        button.innerText = "수정하기"
      }
    })
  })
})
