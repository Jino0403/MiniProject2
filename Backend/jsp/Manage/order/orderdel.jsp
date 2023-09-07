<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>

<%
  int selectedOrders = Integer.parseInt(request.getParameter("delselectedOrders"));
    try {
      String deleteQuery = "DELETE FROM `order` WHERE ono = ? ";
      PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
      deleteStatement.setInt(1, selectedOrders);
      deleteStatement.executeUpdate();
      deleteStatement.close();
      response.sendRedirect("orderload.jsp");
    } catch (Exception e) {
      e.printStackTrace();
    }
%>
