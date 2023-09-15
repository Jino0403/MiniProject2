<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>

<%

  HttpSession session1 = request.getSession();
  String userid = (String) session1.getAttribute("username");
  int alcoholid = Integer.parseInt(request.getParameter("alcoholid"));
  int productDiv = Integer.parseInt(request.getParameter("productDiv"));
  int commentNumber = Integer.parseInt(request.getParameter("commentNumber"));
    try {
      String deleteQuery = "DELETE FROM reply WHERE rno = ? ";
      PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
      deleteStatement.setInt(1, commentNumber);
      deleteStatement.executeUpdate();
      deleteStatement.close();
      response.sendRedirect("product-detail.jsp?alcoholid=" + alcoholid + "&productDiv=" + productDiv);
    } catch (Exception e) {
      e.printStackTrace();
      out.println("삭제관련 오류입니다. 관리자에게 문의해주세요.");
    }
%>
