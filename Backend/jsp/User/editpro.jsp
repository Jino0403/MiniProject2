<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
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
        try {
            String updateQuery = "UPDATE member SET mpw = ?, mname = ?, mphone = ?, madress = ?,mbirth = ? where mid = ?";
            PreparedStatement preparedStatement = conn.prepareStatement(updateQuery);
            preparedStatement.setString(1, enteredPassword);
            preparedStatement.setString(2, enteredName);
            preparedStatement.setString(3, enteredPhone);
            preparedStatement.setString(4, enteredAddress);
            preparedStatement.setString(5, enteredbirthday);
            preparedStatement.setString(6, enteredUsername);
            preparedStatement.executeUpdate();
            out.println("데이터가 성공적으로 저장되었습니다.");
            response.sendRedirect("edit.jsp"); // 대시보드 페이지로 이동
        } catch (Exception e) {
            out.println("오류: " + e.getMessage());
        }
    }
%>
