<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>제품 구매</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Styles/CSS/purchase-detail.css">

</head>
<body>
	<h1>제품 구매</h1>
	<p class="step">
		<span class="step-order">주문결제</span> > 결제완료
	</p>
	<hr class="first-hr" />


	<%
	HttpSession session1 = request.getSession();
	String userid = (String) session1.getAttribute("username");
	try {
		String selectQuery1 = "SELECT * FROM member where mid = ? ";
		PreparedStatement preparedStatement1 = conn.prepareStatement(selectQuery1);
		preparedStatement1.setString(1, userid);
		ResultSet resultSet1 = preparedStatement1.executeQuery();
	%>

	
		<%
		while (resultSet1.next()) {
			String member_Name = resultSet1.getString("mname");
			String member_Adress = resultSet1.getString("madress");
			String member_Phone = resultSet1.getString("mphone");
			// String productPriceWon = String.format("%,d 원", productPrice);
		%>
		<table>
			<caption>구매자 정보</caption>
			<thead>
				<tr>
					<td class="table-left">성함</td>
					<td class="table-right"><input type="text" id="username"
						name="username" value="<%=member_Name%>" required readonly /></td>
				</tr>
				<tr>
					<td class="table-left">주소</td>
					<td class="table-right"><input type="text" id="useradress"
						name="useradress" value="<%=member_Adress%>" required readonly /></td>
				</tr>
				<tr>
					<td class="table-left">전화번호</td>
					<td class="table-right"><input type="text" id="userphone"
						name="userphone" value="<%=member_Phone%>" required readonly /></td>
				</tr>
			</thead>
		</table>
		<%
		}
		resultSet1.close();
		preparedStatement1.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	

	<%
	try {
		String selectQuery2 = "SELECT * FROM cart where mid = ?";
		PreparedStatement preparedStatement2 = conn.prepareStatement(selectQuery2);
		preparedStatement2.setString(1, userid); // 인덱스 1로 수정    
		ResultSet resultSet2 = preparedStatement2.executeQuery();
	%>

	<%
	while (resultSet2.next()) {
		String product_Name = resultSet2.getString("pname");
		int cart_Quantity = resultSet2.getInt("cquantity");
		int product_Price = resultSet2.getInt("pprice");
		int cart_Totalprice = resultSet2.getInt("ctotalprice");
	%>

	<table>
		<caption>상품 주문 정보</caption>
		<thead>
			<tr>
				<td class="table-left">상품명</td>
				<td class="table-right"><input type="text" id="itemname"
					name="itemname" value="<%=product_Name%>" required readonly /></td>
				<td id="table_right" style="display: none"
					<%=request.getParameter("productName")%>></td>
			</tr>
			<tr>
				<td class="table-left">수량</td>
				<td class="table-right"><input type="text" id="basketquantity"
					name="basketquantity" value="<%=cart_Quantity%>" required readonly />
				</td>
				<td id="table_right" style="display: none"
					<%=request.getParameter("productQuan")%>></td>
			</tr>
			<tr>
				<td class="table-left">가격</td>
				<td class="table-right"><input type="text" id="itemprice"
					name="itemprice" value="<%=product_Price%>" required readonly /></td>
				<td id="table_right" style="display: none"
					<%=request.getParameter("productPrice")%>></td>
			</tr>
		</thead>
	</table>

	<%
	}
	resultSet2.close();
	preparedStatement2.close();
	conn.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>
	<table class="paymentmethod" style="margin-top: 100px;">
	<thead>
	<tr>
		<td class="table-left">배송 메모</td>
		<td class="table-right"><input type="text" id="otext"
			name="otext" placeholder="배송 메모를 남겨주세요." required /></td>
	</tr>

	<tr>
		<td class="table-left">결제 방법</td>
		<td class="table-right"><select id="opay" name="opay" required
			onchange="updatePaymentFields()">
				<option value="select">결제 유형 선택</option>
				<option value="credit_card">신용 카드</option>
				<option value="bank_transfer">무통장 입금</option>
		</select></td>
	</tr>
	</thead>
	</table>
	<table id="paymentTable" style="display: none">
		<caption>선택한 결제 방법s</caption>
		<tr id="creditCardFields" style="display: none">
			<td class="table-left">카드사</td>
			<td class="table-right"><select id="credit_card_company"
				name="credit_card_company" required>
					<option value="credit_card_company">롯데 카드</option>
					<option value="credit_card_company">비씨 카드</option>
					<option value="credit_card_company">삼성 카드</option>
					<option value="credit_card_company">신한 카드</option>
					<option value="credit_card_company">우리 카드</option>
					<option value="credit_card_company">케이비국민 카드</option>
					<option value="credit_card_company">하나 카드</option>
					<option value="credit_card_company">현대 카드</option>
			</select></td>
		</tr>
		<tr id="creditCardNumberFields" style="display: none">
			<td class="table-left">카드 번호</td>
			<td class="table-right"><input type="text"
				id="credit_card_number" name="credit_card_number"
				placeholder="카드번호를 입력하세요."
				oninput="this.value = this.value.replace(/[^0-9]/g, '');" /></td>
		</tr>
		<tr id="expirationDateFields" style="display: none">
			<td class="table-left">유효 기간</td>
			<td class="table-right"><input type="text" id="expiration_date"
				name="expiration_date" placeholder="MM"
				oninput="this.value = this.value.replace(/[^0-9]/g, '');" /> <span>/</span>
				<input type="text" id="expiration_date" name="expiration_date"
				placeholder="YY"
				oninput="this.value = this.value.replace(/[^0-9]/g, '');" /></td>
		</tr>
		<tr id="cvcFields" style="display: none">
			<td class="table-left">CVC</td>
			<td class="table-right"><input type="text" id="cvc" name="cvc"
				placeholder="CVC를 입력하세요."
				oninput="this.value = this.value.replace(/[^0-9]/g, '');" /></td>
		</tr>
		<tr id="bankTransferFields" style="display: none">
			<td class="table-left">입금 계좌</td>
			<td class="table-right">코사은행 1111-11-111111</td>
		</tr>
	</table>
	<hr class="last-hr" />
	<h2>위와 같이 구매하시겠습니까?</h2>
	<div class="button">
	<form class="purchase-detail" method="post" action="purchase-pro.jsp">
		<button class="purchase-button" type="submit">구매하기</button>
		<br />
	</form>
		<button class="goback-button" type="button">돌아가기</button>
	</div>

</body>
<script>
	function updatePaymentFields() {
		const selectedopay = document.getElementById("opay").value;
		const paymentTable = document.getElementById("paymentTable");

		 paymentTable.style.display = "none"; 

		if (selectedopay === "credit_card") {
			const creditCardFields = document
					.getElementById("creditCardFields");
			const creditCardNumberFields = document
					.getElementById("creditCardNumberFields");
			const expirationDateFields = document
					.getElementById("expirationDateFields");
			const cvcFields = document.getElementById("cvcFields");

			paymentTable.style.display = "table";
			creditCardFields.style.display = "table-row";
			creditCardNumberFields.style.display = "table-row";
			expirationDateFields.style.display = "table-row";
			cvcFields.style.display = "table-row";
			bankTransferFields.style.display = "none";
		} else if (selectedopay === "bank_transfer") {
			const bankTransferFields = document
					.getElementById("bankTransferFields");

			paymentTable.style.display = "table";
			bankTransferFields.style.display = "table-row";
			creditCardFields.style.display = "none";
			creditCardNumberFields.style.display = "none";
			expirationDateFields.style.display = "none";
			cvcFields.style.display = "none";
		}
	}

	function confirmPayment() {
		const selectedopay = document.getElementById("opay").value;
		const resultDiv = document.getElementById("paymentResult");

		if (selectedopay === "credit_card") {
			const creditCardNumber = document
					.getElementById("credit_card_number").value;
			const expirationDate = document.getElementById("expiration_date").value;
			const paymentResult = performCreditCardPayment(creditCardNumber,
					expirationDate);
			resultDiv.innerHTML = `결제 결과: ${paymentResult}`;
		} else if (selectedopay === "bank_transfer") {
			const bankAccountInfo = "코사은행 1111-11-111111";
			resultDiv.innerHTML = `입금 정보: ${bankAccountInfo}`;
		}
	}

	document.addEventListener("DOMContentLoaded", function() {
		updatePaymentFields();
		confirmPayment();

		const urlParams = new URLSearchParams(window.location.search);
		const productNameParam = urlParams.get("productName");

		if (productNameParam) {
			const tableRightElement = document.getElementById("table_right");
			tableRightElement.style.display = "block";
			tableRightElement.innerHTML = productNameParam;
		}
	});
</script>
</html>