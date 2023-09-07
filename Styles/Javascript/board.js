function buttonOpen(commentNumber) {
   let editButton = document.getElementById('edit-button-' + commentNumber);
   let saveButton = document.getElementById('save-button-' + commentNumber);
   let commentText = document.getElementById('commentText-' + commentNumber);
   let commentTextReturn = document.getElementById("commentText-return-" + commentNumber);


   editButton.style.display = "none";
   editButton.style.padding = "4px";
   editButton.style.border = "1px solid transparent";
   editButton.style.fontSize = "20px";
   editButton.style.cursor = "pointer";
   saveButton.style.display = "block";
   commentText.readOnly = false;
   commentText.style.border = "1px solid black";

   commentTextReturn.value = commentText.value;
}

function buttonComplete(commentNumber) {
   let editButton = document.getElementById('edit-button-' + commentNumber);
   let saveButton = document.getElementById('save-button-' + commentNumber);
   let commentText = document.getElementById('commentText-' + commentNumber);
   let commentTextReturn = document.getElementById("commentText-return-" + commentNumber);

   editButton.style.display = "block";
   saveButton.style.display = "none";
   commentText.readOnly = true;

   commentTextReturn.value = commentText.value;


}