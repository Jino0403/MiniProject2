<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>

<%
    // 선택된 상품들을 받아옴
    String selectedProductsStr = request.getParameter("productNum");
    if (selectedProductsStr != null && !selectedProductsStr.isEmpty()) {
        String[] selectedProductsArray = selectedProductsStr.split(",");
        HttpSession session1 = request.getSession();
        String userid = (String) session1.getAttribute("username");

        try {
            // 선택된 각 상품을 순회하며 삭제
            String deleteQuery = "DELETE FROM cart WHERE pno = ? AND mid = ?";
            PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);

            for (String productNumStr : selectedProductsArray) {
                int selectedProduct = Integer.parseInt(productNumStr);
                deleteStatement.setInt(1, selectedProduct);
                deleteStatement.setString(2, userid);
                deleteStatement.executeUpdate();
            }

            deleteStatement.close();
            response.sendRedirect("basket.jsp"); // 작업 후 장바구니 페이지로 이동
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("basket.jsp"); // 오류 발생 시 장바구니 페이지로 이동
        }
    }
%>
