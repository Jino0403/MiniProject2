<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="../../../..../../../Styles/Javascript/jquery-3.7.0.js"
      type="text/javascript"></script>
    <script
      src="../../../..../../../Styles/Javascript/manage.js"
      type="text/javascript"
      defer="defer"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="../../../..../../../Styles/CSS/managePage.css" />
    <title>관리자페이지</title>
  </head>
  <body>
    <div id="manage_wrapper">
      <main>
        <div id="manage_menu">
          <div class="manage_menu_section">
            <div class="manage_menu_title">
              <a href="../manageMain.jsp">Alcohol</a>
            </div>

            <h3>관리자페이지</h3>
            <ul id="nav_bar2">
              <li class="menu_bar2">
                <a href="../user/userload.jsp">고객관리 ▸</a>
              </li>
              <li class="menu_bar2">
                <a href="proload.jsp">상품관리 ▸</a>
              </li>
              <li class="menu_bar2">
                <a href="../order/orderload.jsp">주문관리 ▸</a>
              </li>
            </ul>
          </div>

          <div class="manage_logout">
            <a href="../../logout.jsp">로그아웃</a>
          </div>
        </div>

        <div id="manage_section">
          <div class="manage_pro">
            <div class="manage_protitle">📦 신규 상품 추가</div>
            <form class="proadd_form" action="proaddpro.jsp">
            <div class="proadd_section">
	            <div class="proadd_section1">
	              <label>📛 상품명</label>
	              <input type="text" name="productName"/>
	              <label>🍹 카테고리</label>
	              <select name="productCategory" class="select_category">
	                <option value="위스키">위스키</option>
	                <option value="와인">와인</option>
	                <option value="사케">사케</option>
	                <option value="보드카">보드카</option>
	                <option value="소주">소주</option>
	                <option value="맥주">맥주</option>
	                <option value="막걸리">막걸리</option>
	                <option value="고기류">고기류</option>
	                <option value="해산물류">해산물류</option>
	                <option value="탕류">탕류</option>
	              </select>
	              <label>💰 상품가격</label>
	              <input type="text" name="productPrice" />
	              <label>🧺 재고량</label>
	              <input type="text" name="productQuantity"/>
	              <label>🥤 용량</label>
	              <input type="text" name="productMl"/>
	           </div>
	           <div class="proadd_section2">
	              <label>🥛 도수</label>
	              <input type="text" name="productAlcohol"/>
	              <label>🇰🇷 국가</label>
	              <input type="text" name="productCountry"/>
	              <label>📄 상품설명</label>
	              <input type="text" maxlength="200" name="productText"/>
	              <label>📷 상품이미지</label>
	              <input type="file" name="productImg">
	              <label>📷 상품상세이미지</label>
	              <input type="file" name="productDetailImg">
	              </div>
           </div>
              <div class="userinfo_btns">
                <button class="user_btn">추가하기</button>
                <button class="user_btn" type="button"><a href="proload.jsp">뒤로가기</a></button>
              </div>
            </form>
          </div>
        </div>
      </main>
    </div>
  </body>
 <script>
 $(document).ready(function() {
	  // 카테고리 선택이 변경될 때마다 호출되는 이벤트 핸들러
	  $('.select_category').change(function() {
	    var selectedCategory = $(this).val(); // 선택된 카테고리 값 가져오기

	    // 카테고리에 따라 경로를 동적으로 설정
	    var imagePath = '';
	    if (selectedCategory === '위스키') {
	      imagePath = '/Styles/images/alcohol_image/whiskey/';
	    } else if (selectedCategory === '와인') {
	      imagePath = '/Styles/images/alcohol_image/wine/';
	    } else if (selectedCategory === '사케') {
	      imagePath = '/Styles/images/alcohol_image/sake/';
	    } else if (selectedCategory === '보드카') {
	      imagePath = '/Styles/images/alcohol_image/vodka/';
	    } // 다른 카테고리에 대한 조건도 추가하십시오.

	    // 이미지 경로를 동적으로 설정
	    $('input[name="purl"]').val(imagePath);
	  });
	});
 </script>
</html>
