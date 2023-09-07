<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<%

	/* int searchId = Integer.parseInt(request.getParameter("alcoholid")); */
	
	HttpSession session1 = request.getSession();
	String userid = (String) session1.getAttribute("username"); 
	
	String alcoholidParam = request.getParameter("alcoholid");
	int searchId = 0; // Default value if the parameter is not present or empty

	if (alcoholidParam != null && !alcoholidParam.isEmpty()) {
	    try {
	        searchId = Integer.parseInt(alcoholidParam);
	    } catch (NumberFormatException e) {
	        // Handle the case where the parameter cannot be parsed as an integer
	        e.printStackTrace(); // You can log the error or handle it as needed
	    }
	}
	   
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
	src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"
	defer></script>
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

			try {
			    String selectQuery = "SELECT * FROM product where pno = ? "; 
			    PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
			    preparedStatement.setInt(1, searchId);
			    ResultSet resultSet = preparedStatement.executeQuery();
			    
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
				<div class="main-img-wrapper">
					<img class="main-img"
						src="${pageContext.request.contextPath}<%=productUrl %>" />
				</div>

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
								<input type="hidden" value="<%=searchId%>" id="productNo"
									name="productNo" /> <input type="hidden" value="<%=userid%>"
									id="memberId" name="memberId" /> <input type="hidden"
									value="1" id="productQuan" name="productQuan" />
								<button class="basket-button" type="submit">장바구니에 담기</button>
							</form>
						</div>
					</div>
				</div>
			</div>
			<% 
            } 
	            	
	            	resultSet.close();
					preparedStatement.close();
				%>
			<hr />
			<h2 class="recommend-comment">곁들이면 찰떡궁합인 안주 추천</h2>
			<div class="product-second">
				<div class="product-line">

				<% 
				
				int productDiv = Integer.parseInt(request.getParameter("productDiv"));
                String selectQuery2;
               
          	    if (productDiv == 1) {
                    selectQuery2 = "SELECT * FROM product WHERE pdiv = 2 ORDER BY RAND() LIMIT 5";
                } else {
                    selectQuery2 = "SELECT * FROM product WHERE pdiv = 1 ORDER BY RAND() LIMIT 5";
                }
                
                PreparedStatement preparedStatement2 = conn.prepareStatement(selectQuery2);
                ResultSet resultSet2 = preparedStatement2.executeQuery();
                
              
                while (resultSet2.next()) {
                	int productDiv2 = resultSet2.getInt("pdiv");
                    int productNumber2 = resultSet2.getInt("pno");
                    String productName2 = resultSet2.getString("pname");
                    int productPrice2 = resultSet2.getInt("pprice");
                    String productUrl2 = resultSet2.getString("purl");
                    String productPriceWon2 = String.format("%,d 원", productPrice2);
                %>
                	
                	<div class="second-line">
						<form name="product_form"
							action="${pageContext.request.contextPath}/Backend/jsp/product-detail/product-detail.jsp"
							method="post">
							<input type="hidden" name="alcoholid" value="<%=productNumber2 %>" />
							<input type="hidden" name="productDiv" value="<%=productDiv2 %>" />
							<button type="submit">
								<div class="product-recommend-image">
									<img class="recommed-with-product"
										src="${pageContext.request.contextPath}<%=productUrl2%>" />
								</div>
								<h5><%=productName2%></h5>
								<p><%=productPriceWon2%></p>
							</button>
						</form>
						</div>
					
						<% 
						
		                }
		                
						resultSet2.close();
						preparedStatement2.close();
			
										
					    %>
				</div>
				
			
			</div>
			<hr />
			
			<div class="product-third">
				<table>
					<caption>주류 정보</caption>
					<thead>
						<tr>
							<th class="table-top">술 종류</th>
							<th class="table-top">알코올 도수</th>
							<th class="table-top">원산지</th>
							<th class="table-top">용량</th>
						</tr>
					</thead>
					<tbody>
						<%
						

						String selectQuery3 = "SELECT * FROM product where pno = ? ";
						PreparedStatement preparedStatement3 = conn.prepareStatement(selectQuery3);
						preparedStatement3.setInt(1, searchId);
						ResultSet resultSet3 = preparedStatement3.executeQuery();

						while (resultSet3.next()) {
						int productDiv3 = resultSet3.getInt("pdiv");
						int productNumber3 = resultSet3.getInt("pno");
						String productName3 = resultSet3.getString("pname");
						String productCategory3 = resultSet3.getString("pcategory");
						int productPrice3 = resultSet3.getInt("pprice");
						int productQuantity3 = resultSet3.getInt("pquantity");
						int productMl3 = resultSet3.getInt("pml");
						double productAlcohol3 = resultSet3.getDouble("palcohol");
						String productCountry3 = resultSet3.getString("pcountry");
						String productText3 = resultSet3.getString("ptext");
						String productUrl3 = resultSet3.getString("purl");
						String productCharge3 = resultSet3.getString("mid");
						String productPriceWon3 = String.format("%,d 원", productPrice3);
						
						%>
						<tr>
							<th class="table-bottom"><%=productCategory3%></th>
							<th class="table-bottom"><%=productAlcohol3%> %</th>
							<th class="table-bottom"><%=productCountry3%></th>
							<th class="table-bottom"><%=productMl3%> ml</th>
						</tr>
					</tbody>
				</table>
			</div>
			<img class="seviece-information"
				src="${pageContext.request.contextPath}<%=productUrl3 %>" /> <img
				class="seviece-information"
				src="${pageContext.request.contextPath}/Styles/images/service.png" />

			<div class="board_wrapper">
					<div class="comment_wrapper">
						<!-- <input class="writer" type="text" placeholder="작성자입력" />  -->
						<form action="commentadd.jsp" method="post">
						<input
							class="comment" type="text" name="commentText" placeholder="댓글을 입력해주세요." />
							<input type="hidden" name="alcoholid" value="<%=productNumber3%>"/>
							<input type="hidden" name="productDiv" value="<%=productDiv3 %>" />
							<button class="write-comment-button" type="submit">작성완료</button>
						</form>
					</div>

					<table class="board_table">
						<thead>
							<tr>
								<th class="board_th">아이디</th>
								<th class="board_content">내용</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<%
					}

                    /* resultSet3.close();
                    preparedStatement3.close(); */
                    
                    int productDiv2 = Integer.parseInt(request.getParameter("productDiv"));
                    
                    String selectQuery4 = "SELECT * FROM reply JOIN product ON reply.pno = product.pno where reply.pno = ? ";
                    PreparedStatement preparedStatement4 = conn.prepareStatement(selectQuery4);
                    preparedStatement4.setString(1, alcoholidParam);
                    ResultSet resultSet4 = preparedStatement4.executeQuery();
                    
                    while (resultSet4.next()) {
                    	
                    	int productDiv4 = resultSet4.getInt("pdiv");
                    	int productNumber4 = resultSet4.getInt("pno");
                        int commentNumber4 = resultSet4.getInt("rno");
                        String memberId4 = resultSet4.getString("mid");
                        String commentText4 = resultSet4.getString("rtext");
                        Timestamp commentTime4 = resultSet4.getTimestamp("rtime");
                		%>
                		
							<tr>
								<input type="hidden" name="commentNumber" value="<%=commentNumber4%>" />
								<td><%=memberId4%></td>
								<td><input id="commentText" value="<%=commentText4%>" readonly />
								</td>
								<td class="board_td_btn">
									<% if (userid != null && userid.equals(memberId4)) { %>
				                    <button id="edit-button" onclick="buttonOpen()">수정</button>
				                    <form action="commentupdate.jsp" method="post">
				                        <input type="hidden" name="productDiv" value="<%= productDiv4 %>" />
				                        <input type="hidden" name="alcoholid" value="<%= productNumber4 %>" />
				                        <input type="hidden" name="commentNumber" value="<%= commentNumber4 %>" />
				                        <input type="hidden" name="commentText" value="<%= commentText4 %>" />
				                        <input type="hidden" name="delselectedComment" value="<%= commentNumber4 %>" />
				                        <button id="save-button" onclick="buttonComplete()" type="submit" style="display: none">완료</button>
				                    </form>
				                    <form action="commentdel.jsp" method="post">
				                        <input type="hidden" name="commentNumber" value="<%= commentNumber4 %>" />
				                        <input type="hidden" name="alcoholid" value="<%= productNumber4 %>" />
				                        <button id="delete-button" type="submit">삭제</button>
				                    </form>
				                <% } %>
								</td>
								
							</tr>
							<%
                    }
                    resultSet4.close();
                    preparedStatement4.close();
                    conn.close();
                    
  				} catch (Exception e) {
                    e.printStackTrace();
                }
                %>
						</tbody>
					</table>
			</div>
		</main>


		<footer><jsp:include page="../Main/footer.jsp" /></footer>
	</div>
</body>
<script>
        includeHTML()

    </script>
</html>