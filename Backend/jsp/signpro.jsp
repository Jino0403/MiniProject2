<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="conn.jsp"%>
<%
try{
    String enteredUsername = request.getParameter("l-username");
    String enteredPassword = request.getParameter("l-userpassword");

    // 이 부분은 실제 데이터베이스 조회 등의 로직이 들어가야 합니다.

     String LoginselectQuery = "SELECT * FROM member WHERE mid= ? AND mpw = ?";
        PreparedStatement preparedStatement = conn.prepareStatement(LoginselectQuery);
        preparedStatement.setString(1, enteredUsername);
        preparedStatement.setString(2, enteredPassword);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            // 로그인 성공
            int memberMdiv = resultSet.getInt("mdiv");
            if(memberMdiv == 2) {
                HttpSession session1 = request.getSession();
                session1.setAttribute("username", enteredUsername);
                session1.setMaxInactiveInterval(360 * 60);
                response.sendRedirect("Manage/manageMain.jsp");
            } else {
                HttpSession session1 = request.getSession();
                session1.setAttribute("username", enteredUsername);
                session1.setMaxInactiveInterval(360 * 60);
                response.sendRedirect("Main/index.jsp"); // 대시보드 페이지로 이동
            }
        } else{
            out.println("로그인 실패");
        }

} catch (Exception e){
    out.println("오류 : " + e.getMessage() );
}
%>