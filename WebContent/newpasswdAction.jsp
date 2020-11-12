<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty property="userID" name="user"/>
<jsp:setProperty property="userPassword" name="user"/>
<jsp:setProperty property="userName" name="user"/>
<jsp:setProperty property="userGender" name="user"/>
<jsp:setProperty property="userEmail" name="user"/>
<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>
</head>

<body>

<%

request.setCharacterEncoding("utf-8");

String userID = request.getParameter("userID");

String userPassword = request.getParameter("userPassword");

UserDAO userDAO = new UserDAO();

int result = userDAO.newpasswdAction(userID, userPassword);

if(result != -1){
%>
<script>
alert("새 패스워드로 변경됬습니다.");

location.href="login.jsp"
</script>

<input type="button" value="로그인하기" onclick="loginPage()">
<% }else { %>
<script>
alert("패스워드 변경 에러");
location.href="login.jsp"
</script>
<% } %>
</body>

</html>