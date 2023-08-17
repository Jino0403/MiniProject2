<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>

<%
  int selectedProduct = Integer.parseInt(request.getParameter("delselectedProduct"));
    try {
      String deleteQuery = "DELETE FROM product WHERE pno = ? ";
      PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
      deleteStatement.setInt(1, selectedProduct);
      deleteStatement.executeUpdate();
      deleteStatement.close();
      response.sendRedirect("proload.jsp");
    } catch (Exception e) {
      e.printStackTrace();
    }
%>
