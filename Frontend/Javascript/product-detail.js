const decrementButton = document.getElementById("decrement");
const incrementButton = document.getElementById("increment");
const quantitySpan = document.getElementById("quantity");

let quantity = 0;

decrementButton.addEventListener("click", () => {
  if (quantity > 0) {
    quantity--;
    quantitySpan.textContent = quantity;
  }
});

incrementButton.addEventListener("click", () => {
  quantity++;
  quantitySpan.textContent = quantity;
});
