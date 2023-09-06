<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>

<%
HttpSession Session = request.getSession();
String userid = (String) Session.getAttribute("username");

/* String ordermemberName = request.getParameter("mname");
String ordermemberAdress = request.getParameter("madress");
String ordermemberPhone = request.getParameter("mphone");
String orderproductName = request.getParameter("pname");
Integer ordercartQuantity = Integer.parseInt(request.getParameter("cquantity"));
Integer orderproductPrice = Integer.parseInt(request.getParameter("pprice"));
Integer ordercartTotalprice = Integer.parseInt(request.getParameter("ctotalprice"));
String orderText = request.getParameter("otext");
String orderPay = request.getParameter("opay"); 
 */
boolean orderdata_member = false;
boolean orderdata_product = false;
boolean orderdata_cart = false;
try {
    String checkQuery = "SELECT COUNT(*) FROM member WHERE mid = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setString(1, "guddn13212");
    ResultSet resultSet1 = checkStatement.executeQuery();
    if (resultSet1.next()) {
        int count = resultSet1.getInt(1);
        if (count > 0) {
            orderdata_member = true;
        }
    }
    
} catch (Exception e) {
    out.println("오류: " + e.getMessage());
}

try {
    String checkQuery = "SELECT COUNT(*) FROM product WHERE pname = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setString(1, "휘틀리 보드카");
    ResultSet resultSet2 = checkStatement.executeQuery();
    if (resultSet2.next()) {
        int count = resultSet2.getInt(1);
        if (count > 0) {
            orderdata_product = true;
        }
    }
} catch (Exception e) {
    out.println("오류: " + e.getMessage());
}

try {
    String checkQuery = "SELECT COUNT(*) FROM cart WHERE mid = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setString(1, "guddn13212");
    ResultSet resultSet3 = checkStatement.executeQuery();
    if (resultSet3.next()) {
        int count = resultSet3.getInt(1);
        if (count > 0) {
            orderdata_cart = true;
        }
    }
} catch (Exception e) {
    out.println("오류: " + e.getMessage());
}

if (orderdata_member && orderdata_product && orderdata_cart) { 
    try {
        String insertQuery = "INSERT INTO `order`(pno, mid, cno, pname, pprice, cquantity, mname, madress, mphone, otext, opay, ctotalprice) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = conn.prepareStatement(insertQuery);
        preparedStatement.setInt(1, 23);
        preparedStatement.setString(2, "guddn13212");
        preparedStatement.setInt(3, 10);
        preparedStatement.setString(4, "휘틀리 보드카");
        preparedStatement.setInt(5, 48500);
        preparedStatement.setInt(6, 1);
        preparedStatement.setString(7, "윤형우");
        preparedStatement.setString(8, "대한민국 서울시");
        preparedStatement.setString(9, "010-3720-8465");
        preparedStatement.setString(10, "빨리주셈");
        preparedStatement.setString(11, "신용카드");
        preparedStatement.setInt(12, 48500);
        preparedStatement.executeUpdate();
        out.println("구매가 완료되었습니다.");
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    }
    try {
        response.sendRedirect("purchase-complete.jsp");
        String updateQuantityQuery = "UPDATE product SET pquantity = pquantity - ? WHERE pname = ?";
        PreparedStatement updateQuantityStatement = conn.prepareStatement(updateQuantityQuery);
        updateQuantityStatement.setInt(1, 1); 
        updateQuantityStatement.setString(2, "휘틀리 보드카"); 
        updateQuantityStatement.executeUpdate();
    }catch (Exception e) {
        out.println("업데이트 오류: " + e.getMessage());
    }
    conn.close();
}
    
%>
