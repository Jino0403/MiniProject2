<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>

<%
try {
    // 1. 사용자로부터 전달받은 파라미터 추출
    int enteredCommentNumber = Integer.valueOf(request.getParameter("rno"));
    int enteredBoardNumber = Integer.valueOf(request.getParameter("bno"));
    String enteredUserId = request.getParameter("mid");
    String enteredCommentText = request.getParameter("rtext");
    Timestamp enteredTimeStamp = new Timestamp(System.currentTimeMillis());  // 현재 시간으로 타임스탬프 생성

    // 2. 데이터베이스 연결을 위한 Connection 생성
    Connection connection = null;
    PreparedStatement preparedStatement = null;

    try {
        connection = DriverManager.getConnection("your_database_url", "your_username", "your_password");

        // 3. 댓글 추가를 위한 SQL 쿼리 준비
        String insertQuery = "INSERT INTO reply (comment_number, board_number, user_id, comment_text, timestamp) VALUES (?, ?, ?, ?, ?)";
        preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setInt(1, enteredCommentNumber);
        preparedStatement.setInt(2, enteredBoardNumber);
        preparedStatement.setString(3, enteredUserId);
        preparedStatement.setString(4, enteredCommentText);
        preparedStatement.setTimestamp(5, enteredTimeStamp);

        // 4. SQL 쿼리 실행하여 댓글 추가
        int rowsAffected = preparedStatement.executeUpdate();
        if (rowsAffected > 0) {
            out.println("댓글이 성공적으로 추가되었습니다.");
        } else {
            out.println("댓글 추가에 실패했습니다.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // 5. 사용한 자원 해제
        if (preparedStatement != null) {
            preparedStatement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>