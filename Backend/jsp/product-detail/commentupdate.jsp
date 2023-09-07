<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<%
	HttpSession session1 = request.getSession();
	String userid = (String) session1.getAttribute("username");

  Integer enteredProductNumber = Integer.parseInt(request.getParameter("pno"));
  Integer enteredCommentNumber = Integer.parseInt(request.getParameter("rno"));
  String enteredMemberId = request.getParameter("mid");
  String enteredCommentText = request.getParameter("rtext");
  // 이 부분은 실제 데이터베이스 조회 등의 로직이 들어가야 합니다.
  boolean commentExists = false;
  try {
    String checkQuery = "SELECT COUNT(*) FROM reply WHERE rno = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setInt(1, enteredProductNumber);
    checkStatement.setInt(2, enteredCommentNumber);
    ResultSet resultSet = checkStatement.executeQuery();
    if (resultSet.next()) {
      int count = resultSet.getInt(1);
      if (count > 0) {
        commentExists = true;
      }
    }
  } catch (Exception e) {
    out.println("오류: " + e.getMessage());
  }

  if (commentExists) {
    try {
      String updateQuery = "UPDATE reply SET pno = ?, rno = ?, mid = ?, rtext = ?, rtime = ? WHERE rno = ?";
      PreparedStatement preparedStatement = conn.prepareStatement(updateQuery);
      preparedStatement.setInt(1, enteredProductNumber);
      preparedStatement.setInt(2, enteredCommentNumber);
      preparedStatement.setString(3, enteredMemberId);
      preparedStatement.setString(4, enteredCommentText);
      preparedStatement.executeUpdate();
      out.println("데이터가 성공적으로 업데이트되었습니다.");
      session.setAttribute("pno", enteredProductNumber);
      response.sendRedirect("product-detail.jsp");
    /*   response.sendRedirect("product-detail.jsp"); // 상품 페이지로 이동 */
    } catch (Exception e) {
      out.println("오류: " + e.getMessage());
    }
  }
%>
