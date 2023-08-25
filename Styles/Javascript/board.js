const editButtons = document.querySelectorAll(".edit-button");
  editButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const row = button.parentElement.parentElement;
      const editableContent = row.querySelector(".editable-content");
      const editInput = row.querySelector(".edit-input");
      const saveButton = row.querySelector(".save-button");
      editableContent.style.display = "none";
      editInput.value = editableContent.textContent;
      editInput.style.display = "inline";
      saveButton.style.display = "inline";
      button.style.display = "none";
    });
  });

  const saveButtons = document.querySelectorAll(".save-button");
  saveButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const row = button.parentElement.parentElement;
      const editableContent = row.querySelector(".editable-content");
      const editInput = row.querySelector(".edit-input");
      const editButton = row.querySelector(".edit-button");
      editableContent.textContent = editInput.value;
      editableContent.style.display = "inline";
      editInput.style.display = "none";
      button.style.display = "none";
      editButton.style.display = "inline";
    });
  });

  const deleteButtons = document.querySelectorAll(".delete-button");
  deleteButtons.forEach((button) => {
    button.addEventListener("click", () => {
      if (confirm("정말 삭제하시겠습니까?")) {
        const row = button.parentElement.parentElement;
        row.remove();
      }
    });
  });

  const writeCommentButton = document.querySelector(".write-comment-button");
  const tableBody = document.querySelector(".board_table tbody");

  writeCommentButton.addEventListener("click", () => {
    const writerInput = document.querySelector(".writer");
    const commentInput = document.querySelector(".comment");

    if (writerInput.value && commentInput.value) {
      const newRow = document.createElement("tr");
      newRow.innerHTML = `
        <td class="board_td">dkdleldi</td>
        <td class="board_td">${writerInput.value}</td>
        <td class="board_td" colspan="2">
          <span class="editable-content">${commentInput.value}</span>
          <input type="text" class="edit-input" style="display: none" />
        </td>
        <td class="board_td_btn">
          <button class="edit-button" type="button">수정</button>
          <button class="save-button" type="button" style="display: none">완료</button>
          <button class="delete-button" type="button">삭제</button>
        </td>
      `;

      tableBody.appendChild(newRow);

      const newEditButton = newRow.querySelector(".edit-button");
      const newSaveButton = newRow.querySelector(".save-button");
      const newDeleteButton = newRow.querySelector(".delete-button");

      newEditButton.addEventListener("click", () => {
        const row = newEditButton.parentElement.parentElement;
        const editableContent = row.querySelector(".editable-content");
        const editInput = row.querySelector(".edit-input");
        const saveButton = row.querySelector(".save-button");
        editableContent.style.display = "none";
        editInput.value = editableContent.textContent;
        editInput.style.display = "inline";
        saveButton.style.display = "inline";
        newEditButton.style.display = "none";
      });

      newSaveButton.addEventListener("click", () => {
        const row = newSaveButton.parentElement.parentElement;
        const editableContent = row.querySelector(".editable-content");
        const editInput = row.querySelector(".edit-input");
        const editButton = row.querySelector(".edit-button");
        editableContent.textContent = editInput.value;
        editableContent.style.display = "inline";
        editInput.style.display = "none";
        newSaveButton.style.display = "none";
        editButton.style.display = "inline";
      });

      newDeleteButton.addEventListener("click", () => {
        if (confirm("정말 삭제하시겠습니까?")) {
          const row = newDeleteButton.parentElement.parentElement;
          row.remove();
        }
      });

      writerInput.value = "";
      commentInput.value = "";
    }
  });