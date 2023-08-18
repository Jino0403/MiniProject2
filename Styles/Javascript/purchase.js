function updatePaymentFields() {
  const selectedPaymentMethod = document.getElementById("payment_method").value;
  const creditCardFields = document.getElementById("creditCardFields");
  const creditCardNumberFields = document.getElementById(
    "creditCardNumberFields"
  );
  const expirationDateFields = document.getElementById("expirationDateFields");
  const cvcFields = document.getElementById("cvcFields");
  const bankTransferFields = document.getElementById("bankTransferFields");
  const paymentTable = document.getElementById("paymentTable");

  if (selectedPaymentMethod === "credit_card") {
    paymentTable.style.display = "table";
    creditCardFields.style.display = "table-row";
    creditCardNumberFields.style.display = "table-row";
    expirationDateFields.style.display = "table-row";
    cvcFields.style.display = "table-row";
    bankTransferFields.style.display = "none";
  } else if (selectedPaymentMethod === "bank_transfer") {
    paymentTable.style.display = "table";
    bankTransferFields.style.display = "table-row";
    creditCardFields.style.display = "none";
    creditCardNumberFields.style.display = "none";
    expirationDateFields.style.display = "none";
    cvcFields.style.display = "none";
  } else if (selectedPaymentMethod === "select") {
    paymentTable.style.display = "none";
  }
}
function goBack() {
  window.history.back();
}

function confirmPayment() {
  const selectedPaymentMethod = document.getElementById("payment_method").value;
  const resultDiv = document.getElementById("paymentResult");

  if (selectedPaymentMethod === "credit_card") {
    const creditCardNumber =
      document.getElementById("credit_card_number").value;
    const expirationDate = document.getElementById("expiration_date").value;
    const paymentResult = performCreditCardPayment(
      creditCardNumber,
      expirationDate
    );
    resultDiv.innerHTML = `결제 결과: ${paymentResult}`;
  } else if (selectedPaymentMethod === "bank_transfer") {
    const bankAccountInfo = "코사은행 1111-11-111111";
    resultDiv.innerHTML = `입금 정보: ${bankAccountInfo}`;
  }
}
document.addEventListener("DOMContentLoaded", function () {
  showSelectedPaymentFields();
  goBack();
  confirmPayment();
});
