<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
  String enteredUsername = request.getParameter("username");
  String enteredPassword = request.getParameter("password");
  String enteredName= request.getParameter("name");
  String enteredAddress = request.getParameter("address");
  String enteredPhone = request.getParameter("phone");
  String enteredbirthday = request.getParameter("birthday");

  // 이 부분은 실제 데이터베이스 조회 등의 로직이 들어가야 합니다.
  boolean userExists = false;
  try {
    String checkQuery = "SELECT COUNT(*) FROM member WHERE mid = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setString(1, enteredUsername);
    ResultSet resultSet = checkStatement.executeQuery();
    if (resultSet.next()) {
      int count = resultSet.getInt(1);
      if (count > 0) {
        userExists = true;
      }
    }
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }

  if (userExists) {
    out.println("이미 해당 사용자가 존재합니다.");
  } else {
    try {
      String insertQuery = "INSERT INTO member (mid,mpw,mname,mbirth,mphone,madress) VALUES (?,?,?,?,?,?)";
      PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
      preparedStatement.setString(1, enteredUsername);
      preparedStatement.setString(2, enteredPassword);
      preparedStatement.setString(3, enteredName);
      preparedStatement.setString(4, enteredbirthday);
      preparedStatement.setString(5, enteredPhone);
      preparedStatement.setString(6, enteredAddress);
      preparedStatement.executeUpdate();
      out.println("데이터가 성공적으로 저장되었습니다.");
      response.sendRedirect("userload.jsp"); // 대시보드 페이지로 이동
    } catch (Exception e) {
      out.println("오류: " + e.getMessage());
    }
  }
%>
