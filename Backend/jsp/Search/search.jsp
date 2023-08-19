<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" type="text/css" href="../../../Styles/CSS/style.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR&family=Orbit&display=swap"
      rel="stylesheet"
    />
    <script src="../../../Styles/Javascript/search.js"></script>
    <link rel="stylesheet" type="text/css" href="../../../Styles/CSS/search.css" />
    <script src="../../../Styles/Javascript/includeHTML.js"></script>
    <title>메인 페이지</title>
  </head>
  <body>
    <div id="wrapper">
      <header include-html="../Main/header.jsp">
        <!-- <div>
          <a id="header_title" href="/Frontend/index.jsp">
            <img src="/Frontend/images/logo 1.png" />
            <h1>Alcohol</h1>
          </a>
        </div>
        <div id="header_search">
          <input id="search_input" type="text" maxlength="20" />
          <a class="header_menu_item">
            <button id="search_button" type="button">
              <img src="/Frontend/images/search 1.png" />
            </button>
          </a>
        </div>
        <div id="header_menu">
          <a class="header_menu_item">로그인</a>
          <a class="header_menu_item">회원가입</a>
        </div> -->
      </header>
      <nav include-html="../Main/nav.jsp"></nav>
      <main>
        <div id="search_wrapper">
          <div id="search_results"></div>
        </div>
      </main>
      <footer include-html="../Main/footer.jsp"></footer>
    </div>
  </body>
  <script>
    document.addEventListener("DOMContentLoaded", function () {
      includeHTML()

      const header = document.getElementById("header")

      if (header) {
        header.addEventListener("click", function (event) {
          const target = event.target
          if (target && target.id === "search_button") {
            const searchInput = document.getElementById("search_input")
            const searchTerm = searchInput.value.trim()

            if (searchTerm !== "") {
              window.location.href = `search.jsp?term=${encodeURIComponent(
                searchTerm
              )}`
            }
          }
        })
      }
    })
  </script>
</html>
