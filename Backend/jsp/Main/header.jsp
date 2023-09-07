<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div>
  <a id="header_title" href="${pageContext.request.contextPath}/Backend/jsp/Main/index.jsp">
    <img src="${pageContext.request.contextPath}/Styles/images/logo 1.png" />
    <h1>Alcohol</h1>
  </a>
</div>
<div id="header_menu">
  <a class="header_menu_item" href="../../../Backend/jsp/Search/search.jsp">검색</a>
  <% if (session.getAttribute("loggedIn") != null && (boolean) session.getAttribute("loggedIn")) { %>
        <a class="header_menu_item" href="../logout.jsp">로그아웃</a>
    <% } else { %>
        <a class="header_menu_item" href="../sign.jsp">로그인</a>
    <% } %>
  <a class="header_menu_item" href="../signup.jsp">회원가입</a>
</div>
