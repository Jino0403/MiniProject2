const decrementButton = document.getElementById("decrement");
const incrementButton = document.getElementById("increment");
const quantitySpan = document.getElementById("quantity");
let quantitySend = document.getElementById("productQuan");

let quantity = 1;

decrementButton.addEventListener("click", () => {
  if (quantity > 1) {
    quantity--;
    quantitySpan.textContent = quantity;
    quantitySend.value = quantity;
  }
});

incrementButton.addEventListener("click", () => {
  quantity++;
  quantitySpan.textContent = quantity;
  quantitySend.value = quantity;
});


