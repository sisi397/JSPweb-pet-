<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> <!--  웹 페이지 크기 결정 (화면 너비, 초기크기, viewport크기가 보여줘야할 내용보다 작으면 내용을 줄여서 보여줌. 임의 줄임을 방지) -->
  <meta name="description" content=""> <!-- 웹 페이지 요약 정보 -->
  <meta name="author" content="">

  <title>로그인</title>

  <link rel="stylesheet" href="css/style.css">
</head>

<body>
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
<style type="text/css">
@FONT-FACE{
	font-family: 'BMYEONSUNG';
	src:url("font/BMYEONSUNG.ttf");
}
</style>
</head>
<body>
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
								<li class="inner-menu-item"> <a href= "information.jsp"> 소동물 소개</a> </li>
								<li class="inner-menu-item"> <a href= "hospital.jsp"> 동물병원 안내</a> </li>
								<li class="inner-menu-item"> <a href= "matching.jsp"> 임시보호 매칭</a> </li>
							</ul>
						</li>
						<li class="outer-menu-item">
							<span class="menu-title"> <a href= "bbs.jsp" style="color:black"> Community </a> </span>
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
			
			<!-- 로그인 -->
			<div id="content">
<section id = "main-section">
 <div class="loginbox">
		<h1>로그인</h1>
		<form  method="post" action="loginAction.jsp">
			<label for="userID" class="userID">아이디</label>
			<input type="text" name="userID" id="userID"><br/>
			<label for="userPassword" class="userPassword">패스워드</label>
			<input type="password" name="userPassword" id="userPassword">
			<div class="chk">
				<input type="checkbox" id="idchk">
				<label for="idchk">아이디 저장</label>
			</div>
			<div class="search">
				<span class="text">아이디 또는 비밀번호를 잊으셨나요?</span>
				<a href="idFind.jsp">ID/PW찾기</a>
			</div>
			<div class="btnwrap">
				<a href="join.jsp">회원가입</a>
				<input type="submit" id="login" value="로그인">
				<label for="login">로그인 버튼</label>
			</div>
		</form>
	</div>
	</section>
	<aside id="main-aside">
					<div class="aside-list">
						<h3> 카테고리</h3>
						<ul>
							<li> <a href= "information.jsp" style="color:black"> 소동물 소개</a> </li>
							<li> <a href= "hospital.jsp" style="color:black"> 동물병원 안내</a> </li>
							<li> <a href= "matching.jsp" style="color:black"> 임시보호 매칭</a> </li>
							<li> <a href= "bbs.jsp" style="color:black"> Community</a> </li>
						</ul>
					</div>
					<div class="aside-list">
						<h3> 최근 글</h3>
						<ul>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
							<li> <a href= "#" style="color:black"> 데이터</a> </li>
						</ul>
					</div>
				</aside>
				<!-- 
	<footer id="main-footer">
				<p align="center">Created By ConSeQ </p>
	</footer>
-->
	</div>
</body>
</html>