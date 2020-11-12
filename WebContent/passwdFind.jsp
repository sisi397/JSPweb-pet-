<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>아이디/비밀번호 찾기</title>
 <link rel="stylesheet" href="css/style.css">
 <script>
 function passFindNullCheck(){

	 if(document.passFindForm.userID.value == ""){

		 alert("아이디를 입력해주세요.");

		 document.passFindForm.userID.focus();

	 }else if(document.passFindForm.userName.value == ""){

		 alert("이름을 입력해주세요.");

		 document.passFindForm.userName.focus();

	 }else if(document.passFindForm.userEmail.value == ""){

		 alert("이메일을 입력해주세요.");

		 document.passFindForm.userEmail.focus();
		 }else{

	 document.passFindForm.submit();
		 }
 }

</script>
<script>
function mainBack(){
	location.href="login.jsp"
	}

	function idFind(){
	location.href="idFind.jsp"
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
			
								
<!-- 가입 -->
<div id="content">
<section id = "main-section">
<div class="findbox">
		<h1>ID/PW 찾기</h1>
		<div class="btn">
<input type="button" id="finduserID2" value="아이디 찾기" onclick="idFind()">

<input type="button" id="finduserPassword2" value="패스워드 찾기" onclick="passFind()">
</div>
<form method="post" id="passFindForm" name="passFindForm" action="passwdFindAction.jsp">
<div class="find" style="text-align: center;">
<input type="text" id="userID" name="userID" placeholder="아이디를 입력해주세요."><br>

<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요."><br>

<input type="text" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요."><br>
</div>
<div class="btn">
<input type="button" id="back" value="돌아가기" onclick="mainBack()">
<input type="button" id="passFind" name="passFind" value="확인" onclick="passFindNullCheck()">
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
</div>
</body>

</html>