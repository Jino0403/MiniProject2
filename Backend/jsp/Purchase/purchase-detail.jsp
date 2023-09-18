<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.ArrayList" %>
<%@ include file="../conn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	HttpSession session1 = request.getSession();
	String userid = (String) session1.getAttribute("username");
%>

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
	try {
		String selectQuery1 = "SELECT * FROM member where mid = ? ";
		PreparedStatement preparedStatement1 = conn.prepareStatement(selectQuery1);
		preparedStatement1.setString(1, userid);
		ResultSet resultSet1 = preparedStatement1.executeQuery();

		while (resultSet1.next()) {
			String memberName = resultSet1.getString("mname");
			String memberAdress = resultSet1.getString("madress");
			String memberPhone = resultSet1.getString("mphone");
%>
<table>
	<caption>구매자 정보</caption>
	<thead>
	<tr>
		<td class="table-left">성함</td>
		<td class="table-right"><%=memberName%></td>
	</tr>
	<tr>
		<td class="table-left">주소</td>
		<td class="table-right"><%=memberAdress%></td>
	</tr>
	<tr>
		<td class="table-left">전화번호</td>
		<td class="table-right"><%=memberPhone%></td>
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

		while (resultSet2.next()) {
			int productNumber = resultSet2.getInt("pno");
			int cartNumber = resultSet2.getInt("cno");
			String productName = resultSet2.getString("pname");
			int cartQuantity = resultSet2.getInt("cquantity");
			int productPrice = resultSet2.getInt("pprice");
			int cartTotalprice = resultSet2.getInt("ctotalprice");
			String productPriceWon = String.format("%,d 원", productPrice);
			String productTotalPriceWon = String.format("%,d 원", cartTotalprice);
%>

<table>
	<caption>상품 주문 정보</caption>
	<thead>
	<tr>
		<td class="table-left">상품명</td>
		<td class="table-right"><%=productName%></td>
	</tr>
	<tr>
		<td class="table-left">수량</td>
		<td class="table-right"><%=cartQuantity%>
		</td>
	</tr>
	<tr>
		<td class="table-left">가격</td>
		<td class="table-right"><%=productPrice %></td>
	</tr>
	<tr>
		<td class="table-left">총 가격</td>
		<td class="table-right"><%=cartTotalprice%></td>
	</tr>
	</thead>
</table>
<%
		}
		resultSet2.close();
		preparedStatement2.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<form class="purchase-detail" method="post" action="purchase-pro.jsp">
	<table class="paymentmethod" style="margin-top: 100px;">
		<thead>

		<tr>
			<td class="table-left">배송 메모</td>
			<td class="table-right"><input type="text"
										   name="otext" placeholder="배송 메모를 남겨주세요." required /></td>
		</tr>

		<tr>
			<td class="table-left">결제 방법</td>
			<td class="table-right">
				<select id="opay" name="opay" required
						onchange="updatePaymentFields()">
					<option  value="select">결제 유형 선택</option>
					<option value="credit_card">신용 카드</option>
					<option value="bank_transfer">무통장 입금</option>
				</select>
			</td>
		</tr>
		</thead>
	</table>
	<table id="paymentTable" style="display: none">
		<caption>선택한 결제 방법</caption>
		<tr id="creditCardFields" style="display: none">
			<td class="table-left">카드사</td>
			<td class="table-right">
				<select id="credit_card_company"
						name="credit_card_company" required>
					<option value="credit_card_company">롯데 카드</option>
					<option value="credit_card_company">비씨 카드</option>
					<option value="credit_card_company">삼성 카드</option>
					<option value="credit_card_company">신한 카드</option>
					<option value="credit_card_company">우리 카드</option>
					<option value="credit_card_company">케이비국민 카드</option>
					<option value="credit_card_company">하나 카드</option>
					<option value="credit_card_company">현대 카드</option>
				</select>
			</td>
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

	<h2>위와 같이 구매하시겠습니까?</h2>
	<%
		try {
			String selectQuery3 = "SELECT * FROM member JOIN cart ON member.mid = cart.mid where member.mid = ? ";
			PreparedStatement preparedStatement3 = conn.prepareStatement(selectQuery3);
			preparedStatement3.setString(1, userid);
			ResultSet resultSet3 = preparedStatement3.executeQuery();

			ArrayList<String> memberNames = new ArrayList<String>();
			ArrayList<String> memberAddresses = new ArrayList<String>();
			ArrayList<String> memberPhones = new ArrayList<String>();
			ArrayList<Integer> productNumbers = new ArrayList<Integer>();
			ArrayList<Integer> cartNumbers = new ArrayList<Integer>();
			ArrayList<String> productNames = new ArrayList<String>();
			ArrayList<Integer> cartQuantities = new ArrayList<Integer>();
			ArrayList<Integer> productPrices = new ArrayList<Integer>();
			ArrayList<Integer> cartTotalPrices = new ArrayList<Integer>();

			while (resultSet3.next()) {
				memberNames.add(resultSet3.getString("mname"));
				memberAddresses.add(resultSet3.getString("madress"));
				memberPhones.add(resultSet3.getString("mphone"));
				productNumbers.add(resultSet3.getInt("pno"));
				cartNumbers.add(resultSet3.getInt("cno"));
				productNames.add(resultSet3.getString("pname"));
				cartQuantities.add(resultSet3.getInt("cquantity"));
				productPrices.add(resultSet3.getInt("pprice"));
				cartTotalPrices.add(resultSet3.getInt("ctotalprice"));

	%>

	<div class="button">
			<%
//        for (int i = 0; i < productNumbers.size(); i++) {
        %>
<%--		<input type="hidden" name="memberName" value="<%=memberNames.get(i)%>"/>--%>
<%--		<input type="hidden" name="memberAddress" value="<%=memberAddresses.get(i)%>"/>--%>
<%--		<input type="hidden" name="memberPhone" value="<%=memberPhones.get(i)%>"/>--%>
<%--		<input type="hidden" name="productName" value="<%=productNames.get(i)%>" />--%>
<%--		<input type="hidden" name="cartQuantity" value="<%=cartQuantities.get(i) %>"/>--%>
<%--		<input type="hidden" name="productPrice" value="<%=productPrices.get(i) %>"/>--%>
<%--		<input type="hidden" name="productNumber" value="<%=productNumbers.get(i)%>"/>--%>
<%--		<input type="hidden" name="cartNumber" value="<%=cartNumbers.get(i)%>"/>--%>
		<input type="hidden" name="productprice" value="" />
		<input type="hidden" name="ctotalprice" value=""/>
		<input type="hidden" name="otext" value="" />
		<input type="hidden" name="opay" id="opay" value="" />
			<%
			}
			resultSet3.close();
			preparedStatement3.close();
		} catch (Exception e) {
			e.printStackTrace();
		} %>
		<button class="purchase-button" type="submit">구매하기</button>
		<button class="goback-button" type="button"><a href="../User/basket.jsp">돌아가기</a></button>
</div>

</form>


	
	


</body>
<script>
	const bankTransferFields = document.getElementById("bankTransferFields");

	function updatePaymentFields() {
		const selectedopay = document.getElementById("opay").value;
		const paymentTable = document.getElementById("paymentTable");
		const creditCardFields = document.getElementById("creditCardFields");
		const creditCardNumberFields = document.getElementById("creditCardNumberFields");
		const expirationDateFields = document.getElementById("expirationDateFields");
		const cvcFields = document.getElementById("cvcFields");

		paymentTable.style.display = "none";
		creditCardFields.style.display = "none";
		creditCardNumberFields.style.display = "none";
		expirationDateFields.style.display = "none";
		cvcFields.style.display = "none";
		bankTransferFields.style.display = "none";

		if (selectedopay === "credit_card") {
			paymentTable.style.display = "table";
			creditCardFields.style.display = "table-row";
			creditCardNumberFields.style.display = "table-row";
			expirationDateFields.style.display = "table-row";
			cvcFields.style.display = "table-row";
		} else if (selectedopay === "bank_transfer") {
			paymentTable.style.display = "table";
			bankTransferFields.style.display = "table-row";
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
</script>

</html>