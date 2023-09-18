<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ page
import="java.sql.*"%> <%@ include file="../conn.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 추천</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/category.css"
    />
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/style.css"
    />
    <script src="${pageContext.request.contextPath}/Styles/Javascript/includeHTML.js"></script>
  </head>
  <body>
    <div id="wrapper">
      <header><jsp:include page="../Main/header.jsp" /></header>
      <nav><jsp:include page="../Main/nav.jsp" /></nav>
      <main>
        <div id="recommend_lists">
          <div class="recommend_list">
            <div class="recommend_title">🥵더운 여름밤에 하이볼 한잔🥃</div>
            <div class="recommend_items">
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/whisky/jimbeam.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/broiledmyungran.png"
                  />
                </div>
                <span>짐빔 + 명란구이</span>
                <p>58,500원</p>
              </div>
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/whisky/scotsgrey.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/gambas.png"
                  />
                </div>
                <span>스카치 그레이 + 감바스</span>
                <p>33,100원</p>
              </div>
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/vodka/stolibanilla.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/broiledsalmon.png"
                  />
                </div>
                <span>스톨리 바닐라 + 연어구이</span>
                <p>51,900원</p>
              </div>
            </div>
          </div>
          <div class="recommend_list">
            <div class="recommend_title">퇴근 후 맥주 한잔🍻</div>
            <div class="recommend_items">
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/beer/budweiser.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/buffalochickenwingbong.png"
                  />
                </div>
                <span>버드와이저 + 버팔로 윙봉</span>
                <p>17,700원</p>
              </div>
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/beer/heineken.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/baconvegetableroll.png"
                  />
                </div>
                <span>하이네켄 + 베이컨 야채말이</span>
                <p>15,900원</p>
              </div>
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/beer/qingdao.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/chapsteak.png"
                  />
                </div>
                <span>칭따오 + 찹 스테이크</span>
                <p>21,700원</p>
              </div>
            </div>
          </div>
          <div class="recommend_list">
            <div class="recommend_title">혼술하기 좋은 안성맞춤 조합👍</div>
            <div class="recommend_items">
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/soju/hwanggeumbori.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/kimchijjigae.png"
                  />
                </div>
                <span>황금보리 + 김치찌개</span>
                <p>14,130원</p>
              </div>
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/soju/seoulsnight.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/footofchicken.png"
                  />
                </div>
                <span>서울의 밤 + 닭발</span>
                <p>14,700원</p>
              </div>
              <div class="recommend_item">
                <div class="recommend_imgs">
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/alcohol_image/soju/jeonjuyigangju.png"
                  />
                  <img
                    class="recommend_img"
                    src="../../../Styles/images/snack_image/gopchangjeongol.png"
                  />
                </div>
                <span>전주이강주 + 곱창전골</span>
                <p>24,350원</p>
              </div>
            </div>
          </div>
        </div>
      </main>
      <footer><jsp:include page="../Main/footer.jsp" /></footer>
    </div>
  </body>
  <script>
    includeHTML()
  </script>
</html>
