<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=">
<title> join page </title>
<link rel="stylesheet" href="css/style.css">
<script type="text/javascript">

function passCheck(){
	var check = !/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	var memId = document.getElementById("userID").value;
	var memPass = document.getElementById("userPassword").value;
	var memPassCheck = document.getElementById("userPasswordCheck").value;
	if(memPass != memPassCheck){
		document.getElementById("passCheckText").textContent = "비밀번호가 일치하지 않습니다.";
		document.getElementById("passHidden").value = "no";
	}else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(memPass)){
		document.getElementById("passCheckText").textContent = "영문,숫자,특수문자 조합 8~25자로 작성해야합니다.";
		document.getElementById("passHidden").value = "no";
	}else if(/(\w)\1\1\1/.test(memPass)){
	document.getElementById("passCheckText").textContent = "같은 문자를 4번 이상 사용하실 수 없습니다.";
	document.getElementById("passHidden").value = "no";
	}else{
		document.getElementById("passCheckText").textContent = "";
		document.getElementById("passHidden").value = "yes";
	}
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
						<span class="menu-title"> <a href= "indes.jsp" style="color:black"> Home </a></span>
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
  <form method="post" action="joinAction.jsp" id="joinForm">
	<div class="joinbox"style="text-align: center;">
		<h1>회원가입</h1>
			<div class="txtb" style="text-align: center;">
			<input type="text" id="userID" name="userID" placeholder='아이디를 입력해주세요.'><br/>
			<span data-placeholder='userID'></span>
      </div>

      <div class="txtb" style="text-align: center;">
			<input type="password" id="userPassword" name="userPassword" placeholder='비밀번호를 입력해주세요.'maxlength="20"><br/>
			<span data-placeholder='userPassword'></span>
      </div>
     

      <div class="txtb" style="text-align: center;">
			<input type="password" id="userPasswordCheck" onKeyup="passCheck()" placeholder='비밀번호 확인'maxlength="20"><br/>
			<span data-placeholder='userPassword'></span>
			<span class="checkText" id = "passCheckText" style="display:hidden;"></span>
      </div>
      
      <div class="form-group" style="text-align: center;">
     <div class="btn-group" data-toggle="buttons">
     <label class="gender">성별 : </label>
      <input type="radio" id="userGender" name="userGender" autocomplete="off" value="남자">남자
      <input type="radio" id="userGender" name="userGender" autocomplete="off" value="여자">여자
   </div>
   </div>
      <div class="txtb" style="text-align: center;">
      <input type="text" id="userName" name="userName" placeholder='이름을 입력해주세요.'><br/>
      <span data-placeholder='name'></span>
      </div>
      <div class="txtb" style="text-align: center;">
      <input type="text" id="userEmail" name="userEmail" onKeyup="emailCheck();" placeholder='이메일을 입력해주세요.'><br/>
      <span data-placeholder='email'></span>
      </div>
      <input type='submit' class='signup_btn'  value='가입'>
      <div class="bottom-text"><a href='login.jsp'>로그인으로 돌아가기</a>
      </div>
      </div>
     </form>
	</section>
	<aside id="main-aside">
					<div class="aside-list">
						<h3> 카테고리</h3>
						<ul>
							<li> <a href= "information.jsp" style="color:black"> 소동물 소개</a> </li>
							<li> <a href= "hospital.jsp" style="color:black"> 동물병원 안내</a> </li>
							<li> <a href= "matching.jsp" style="color:black"> 임시보호 매칭</a> </li>
							<li> <a href= "bbs.jsp" style="color:black"> Community </a> </li>
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