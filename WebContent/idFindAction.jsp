<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty property="userID" name="user"/>
<jsp:setProperty property="userPassword" name="user"/>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="stylesheet" href="css/style.css">
	<title>>JSP 게시판 웹 사이트</title>
<script>
	function loginPage(){
		location.href="login.jsp"
	}
	function passFind(){
		location.href="passwdFind.jsp"
	}
</script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js">
</script>
<script>
	$(document).ready(function () {
		$('.outer-menu-item').hover(function () {
			$(this).find('.inner-menu').show();
		}, function () {
			$(this).find('.inner-menu').hide();
		});
	});
</script>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String userName = request.getParameter("userName");
	String userEmail = request.getParameter("userEmail");
	UserDAO userDAO = new UserDAO();
	String result = userDAO.idFindAction(userName, userEmail);

	if(result != null){
%>
<%
		String userID = null;
		if(session.getAttribute("userID")!=null){
			userID = (String) session.getAttribute("userID");
		}
%>
	<div id="page-wrapper">
		<header id="main-header">
			<hgroup>
				<span><h1 class="master-title">소동물 관련 서비스&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h1><br>
				<%
					if(userID == null){
				%>
				<a href="login.jsp"><button class="login-button" type="button" style="float:right;"><img src="images/login.png" width="90" height="35"></button></a>
				<%
					}else{
				%>
				<a href="logoutAction.jsp"><button class="logout-button" type="button" style="float:right;"><img src="images/logout.png" width="90" height="35"></button></a>
				<%
					}
				%>
				<a href="index.jsp"><img class="master-title" src="images/pontopet.png"></a><br><br></span>
			</hgroup>
		</header>
		<nav id="main-navigation">
			<div class="pull-left">
				<ul class="outer-menu">
					<li class="outer-menu-item">
						<span class="menu-title"> <a href= "index.jsp" style="color:black"> Home </a></span>
						<li class="outer-menu-item">
							<span class="menu-title">About US</span>
							<ul class="inner-menu">
								<li class="inner-menu-item"> <a href= "#"> Our team</a>
								</li>
							</ul>
						</li>
						<li class="outer-menu-item">
							<span class="menu-title">Our Services</span>
							<ul class="inner-menu">
								<li class="inner-menu-item"> <a href= "#"> 소동물 소개</a> </li>
								<li class="inner-menu-item"> <a href= "#"> 동물병원 안내</a> </li>
								<li class="inner-menu-item"> <a href= "#"> 임시보호 매칭</a> </li>
							</ul>
						</li>
						<li class="outer-menu-item">
							<span class="menu-title"> <a href= "#" style="color:black"> Contact Us </a> </span>
						</li>
					</ul>
				</div>
				<div class="pull-right">
					<div class="search-bar">
						<form>
							<input type="text" class="input-search">
							<input type="submit" class="input-search-submit" value= "검색">
						</form>
					</div>
				</div>
			</nav>
			<div class="box">
			<h1>ID/PW 찾기</h1>
	<div class="text">
	<a>찾으시는 아이디는 <%= result %> 입니다.</a>
	</div>
	<div class="btn">
	<input type="button" id = "back" value="로그인하기" onclick="loginPage()">

	<input type="button" id="passFind" value="패스워드 찾기" onclick="passFind()">
	</div>
	</div>
	<aside id="main-aside">
					<div class="aside-list">
						<h3> 카테고리</h3>
						<ul>
							<li> <a href= "#" style="color:black"> 소동물 소개</a> </li>
							<li> <a href= "#" style="color:black"> 동물병원 안내</a> </li>
							<li> <a href= "#" style="color:black"> 임시보호 매칭</a> </li>
						</ul>
					</div>
					<div class="aside-list">
						<h3> 최근 글</h3>
						<ul>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
						</ul>
					</div>
				</aside>
	<%
}else{
%> 

<script>

alert("일치하는 정보의 아이디가 없습니다.");

location.href="idFind.jsp"
</script>

<%

}

%>

</body>
</html>