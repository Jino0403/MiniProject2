<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="../conn.jsp" %>
<%
        HttpSession session1 = request.getSession();
        String userid = (String) session1.getAttribute("username");
        Integer cartTotalPrice = Integer.valueOf(request.getParameter("ctotalprice"));

    try {
        String updateQuery = "UPDATE `cart` SET ctotalprice = ? WHERE mid = ?";
        PreparedStatement updatepreparedStatement = conn.prepareStatement(updateQuery);
            updatepreparedStatement.setInt(1, cartTotalPrice);
            updatepreparedStatement.setString(2, userid);
            updatepreparedStatement.addBatch(); // 배치에 쿼리 추가
        updatepreparedStatement.executeBatch(); // 모든 쿼리를 한 번에 실행

        response.sendRedirect("../Purchase/purchase-detail.jsp");
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    }
        %>