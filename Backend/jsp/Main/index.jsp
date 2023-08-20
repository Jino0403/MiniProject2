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
    <script src="../../../Styles/Javascript/includeHTML.js"></script>

    <title>메인 페이지</title>
  </head>
  <body>
    <div id="wrapper">
      <!-- 헤더를 include-html로 불러옵니다 -->
      <header><jsp:include page="header.jsp" /></header>
      <nav> <jsp:include page="nav.jsp" /></nav>
      <main><jsp:include page="main.jsp" /></main>
      <footer><jsp:include page="footer.jsp" /></footer>
    </div>

    <!-- JavaScript 파일 포함 -->
<%--    <script>--%>
<%--      includeHTML()--%>

<%--      document.addEventListener("DOMContentLoaded", function () {--%>
<%--        const header = document.getElementById("header")--%>
<%--        if (header) {--%>
<%--          const searchButton = header.querySelector("#search_button")--%>
<%--          const searchInput = header.querySelector("#search_input")--%>

<%--          searchButton.addEventListener("click", function () {--%>
<%--            const searchTerm = searchInput.value.trim()--%>

<%--            if (searchTerm !== "") {--%>
<%--              window.location.href = `../Search/search.jsp?term=${encodeURIComponent(--%>
<%--                searchTerm--%>
<%--              )}`--%>
<%--            }--%>
<%--          })--%>
<%--        }--%>
<%--      })--%>
<%--    </script>--%>
  </body>
</html>
