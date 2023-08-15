<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>

<%
  String[] selectedMembers = request.getParameterValues("delselectedMembers");
  if (selectedMembers != null && selectedMembers.length > 0) {
    try {
      String deleteQuery = "DELETE FROM member WHERE mid IN ('" + String.join("','", selectedMembers) + "')";
      PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
      deleteStatement.executeUpdate();
      deleteStatement.close();
      response.sendRedirect("userload.jsp");
    } catch (Exception e) {
      e.printStackTrace();
    }
  } else {
    response.sendRedirect("userload.jsp");
  }

%>
