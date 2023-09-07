<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*"%>
<%@ include file="../conn.jsp"%>

<%
HttpSession Session = request.getSession();
String userid = (String) Session.getAttribute("username");

String orderMemberName = request.getParameter("mname");
String orderMemberAdress = request.getParameter("madress");
String orderMemberPhone = request.getParameter("mphone");
Integer orderProductNumber = Integer.parseInt(request.getParameter("pno"));
String orderProductName = request.getParameter("pname");
Integer cartNumber = Integer.parseInt(request.getParameter("cno"));
Integer orderCartQuantity = Integer.parseInt(request.getParameter("cquantity"));
Integer orderProductPrice = Integer.parseInt(request.getParameter("pprice"));
Integer orderCartTotalprice = Integer.parseInt(request.getParameter("ctotalprice"));
String orderText = request.getParameter("otext");
String orderPay = request.getParameter("opay"); 

boolean orderdata_member = false;
boolean orderdata_product = false;
boolean orderdata_cart = false;
try {
    String checkQuery = "SELECT COUNT(*) FROM member WHERE mid = ?";
    PreparedStatement checkStatement = conn.prepareStatement(checkQuery);
    checkStatement.setString(1, userid);
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
    checkStatement.setString(1, orderProductName);
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
    checkStatement.setString(1, userid);
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
        preparedStatement.setInt(1, orderProductNumber);
        preparedStatement.setString(2, userid);
        preparedStatement.setInt(3, cartNumber);
        preparedStatement.setString(4, orderProductName);
        preparedStatement.setInt(5, orderProductPrice);
        preparedStatement.setInt(6, orderCartQuantity);
        preparedStatement.setString(7, orderMemberName);
        preparedStatement.setString(8, orderMemberAdress);
        preparedStatement.setString(9, orderMemberPhone);
        preparedStatement.setString(10, orderText);
        preparedStatement.setString(11, orderPay);
        preparedStatement.setInt(12, orderCartTotalprice);
        preparedStatement.executeUpdate();
        out.println("구매가 완료되었습니다.");
    } catch (Exception e) {
        out.println("오류: " + e.getMessage());
    }
    try {
        response.sendRedirect("purchase-complete.jsp");
        String updateQuantityQuery = "UPDATE product SET pquantity = pquantity - ? WHERE pname = ?";
        PreparedStatement updateQuantityStatement = conn.prepareStatement(updateQuantityQuery);
        updateQuantityStatement.setInt(1, orderCartQuantity); 
        updateQuantityStatement.setString(2, "휘틀리 보드카"); 
        updateQuantityStatement.executeUpdate();
    }catch (Exception e) {
        out.println("업데이트 오류: " + e.getMessage());
    }
    conn.close();
}
    
%>
