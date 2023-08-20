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
      src="../../../..../../../Styles/Javascript/pageOrder.js"
      type="text/javascript"
      defer="defer"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="../../../..../../../Styles/CSS/managePage.css" />
    <title>관리자 페이지</title>
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
                <a href="../user/userload.jsp">고객 관리</a>
              </li>
              <li class="menu_bar2">
                <a href="../product/proload.jsp">상품 관리</a>
              </li>
              <li class="menu_bar2">
                <a href="../order/orderload.jsp">주문 관리</a>
              </li>
              <li class="menu_bar2">
                <a href="../inquery/receipt.jsp">1:1 문의</a>
              </li>
            </ul>
          </div>

          <div class="manage_logout">
            <a href="../../logout.jsp">로그아웃</a>
          </div>
        </div>

        <div id="manage_section">
          <div id="manage_detail">
            <div class="order_btns">
              <a href="completeOrder.jsp"
                ><button class="manage_btn">완료된 주문</button></a
              >
              <button class="manage_btn">주문 확인</button>
              <button class="manage_btn">주문 삭제</button>
            </div>

            <table class="order_table" border="1">
              <thead>
                <tr>
                  <th></th>
                  <th class="order_num">번호</th>
                  <th class="order_th">아이디</th>
                  <th class="order_proname">상품명</th>
                  <th class="order_price">가격</th>
                  <th class="order_th">수량</th>
                  <th class="order_th">이름</th>
                  <th class="order_address">주소</th>
                  <th class="order_phone">전화번호</th>
                  <th class="order_th">결제유형</th>
                  <th class="order_price">총가격</th>
                  <th class="order_memo">배송메모</th>
                </tr>
              </thead>
              <tbody>
                <tr class="t_tr">
                  <td><input type="checkbox" /></td>
                  <td>1</td>
                  <td>soundasads</td>
                  <td>칸티나 자키니니 달 트랄체토 체라수올로 외 3건</td>
                  <td>10,800,800원</td>
                  <td>1000개</td>
                  <td>독고진호</td>
                  <td>서울특별시 강북구 개포동 삼동전보아파트 102동 333호</td>
                  <td>010-0000-0000</td>
                  <td>강남사랑상품권</td>
                  <td>10,300,000원</td>
                  <td>배송메모의 제한은 20자로 하겠습니다</td>
                </tr>
                <tr class="t_tr">
                  <td><input type="checkbox" /></td>
                  <td>1</td>
                  <td>soundasads</td>
                  <td>칸티나 자키니니 달 트랄체토 체라수올로 외 3건</td>
                  <td>52,800원</td>
                  <td>1000개</td>
                  <td>독고진호</td>
                  <td>서울특별시 강북구 개포동 삼동전보아파트 102동 333호</td>
                  <td>010-0000-0000</td>
                  <td>강남사랑상품권</td>
                  <td>10,300,000원</td>
                  <td>배송메모의 제한은 20자로 하겠습니다</td>
                </tr>
                <tr class="t_tr">
                  <td><input type="checkbox" /></td>
                  <td>1</td>
                  <td>soundasads</td>
                  <td>칸티나 자키니니 달 트랄체토 체라수올로 외 3건</td>
                  <td>52,800원</td>
                  <td>1000개</td>
                  <td>독고진호</td>
                  <td>서울특별시 강북구 개포동 삼동전보아파트 102동 333호</td>
                  <td>010-0000-0000</td>
                  <td>강남사랑상품권</td>
                  <td>10,300,000원</td>
                  <td>배송메모의 제한은 20자로 하겠습니다</td>
                </tr>
              </tbody>
            </table>
          </div>
          <div id="pagination-container"></div>
        </div>
      </main>
    </div>
  </body>
</html>
