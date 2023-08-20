<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div>
  <a id="header_title" href="${pageContext.request.contextPath}/Backend/jsp/Main/index.jsp">
    <img src="${pageContext.request.contextPath}/Styles/images/logo 1.png" />
    <h1>Alcohol</h1>
  </a>
</div>
<div id="header_search">
  <input id="search_input" type="text" maxlength="20" />
  <a class="header_menu_item">
    <button id="search_button" type="button">
      <img src="${pageContext.request.contextPath}/Styles/images/search 1.png" />
    </button>
  </a>
</div>
<div id="header_menu">
  <a class="header_menu_item" href="../sign.jsp">로그인</a>
  <a class="header_menu_item" href="../signup.jsp">회원가입</a>
</div>
