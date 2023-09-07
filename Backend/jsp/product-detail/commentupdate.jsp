<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<%
	HttpSession session1 = request.getSession();
	String userid = (String) session1.getAttribute("username");

  Integer productDiv = Integer.parseInt(request.getParameter("productDiv"));
  Integer alcoholid = Integer.parseInt(request.getParameter("alcoholid"));
  Integer commentNumber = Integer.parseInt(request.getParameter("commentNumber"));
  String memberId = request.getParameter("memberId");
  String commentText = request.getParameter("commentText");
  Timestamp commentTime = Timestamp.valueOf(request.getParameter("commentTime"));
  
  out.println("productDiv: " + productDiv);
  out.println("alcoholid: " + alcoholid);
  out.println("commentNumber: " + commentNumber);
  out.println("memberId: " + memberId);
  out.println("commentText: " + commentText);
  out.println("commentTime: " + commentTime);
  // 이 부분은 실제 데이터베이스 조회 등의 로직이 들어가야 합니다.
  boolean commentExists = false;
  try {
    String checkQuery = "SELECT COUNT(*) FROM reply WHERE rno = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setInt(1, commentNumber);
    ResultSet resultSet = checkStatement.executeQuery();
    if (resultSet.next()) {
      int count = resultSet.getInt(1);
      if (count > 0) {
        commentExists = true;
      }
    }
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
    out.println("아니진짜제발");
  }

  if (commentExists) {
    try {
    	String updateQuery = "UPDATE `reply` SET rno = ?, pno = ?, mid = ?, rtext = ?, rtime = ? WHERE rno = ?";
    	PreparedStatement preparedStatement = conn.prepareStatement(updateQuery);
    	preparedStatement.setInt(1, commentNumber);
    	preparedStatement.setInt(2, alcoholid);
    	preparedStatement.setString(3, memberId);
    	preparedStatement.setString(4, commentText);
    	preparedStatement.setTimestamp(5, commentTime);
    	preparedStatement.setInt(6, commentNumber);
    	preparedStatement.executeUpdate();
        out.println("데이터가 성공적으로 업데이트되었습니다.");
      response.sendRedirect("product-detail.jsp?alcoholid=" + alcoholid + "&productDiv=" + productDiv);
    /*   response.sendRedirect("product-detail.jsp"); // 상품 페이지로 이동 */
    } catch (Exception e) {
    	e.printStackTrace(); // 오류를 로그에 기록
        out.println("오류가 발생했습니다. 나중에 다시 시도해주세요."); 
    }
  }
%>
