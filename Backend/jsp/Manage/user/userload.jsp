<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<%@ include file="../../conn.jsp"%>
<%
  try {
    String selectQuery = "SELECT * FROM member";
    PreparedStatement preparedStatement = conn.prepareStatement(selectQuery);
    ResultSet resultSet = preparedStatement.executeQuery();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script
          src="../../../../Styles/Javascript/jquery-3.7.0.js"
          type="text/javascript"></script>
  <script
          src="../../../../Styles/Javascript/pageUser.js"
          type="text/javascript" defer></script>
  <script src="../../../../Styles/Javascript/userfun.js" defer></script>
  <link
          rel="stylesheet"
          type="text/css"
          href="../../../../Styles/CSS/managePage.css" />
  <title>관리자 페이지</title>
</head>
<body>
<div id="manage_wrapper">
  <main>
    <div id="manage_menu">
      <div class="manage_menu_section">
        <div class="manage_menu_title">
          <a href="../manageMain.jsp">Alcohol</a>
        </div>

        <h3>관리자 페이지</h3>
        <ul id="nav_bar2">
          <li class="menu_bar2">
            <a href="../user/userload.jsp">고객관리 ▸</a>
          </li>
          <li class="menu_bar2">
            <a href="../product/proload.jsp">상품관리 ▸</a>
          </li>
          <li class="menu_bar2">
            <a href="../order/orderload.jsp">주문관리 ▸</a>
          </li>
          <li class="menu_bar2">
            <a href="../inquery/receipt.jsp">1:1문의 ▸</a>
          </li>
        </ul>
      </div>

      <div class="manage_logout">
        <a href="../../logout.jsp">로그아웃</a>
      </div>
    </div>

    <div id="manage_section">
      <div id="manage_detail">
        <div class="manage_btns">
          <a href="./useradd.jsp"><button class="manage_btn">고객 추가</button></a>
          <form action="userdel.jsp" method="post">
            <button class="manage_btn" type="submit" name="manage_del_btn">고객 삭제</button>
            <input type="hidden" name="delselectedMembers" value="" id="delselectedMembers" />
          </form>
          <form action="useredit.jsp" method="post">
            <button class="manage_btn" type="submit" name="manage_update_btn">고객 수정</button></a>
            <input type="hidden" name="updateselectedMembers" value="" id="updateselectedMembers" />
          </form>
        </div>
        <table class="user_table">
          <thead>
          <tr>
            <th></th>
            <th>아이디</th>
            <th>이름</th>
            <th>생년월일</th>
            <th>전화번호</th>
            <th>주소</th>
            <th>회원유형</th>
          </tr>
          </thead>
          <tbody>
          <%
            while (resultSet.next()) {
              String memberId = resultSet.getString("mid");
              String memberName = resultSet.getString("mname");
              String memberPhone = resultSet.getString("mphone");
              String memberAdress = resultSet.getString("madress");
              String memberbirth = resultSet.getString("mbirth");
              int memberMdiv = resultSet.getInt("mdiv");
              String memberdivString = (memberMdiv == 1) ? "회원" : "관리자";
          %>
          <tr class="t_tr">
            <td><input type="checkbox" name="memberCheck" value="<%= memberId %>" class="memberCheckbox"/></td>
            <td><%= memberId %></td>
            <td><%= memberName %></td>
            <td><%= memberbirth %></td>
            <td><%= memberPhone %></td>
            <td><%= memberAdress %></td>
            <td><%= memberdivString %></td>
          </tr>
          <%
              }
              resultSet.close();
              preparedStatement.close();
              conn.close();
            } catch (Exception e) {
              e.printStackTrace();
            }
          %>
          </tbody>
        </table>
      </div>
      <div id="pagination-container"></div>
    </div>
  </main>
</div>
</body>
</html>
