<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
  String enteredUsername = request.getParameter("username");
  String enteredPassword = request.getParameter("password");
  String enteredName = request.getParameter("name");
  String enteredAddress = request.getParameter("address");
  String enteredPhone = request.getParameter("phone");
  String enteredBirthday = request.getParameter("birthday");

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

  try {
    if (userExists) {
      // 이미 존재하는 사용자인 경우 업데이트 수행
      String updateQuery = "UPDATE member SET mpw=?, mname=?, mbirth=?, mphone=?, madress=? WHERE mid=?";
      PreparedStatement updateStatement = conn.prepareStatement(updateQuery);
      updateStatement.setString(1, enteredPassword);
      updateStatement.setString(2, enteredName);
      updateStatement.setString(3, enteredBirthday);
      updateStatement.setString(4, enteredPhone);
      updateStatement.setString(5, enteredAddress);
      updateStatement.setString(6, enteredUsername);
      updateStatement.executeUpdate();
      out.println("사용자 정보가 업데이트되었습니다.");
    } else {
      out.print("존재하지 않는 사용자 입니다.");
    }
    response.sendRedirect("userload.jsp"); // 대시보드 페이지로 이동
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }
%>
