 document.addEventListener("DOMContentLoaded", function () {
      const deleteButton = document.querySelector(".delete_btn");
      const checkboxes = document.querySelectorAll("input[type='checkbox']");
      
      deleteButton.addEventListener("click", function () {
        const checkedRows = [];
        checkboxes.forEach(function (checkbox, index) {
          if (checkbox.checked) {
            checkedRows.push(checkbox.closest(".t_tr")); // Get the closest row element
          }
        });

        if (checkedRows.length > 0) {
          checkedRows.forEach(function (row) {
            row.parentNode.removeChild(row);
          });
        }
      });
    });