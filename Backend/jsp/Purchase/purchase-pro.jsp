        <%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ include file="../conn.jsp" %>
<%
    HttpSession session1 = request.getSession();
    String userid = (String) session1.getAttribute("username");

    ResultSet resultSet3 = null;
    PreparedStatement preparedStatement3 = null;
    ArrayList<String> memberNames = new ArrayList<String>();
    ArrayList<String> memberAddresses = new ArrayList<String>();
    ArrayList<String> memberPhones = new ArrayList<String>();
    ArrayList<Integer> productNumbers = new ArrayList<Integer>();
    ArrayList<Integer> cartNumbers = new ArrayList<Integer>();
    ArrayList<String> productNames = new ArrayList<String>();
    ArrayList<Integer> cartQuantities = new ArrayList<Integer>();
    ArrayList<Integer> productPrices = new ArrayList<Integer>();
//    ArrayList<Integer> cartTotalPrices = new ArrayList<Integer>();

    try {
        String selectQuery3 = "SELECT * FROM `member` JOIN cart ON member.mid = cart.mid where member.mid = ? ";
        preparedStatement3 = conn.prepareStatement(selectQuery3);
        preparedStatement3.setString(1, userid);
        resultSet3 = preparedStatement3.executeQuery();

        while (resultSet3.next()) {
            memberNames.add(resultSet3.getString("mname"));
            memberAddresses.add(resultSet3.getString("madress"));
            memberPhones.add(resultSet3.getString("mphone"));
            productNumbers.add(resultSet3.getInt("pno"));
            cartNumbers.add(resultSet3.getInt("cno"));
            productNames.add(resultSet3.getString("pname"));
            cartQuantities.add(resultSet3.getInt("cquantity"));
            productPrices.add(resultSet3.getInt("pprice"));
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        resultSet3.close();
        preparedStatement3.close();
    }

    try {
//        String[] memberNames = request.getParameterValues("memberName");
//        String[] memberAddresses = request.getParameterValues("memberAddress");
//        String[] memberPhones = request.getParameterValues("memberPhone");
//        String[] productNames = request.getParameterValues("productName");
//        String[] cartQuantities = request.getParameterValues("cartQuantity");
//        String[] productPrices = request.getParameterValues("productPrice");
//        String[] productNumbers = request.getParameterValues("productNumber");
//        String[] cartNumbers = request.getParameterValues("cartNumber");
        // Integer cartTotalPrices = Integer.valueOf(request.getParameter("cartTotalPrice"));
        String otexts = request.getParameter("otext");
        String opays = request.getParameter("opay");
        int cartTotalPrices = Integer.parseInt(request.getParameter("cartTotalprice"));

        String insertQuery = "INSERT INTO `order` (mname, madress, mphone, pname, cquantity, pprice, pno, cno, ctotalprice, otext, opay) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);

        for (int i = 0; i < productNumbers.size(); i++) {
            preparedStatement.setString(1, memberNames.get(i));
            preparedStatement.setString(2, memberAddresses.get(i));
            preparedStatement.setString(3, memberPhones.get(i));
            preparedStatement.setString(4, productNames.get(i));
            preparedStatement.setInt(5, (cartQuantities.get(i)));
            preparedStatement.setInt(6, (productPrices.get(i)));
            preparedStatement.setInt(7, (productNumbers.get(i)));
            preparedStatement.setInt(8, (cartNumbers.get(i)));
            preparedStatement.setInt(9, cartTotalPrices);
            preparedStatement.setString(10, otexts);
            preparedStatement.setString(11, opays);
            preparedStatement.addBatch(); // 배치에 쿼리 추가
        }
        // 모든 쿼리를 한 번에 실행
        preparedStatement.executeBatch();
        // PreparedStatement와 연결 닫기
        preparedStatement.close();
        

        try {
            String updateQuery = "UPDATE `product` SET pquantity = pquantity - ? WHERE pno = ?";
            PreparedStatement updatepreparedStatement = conn.prepareStatement(updateQuery);
            for (int i = 0; i < productNumbers.size(); i++) {
                updatepreparedStatement.setInt(1, cartQuantities.get(i));
                updatepreparedStatement.setInt(2, productNumbers.get(i));
                updatepreparedStatement.addBatch(); // 배치에 쿼리 추가
            }
            updatepreparedStatement.executeBatch(); // 모든 쿼리를 한 번에 실행
            out.println("데이터가 성공적으로 업데이트되었습니다.");
        } catch (Exception e) {
            out.println("오류: " + e.getMessage());
        }


        try {
            String deleteQuery = "DELETE FROM `cart` WHERE mid = ? ";
            PreparedStatement deleteStatement = conn.prepareStatement(deleteQuery);
            deleteStatement.setString(1, userid);
            deleteStatement.executeUpdate();
            deleteStatement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("purchase-complete.jsp"); // 대시보드 페이지로 이동

        // 이후 원하는 처리 수행
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
