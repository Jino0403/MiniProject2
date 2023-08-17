<%--
  Created by IntelliJ IDEA.
  User: woals
  Date: 2023-08-09
  Time: 오후 2:56
  To change this template use File | Settings | File Templates.
--%>

<%--DB 연결 파일 --%>
<%@ page import="java.sql.*"%>
<%
String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/odbo";
String username = "root"; // DB 연결 ID
String password = "root"; // DB 연결 PW

Class.forName(driverName);
Connection conn = DriverManager.getConnection(url, username, password);
%>