document.addEventListener("DOMContentLoaded", function () {
  // Get reference to the button
  const deleteButton = document.querySelector(".manage_btn_delete");

  // Add click event listener to the button
  deleteButton.addEventListener("click", function () {
    // Get all the checkboxes in the table
    const checkboxes = document.querySelectorAll(".order_table input[type='checkbox']");

    // Loop through the checkboxes
    checkboxes.forEach(function (checkbox) {
      if (checkbox.checked) {
        // Get the parent row and remove it
        const row = checkbox.closest(".t_tr");
        if (row) {
          row.remove();
        }
      }
    });
  });
});