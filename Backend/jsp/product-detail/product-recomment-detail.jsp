<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>카테고리 > 맥주</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="${pageContext.request.contextPath}/Styles/CSS/product-recomment-detail.css"
    />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/CSS/style.css" />
    <script src="${pageContext.request.contextPath}/Javascript/includeHTML.js"></script>
    <script src="${pageContext.request.contextPath}/Javascript/product-detail.js" defer></script>
  </head>
  <body>
    <div id="wrapper">
      <header include-html="${pageContext.request.contextPath}/HTML/Main/header.jsp"></header>
      <nav include-html="${pageContext.request.contextPath}/HTML/Main/nav.jsp"></nav>
      <main>
        <div class="product-first">
          <div class="product-main-image">
            <img
              class="main-img"
              src="${pageContext.request.contextPath}/images/술 사진/위스키/짐빔.png"
            />
            <img
              class="main-img"
              src="${pageContext.request.contextPath}/images/안주 정보/위스키안주_명란구이.png"
            />
          </div>
          <div class="product-buy">
            <h1 class="product-main-title">짐빔 + 명란구이</h1>
            <hr class="first-hr" />

            <h2>58,500원</h2>

            <div class="product-select">
              <div class="count-button">
                <h3>수량</h3>
                <button id="decrement">-</button>
                <span id="quantity">0</span>
                <button id="increment">+</button>
              </div>
              <div class="product-buy-button">
                <button
                  class="basket-button"
                  type="button"
                  onclick="location.href='.jsp'"
                >
                  장바구니에 담기
                </button>
                <button
                  class="purchase-button"
                  type="button"
                  onclick="location.href='.jsp'"
                >
                  구매하기
                </button>
              </div>
            </div>
          </div>
        </div>

        <hr />
        <h2 class="recommend-comment">다양한 추천 조합들👍</h2>
        <div class="product-second">
          <div class="second-line">
            <div class="product-recommend-image">
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/술 사진/위스키/스카치 그레이.png"
              />
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/안주사진/위스키안주_감바스.png"
              />
            </div>
            <h5>스카치 그레이 + 감바스</h5>
            <p>33,100원</p>
          </div>
          <div class="second-line">
            <div class="product-recommend-image">
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/술 사진/보드카/스톨리 바닐라.png"
              />
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/안주사진/사케안주_연어구이.png"
              />
            </div>
            <h5>스톨리 바닐라 + 연어구이</h5>
            <p>51,900원</p>
          </div>
          <div class="second-line">
            <div class="product-recommend-image">
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/술 사진/맥주/하이네켄.png"
              />
              <img
                class="recommed-with-product"
                src="${pageContext.request.contextPath}/images/안주사진/맥주안주_베이컨야채말이.png"
              />
            </div>
            <h5>하이네켄 + 베이컨 야채말이</h5>
            <p>15,900원</p>
          </div>
        </div>
        <hr />
        <div class="product-third"></div>
        <table>
          <caption>
            주류 정보
          </caption>
          <thead>
            <tr>
              <th class="table-top">술 종류</th>
              <th class="table-top">알코올 도수</th>
              <th class="table-top">원산지</th>
              <th class="table-top">용량</th>
            </tr>
            <tr>
              <th class="table-bottom">위스키</th>
              <th class="table-bottom">43%</th>
              <th class="table-bottom">미국</th>
              <th class="table-bottom">700ml</th>
            </tr>
          </thead>
        </table>
        <table>
          <caption>
            음식 정보
          </caption>
          <thead>
            <tr>
              <th class="table-top">종류</th>
              <th class="table-top">원산지</th>
              <th class="table-top">용량</th>
            </tr>
            <tr>
              <th class="table-bottom">해산물류</th>
              <th class="table-bottom">러시아산</th>
              <th class="table-bottom">200g</th>
            </tr>
          </thead>
        </table>
        <p class="recipe-comment">짐빔 하이볼 만드는 방법🥰</p>
        <br />
        <li class="recipe">
          짐빔 하이볼 = 얼음(가득) + 짐빔 블랙(30ml) + 토닉워터/진저에일(150ml)
          + 레몬즙
        </li>
        <hr />
        <ul>
          <li>
            짐빔은 비교적 더 오랜 기간 추가 숙성되어 우아함과 세련미가 더해진
            ‘엑스트라 에이지드’ 버번 위스키입니다.
          </li>
          <li>
            화이트 오크통에서 오랜 기간 숙성을 통해 더욱 깊어진 부드러운
            캐러멜과 따뜻한 오크의 풍미를 느끼실 수 있습니다.
          </li>
          <li>
            짐빔의 부드러운 캐러멜과 따뜻한 오크 향이 가미된 풀바디 풍미를 주는
            것은 세월이 더 많이 흘렀기 때문입니다.
          </li>
          <li>
            부드러운 바닐라와 미네랄이 강조된 페이드. 환상적인 풍미와 균형을
            갖춘 훌륭한 시퍼 또는 믹서입니다.
          </li>
          <li>
            버번 위스키 판매량 1위, 100개국 이상에서 판매 등은 짐빔의 명성과
            역사, 그리고 검증된 품질을 보여줍니다.
          </li>
        </ul>
        <img
          class="product-information-img"
          src="${pageContext.request.contextPath}/images/술 사진/술 상세사진/짐빔.png"
        />
        <ul>
          <li>
            저희 명란구이는 부드럽고 쫄깃한 식감과 고소한 풍미가 일품입니다.
          </li>
          <li>톡톡 터지는 식감이 좋은 명란구이 입니다.</li>
          <li>제품 개봉 후 냉장보관이 필요한 제품입니다.</li>
          <li>술안주 말고도, 따끈한 밥 위에 올려 반찬으로 드셔도 좋습니다.</li>
          <li>
            기호에 맞게 아보카도, 양파 등을 곁들여 김에 싸서 드셔보시면 더욱
            맛있게 드실 수 있습니다.
          </li>
        </ul>
        <img
          class="product-information-img"
          src="${pageContext.request.contextPath}/images/안주사진/안주 상세 사진/명란구이.png"
        />
        <img
          class="seviece-information"
          src="${pageContext.request.contextPath}/images/서비스사진.png"
        />
      </main>
      <footer include-html="${pageContext.request.contextPath}/HTML/Main/footer.jsp"></footer>
    </div>
    <script></script>
  </body>
  <script>
    includeHTML();
  </script>
</html>
