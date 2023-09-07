<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>
<%
    HttpSession session1 = request.getSession();
    String userid = (String) session1.getAttribute("username"); 

    String commentNumberParam = request.getParameter("commentNumber4");
    String alcoholidParam = request.getParameter("alcoholid");
    String productDivParam = request.getParameter("productDiv");
    String selectedComment = request.getParameter("delselectedComment");

    try {
        int commentNumber = (commentNumberParam != null) ? Integer.parseInt(commentNumberParam) : 0;
        int alcoholid = (alcoholidParam != null) ? Integer.parseInt(alcoholidParam) : 0;
        int productDiv = (productDivParam != null) ? Integer.parseInt(productDivParam) : 0;

        if (userid != null && userid.equals(alcoholid)) {
            // 삭제 로직을 실행
            try {
                String deleteQuery = "DELETE FROM reply WHERE rno = ?";
                PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
                deleteStatement.setInt(1, commentNumber);
                deleteStatement.executeUpdate();
                deleteStatement.close();
                response.sendRedirect("product-detail.jsp?alcoholid=" + alcoholid + "&productDiv=" + productDiv);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            // 사용자가 진행자가 아닌 경우에 대한 처리를 추가할 수 있습니다.
            // 예를 들어, 오류 메시지를 표시하거나 리디렉션을 수행할 수 있습니다.
            response.sendRedirect("error.jsp"); // 오류 페이지로 리디렉션 예시
        }
    } catch (NumberFormatException e) {
        // 숫자로 변환할 수 없는 파라미터 값이 있는 경우에 대한 예외 처리
        e.printStackTrace(); // 로그에 예외를 출력하거나 다른 처리를 추가할 수 있습니다.
        response.sendRedirect("error.jsp"); // 오류 페이지로 리디렉션 예시
    }
%>