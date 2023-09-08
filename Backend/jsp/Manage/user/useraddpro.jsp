<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
  request.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");

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
      out.println("존재하는 사용자 입니다.");
    } else {
      String insertQuery = "INSERT INTO member (mid, mpw, mname, mbirth, mphone, madress) VALUES(?,?,?,?,?,?)";
      PreparedStatement insertStatement = conn.prepareStatement(insertQuery);
      insertStatement.setString(1, enteredUsername);
      insertStatement.setString(2, enteredPassword);
      insertStatement.setString(3, enteredName);
      insertStatement.setString(4, enteredBirthday);
      insertStatement.setString(5, enteredPhone);
      insertStatement.setString(6, enteredAddress);

      insertStatement.executeUpdate();
      out.println("사용자 정보가 업데이트되었습니다.");
    }
    response.sendRedirect("userload.jsp"); // 대시보드 페이지로 이동
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }
%>
