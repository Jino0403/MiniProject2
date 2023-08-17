<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  HttpSession session1 = request.getSession();
  session1.invalidate();

  response.sendRedirect("sign.jsp");
%>