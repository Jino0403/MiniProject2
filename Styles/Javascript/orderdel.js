document.addEventListener("DOMContentLoaded", function () {
          // Get reference to the button
          const deleteButton = document.querySelector(".manage_btn_delete");

          // Add click event listener to the button
          deleteButton.addEventListener("click", function () {
            // Get all the checkboxes in the table
            const checkboxes = document.querySelectorAll(".order_table input[type='checkbox']");

            // Initialize an array to store selected order numbers
            const selectedOrders = [];

            // Loop through the checkboxes
            checkboxes.forEach(function (checkbox) {
              if (checkbox.checked) {
                // Get the order number from the checkbox's value attribute
                const orderNumber = checkbox.value;
                selectedOrders.push(orderNumber);
              }
            });

            // Update the value of delselectedOrders with the selected order numbers
            const delselectedOrdersInput = document.getElementById("delselectedOrders");
            delselectedOrdersInput.value = selectedOrders.join(",");
          });
        });