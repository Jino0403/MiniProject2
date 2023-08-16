<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script
      src="../../../../Styles/Javascript/jquery-3.7.0.js"
      type="text/javascript"></script>
    <script
      src="../../../../Styles/Javascript/manage.js"
      type="text/javascript"
      defer="defer"></script>
    <link
      rel="stylesheet"
      type="text/css"
      href="../../../../Styles/CSS/managePage.css" />
    <title>관리자 페이지</title>
  </head>
  <body>
    <div id="manage_wrapper">
      <main>
        <div class="manage_menu">
          <div>
            <a href="../manageMain.jsp"
              ><img src="../../../../Styles/images/logo 1.png"
            /></a>

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
            <a href="">로그아웃</a>
          </div>
        </div>

        <div id="manage_section">
          <div id="manage_detail">
            <div class="manage_btns">
              <a href="proadd.jsp"
                ><button class="manage_btn">상품 추가</button></a
              >

              <button class="manage_btn">상품 삭제</button>
              <a href="proedit.jsp"
                ><button class="manage_btn">상품 수정</button></a
              >
            </div>
            <table class="pro_table">
              <thead>
                <tr>
                  <th></th>
                  <th class="pro_num">번호</th>
                  <th>상품사진</th>
                  <th class="pro_name">상품명</th>
                  <th class="pro_th">카테고리</th>
                  <th class="pro_price">상품가격</th>
                  <th class="pro_count">재고량</th>
                  <th class="pro_th2">용량</th>
                  <th class="pro_th2">도수</th>
                  <th class="pro_th">국가</th>
                  <th class="pro_info">상품설명</th>
                </tr>
              </thead>
              <tbody>
                <tr class="t_tr">
                  <td><input type="checkbox" /></td>
                  <td>1500</td>
                  <td>
                    <img
                      class="pro_img"
                      src="../../../../Styles/images/술 사진/사케/아마부키 하쿠토우슈.png" />
                  </td>
                  <td>칸티나 자키니니 달 트랄체토 체라수올로</td>
                  <td>사케</td>
                  <td>10,300,800원</td>
                  <td>10000</td>
                  <td>1900mL</td>
                  <td>7.0%</td>
                  <td>도미니크공화국</td>
                  <td>
                    이즈오시마의 맑은 바닷물로 만든 천연소금이 들어간
                    소금유자사케로 좋은 향기와 감칠맛이 가득이즈오시마의 맑은
                    바닷물로 만든 천연소금이 들어간 소금유자사케로 좋은 향기와
                    감칠맛이 가득이즈오시마의 맑은 바닷물로 만든 천연소금이
                    들어간 소금유자사케로 좋은 향기와 감칠맛이 가득이즈오시마의
                    맑은 바닷물로 만든 천연소금이 들어간 소금유자사케로 좋은
                    향기와 감칠맛이 가득
                  </td>
                </tr>
                <tr class="t_tr">
                  <td><input type="checkbox" /></td>
                  <td>1500</td>
                  <td>
                    <img
                      class="pro_img"
                      src="../../../../Styles/images/술 사진/사케/아마부키 하쿠토우슈.png" />
                  </td>
                  <td>칸티나 자키니니 달 트랄체토 체라수올로</td>
                  <td>사케</td>
                  <td>10,300,800원</td>
                  <td>10000</td>
                  <td>1900mL</td>
                  <td>7.0%</td>
                  <td>도미니크공화국</td>
                  <td>
                    이즈오시마의 맑은 바닷물로 만든 천연소금이 들어간
                    소금유자사케로 좋은 향기와 감칠맛이 가득이즈오시마의 맑은
                    바닷물로 만든 천연소금이 들어간 소금유자사케로 좋은 향기와
                    감칠맛이 가득이즈오시마의 맑은 바닷물로 만든 천연소금이
                    들어간 소금유자사케로 좋은 향기와 감칠맛이 가득이즈오시마의
                    맑은 바닷물로 만든 천연소금이 들어간 소금유자사케로 좋은
                    향기와 감칠맛이 가득
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </main>
    </div>
  </body>
</html>
