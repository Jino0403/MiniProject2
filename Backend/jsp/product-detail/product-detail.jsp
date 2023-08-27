<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ include file="../conn.jsp" %>
<%
    int searchId = Integer.parseInt(request.getParameter("alcoholid"));
    HttpSession session1 = request.getSession();
    String userid = (String) session1.getAttribute("username");
    try {
        String selectQuery = "SELECT * FROM product where pno = ? ";
        PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
        preparedStatement.setInt(1, searchId);
        ResultSet resultSet = preparedStatement.executeQuery();
%>
<%
	try {
		String selectQuery = "SELECT * FROM reply";
		PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
		Resultset resultSet = preparedStatement.executeQuery();
		
%>

<%
	try {
		String selectQuery = "SELECT * FROM member";
		PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
		Resultset resultSet = preparedStatement.executeQuery();
		
%>

<%
	try {
		String selectQuery = "SELECT * FROM border";
		PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
		Resultset resultSet = preparedStatement.executeQuery();
		
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>카테고리 > 맥주</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Styles/CSS/product-detail.css" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/Styles/CSS/style.css" />
<script
	src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
<script
	src="${pageContext.request.contextPath}/Styles/Javascript/product-detail.js"
	defer></script>
<script
	src="${pageContext.request.contextPath}/Styles/Javascript/board.js"
	defer></script>
</head>
<body>
	<div id="wrapper">
		<header><jsp:include page="../Main/header.jsp" /></header>
		<nav><jsp:include page="../Main/nav.jsp" /></nav>
		<main>
			<%
			while (resultSet.next()) {
				int productNumber = resultSet.getInt("pno");
				String productName = resultSet.getString("pname");
				String productCategory = resultSet.getString("pcategory");
				int productPrice = resultSet.getInt("pprice");
				int productQuantity = resultSet.getInt("pquantity");
				int productMl = resultSet.getInt("pml");
				double productAlcohol = resultSet.getDouble("palcohol");
				String productCountry = resultSet.getString("pcountry");
				String productText = resultSet.getString("ptext");
				String productUrl = resultSet.getString("purl");
				String productCharge = resultSet.getString("mid");
				String productPriceWon = String.format("%,d 원", productPrice);
			%>
			<div class="product-first">
				<img class="main-img"
					src="${pageContext.request.contextPath}<%=productUrl%>" />
				<div class="product-buy">
					<h1 class="product-main-title"><%=productName%></h1>
					<hr class="first-hr" />

					<h2><%=productPriceWon%></h2>

					<div class="product-select">
						<div class="count-button">
							<h3>수량</h3>
							<button id="decrement">-</button>
							<span id="quantity">1</span>
							<button id="increment">+</button>
						</div>
						<div class="product-buy-button">
							 <form action="cartpro.jsp" method="post">
                            <input type="hidden" value="<%=searchId%>" id="productNo" name="productNo"/>
                            <input type="hidden" value="<%=userid%>" id="memberId" name="memberId"/>
                            <input type="hidden" value="1" id="productQuan" name="productQuan"/>
                            <button
                                    class="basket-button"
                                    type="submit">
                                장바구니에 담기
                            </button>
                        </form>
						</div>
					</div>
				</div>
			</div>

			<hr />

			<h2 class="recommend-comment">곁들이면 찰떡궁합인 안주 추천</h2>
			<div class="product-second">
				<div class="product-line">
					
						<%
						}
						resultSet.close();
						preparedStatement.close();

						String selectQuery2 = "SELECT * FROM product where pdiv = 2 order by RAND() LIMIT 5";
						PreparedStatement preparedStatement2 = conn.prepareStatement(selectQuery2);
						ResultSet resultSet2 = preparedStatement2.executeQuery();

						while (resultSet2.next()) {
						int productNumber2 = resultSet2.getInt("pno");
						String productName2 = resultSet2.getString("pname");
						int productPrice2 = resultSet2.getInt("pprice");
						String productUrl2 = resultSet2.getString("purl");
						String productPriceWon2 = String.format("%,d 원", productPrice2);
						%>
						<div class="second-line">
						<div class="product-recommend-image">
							<img class="recommed-with-product"
								src="${pageContext.request.contextPath}<%=productUrl2%>" />
						</div>
						<h5><%=productName2%></h5>
						<p><%=productPriceWon2%></p>
						</div>
						<%
						}
						resultSet2.close();
						preparedStatement2.close();
						%>
					

				</div>
			</div>
			<hr />
			<div class="product-third"></div>
			<table>
				<caption>주류 정보</caption>
				<thead>
					<tr>
						<th class="table-top">술 종류</th>
						<th class="table-top">알코올 도수</th>
						<th class="table-top">원산지</th>
						<th class="table-top">용량</th>
					</tr>
					<%
					String selectQuery3 = "SELECT * FROM product where pno = ? ";
					PreparedStatement preparedStatement3 = conn.prepareStatement(selectQuery3);
					preparedStatement3.setInt(1, searchId);
					ResultSet resultSet3 = preparedStatement3.executeQuery();

					while (resultSet3.next()) {
						int productNumber = resultSet3.getInt("pno");
						String productName = resultSet3.getString("pname");
						String productCategory = resultSet3.getString("pcategory");
						int productPrice = resultSet3.getInt("pprice");
						int productQuantity = resultSet3.getInt("pquantity");
						int productMl = resultSet3.getInt("pml");
						double productAlcohol = resultSet3.getDouble("palcohol");
						String productCountry = resultSet3.getString("pcountry");
						String productText = resultSet3.getString("ptext");
						String productUrl = resultSet3.getString("purl");
						String productCharge = resultSet3.getString("mid");
						String productPriceWon = String.format("%,d 원", productPrice);
					%>
					<tr>
						<th class="table-bottom"><%=productCategory%></th>
						<th class="table-bottom"><%=productAlcohol%> %</th>
						<th class="table-bottom"><%=productCountry%></th>
						<th class="table-bottom"><%=productMl%> ml</th>
					</tr>
				</thead>
			</table>
			<img src="" alt="이미지" /> <img class="seviece-information"
				src="${pageContext.request.contextPath}<%=productUrl%>" />
			<img class="seviece-information"
				src="${pageContext.request.contextPath}/Styles/images/service.png" />

			<%
			}
			resultSet3.close();
			preparedStatement3.close();
			conn.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
			%>

		</main>

	<div class="board_wrapper">

			  <form action="" method="post">
			    <div class="comment_wrapper">
			      <input class="writer" type="text" placeholder="작성자입력"/>
			      <input class="comment" type="text" placeholder="댓글을 입력해주세요."/>
			      <button class="write-comment-button" type="button">작성완료</button>
			    </div>
			  </form>
			
			  <form class="board_form" action="" method="post">
			    <table class="board_table">
			      <thead>
			        <tr>
			          <th style="display:hidden"></th>
			       	  <th>No</th>
			          <th class="board_th">아이디</th>
			          <th  colspan="2">내용</th>
			          <th></th>
			        </tr>
			      </thead>
			      <tbody>
			      <% 
						while(resultSet.next()) {
							int boardNumber = resultSet.getInt("bno");
							int commentNumber = resultSet.getInt("rno");
							String memberId = resultSet.getString("mid");
							String commentText = resultSet.getString("rtext");
							Timestamp commentTime = resultSet.getTimestamp("rtime");
			
					%>
			        <tr>
			         <td style="display:hidden"><%=boardNumber %></td>
			         <td><%=commentNumber %></td>
			         <td><%=memberId%></td>
			         <td><%=commentText %></td>
			         
			        
			          <!-- <td class="board_td">dkdleldi</td>
			          <td class="board_td">임꺽정</td>
			          <td class="board_td" colspan="2">
			            <span class="editable-content">여기 술 진짜 맛있네</span>
			            <input type="text" class="edit-input" style="display: none" />
			          </td> -->
			          <td class="board_td_btn">
			            <button class="edit-button" type="button">수정</button>
			            <button class="save-button" type="button" style="display: none">완료</button>
			            <button class="delete-button" type="button">삭제</button>
			          </td>
			        </tr>
			        <%
						}
			      		resultSet.close();
			      		preparedStatement.close();
			      		conn.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
			        %>
			      </tbody>
			    </table>
			  </form>
			</div>
		<footer><jsp:include page="../Main/footer.jsp" /></footer>
	</div>
	<script></script>
</body>
<script>
	includeHTML()

</script>
</html>
