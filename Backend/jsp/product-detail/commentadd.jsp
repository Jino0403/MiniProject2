<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>

<%
	HttpSession session1 = request.getSession();
	String userid = (String) session1.getAttribute("username");
		
try {
    // 1. 사용자로부터 전달받은 파라미터 추출
    int alcoholid = Integer.parseInt(request.getParameter("alcoholid"));
    int productDiv = Integer.parseInt(request.getParameter("productDiv"));
    String enteredCommentText = request.getParameter("commentText");

    // 2. 데이터베이스 연결을 위한 Connection 생성
	
    PreparedStatement preparedStatement = null;

    try {

        // 3. 댓글 추가를 위한 SQL 쿼리 준비
        String insertQuery = "INSERT INTO reply (pno, mid, rtext) VALUES (?, ?, ?)";
        preparedStatement = conn.prepareStatement(insertQuery);
        preparedStatement.setInt(1, alcoholid);
        preparedStatement.setString(2, userid);
        preparedStatement.setString(3, enteredCommentText);

        // 4. SQL 쿼리 실행하여 댓글 추가
        int rowsAffected = preparedStatement.executeUpdate();
        if (rowsAffected > 0) {
        	response.sendRedirect("product-detail.jsp?alcoholid=" + alcoholid + "&productDiv=" + productDiv);

            
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
        if (conn != null) {
            conn.close();
        }
    }
} catch (Exception e) {
    e.printStackTrace();
}
%>