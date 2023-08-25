<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>

<%
  int selectedOrder = Integer.parseInt(request.getParameter("delselectedOrder"));
    try {
      String deleteQuery = "DELETE FROM order WHERE ono = ? ";
      PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
      deleteStatement.setInt(1, selectedOrder);
      deleteStatement.executeUpdate();
      deleteStatement.close();
      response.sendRedirect("orderload.jsp");
    } catch (Exception e) {
      e.printStackTrace();
    }
%>
