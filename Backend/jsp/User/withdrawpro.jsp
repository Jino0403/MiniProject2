<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>

<%
  HttpSession session1 = request.getSession();
  String userName = (String) session1.getAttribute("username");
  String selectedMember = request.getParameter("mid");
  String inputPassword = request.getParameter("mpw");

  if (selectedMember != null && inputPassword != null && userName != null && userName.equals(selectedMember)) {
    try {
      String selectQuery = "SELECT COUNT(*) FROM member WHERE mid=? AND mpw=?";
      PreparedStatement selectStatement = conn.prepareStatement(selectQuery);
      selectStatement.setString(1, selectedMember);
      selectStatement.setString(2, inputPassword);

      ResultSet resultSet = selectStatement.executeQuery();
      resultSet.next();
      int rowCount = resultSet.getInt(1);

      resultSet.close();
      selectStatement.close();

      if (rowCount == 1) {
        String deleteCartQuery = "DELETE FROM cart WHERE mid=?";
        String deleteQuery = "DELETE FROM member WHERE mid=?";

        PreparedStatement deleteCartStatement = conn.prepareStatement(deleteCartQuery);
        deleteCartStatement.setString(1,selectedMember);
        deleteCartStatement.executeUpdate();
        deleteCartStatement.close();

        PreparedStatement deleteMemberStatement = conn.prepareStatement(deleteQuery);
        deleteMemberStatement.setString(1, selectedMember);
        deleteMemberStatement.executeUpdate();
        deleteMemberStatement.close();
        response.sendRedirect("../Main/index.jsp");
      } else {
        response.sendRedirect("withdraw.jsp?error=invalid_credentials");
      }

    } catch (Exception e) {
      e.printStackTrace();
    }
  } else {
    response.sendRedirect("withdraw.jsp");
  }

%>
