<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>

<%
  String selectedComment = request.getParameter("delselectedComment");
    try {
      String deleteQuery = "DELETE FROM reply WHERE rno = ? ";
      PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
      deleteStatement.setString(1, selectedComment);
      deleteStatement.executeUpdate();
      deleteStatement.close();
      response.sendRedirect("product-detail.jsp");
    } catch (Exception e) {
      e.printStackTrace();
    }
%>
