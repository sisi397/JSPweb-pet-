<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty property="userID" name="user"/>
<jsp:setProperty property="userPassword" name="user"/>
<jsp:setProperty property="userName" name="user"/>
<jsp:setProperty property="userEmail" name="user"/>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<script>
function newPassNullCheck(){

	 if(document.newPassForm.userPassword.value == ""){

		 alert("비밀번호를 입력해주세요.");

		 document.newPassForm.userPassword.focus();

	 }else if(document.newPassForm.passCheck.value == ""){

		 alert("비밀번호 확인을 입력해주세요.");

		 document.newPassForm.passCheck.focus();

	 }else if(document.newPassForm.PassCheck.value != document.newPassForm.userPassword.value){

		 alert("패스워드가 일치하지 않습니다.");

		 document.newPassForm.PassCheck.focus();
	 }else{

	 document.newPassForm.submit();

	 }
}
	 function loginPage(){
			location.href="login.jsp"
			}
	 </script>
	 <script type="text/javascript">

function passCheck(){

	var check = !/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;

	var memId = document.getElementById("userID").value;

	var memPass = document.getElementById("userPassword").value;

	var memPassCheck = document.getElementById("userPasswordCheck").value;

	if(memPass != memPassCheck){

	document.getElementById("passCheckText").textContent = "비밀번호가 일치하지 않습니다.";

	}else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(memPass)){

	document.getElementById("passCheckText").textContent = "영문,숫자,특수문자 조합 8~25자로 작성해야합니다.";

	}else if(/(\w)\1\1\1/.test(memPass)){

	document.getElementById("passCheckText").textContent = "같은 문자를 4번 이상 사용하실 수 없습니다.";

	}else{

	document.getElementById("passCheckText").textContent = "";
	}

	}
</script>
</head>

<body>
<%
request.setCharacterEncoding("utf-8");

String userID = request.getParameter("userID");

String userName = request.getParameter("userName");

String userEmail = request.getParameter("userEmail");
UserDAO userDAO = new UserDAO();
//RegisterBean member = memMgr.setMemberNewPass(memID, memName, memEmail);
int result = userDAO.passwdFindAction(userID, userName, userEmail);

if(result==-1){
System.out.println(result);
%>

<script>

alert("일치하는 정보의 아이디가 없습니다.");

location.href="passwdFind.jsp"

</script>

<%

}else{
%>

	<div id="page-wrapper">
		<header id="main-header">
			<hgroup>
				<span><h1 class="master-title">소동물 관련 서비스&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</h1><br>
				
				<a href="login.jsp"><button class="login-button" type="button" style="float:right;"><img src="images/login.png" width="90" height="35"></button></a>
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
								<li class="inner-menu-item"> <a href= "hospital"> 동물병원 안내</a> </li>
								<li class="inner-menu-item"> <a href= "#"> 임시보호 매칭</a> </li>
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
			<div class="box">
			<h1>패스워드 변경</h1>
	<div class="text">
<form method="post" id="newPassForm" name="newPassForm" action="newpasswdAction.jsp">

<input type="password" id="userPassword" name="userPassword" placeholder="새 비밀번호"><br>

<input type="password" id="userPasswordCheck" onKeyup="passCheck()" name="userPasswordCheck" placeholder="새 비밀번호 확인"><br>
<span class="checkText" id = "passCheckText" style="display:hidden;"></span>

<input type="hidden" id="userID" name="userID" value=<%=userID %>>
<div class="btn">
<input type="button" id = "back" value="로그인하기" onclick="loginPage()">
<input type="button" id="passFind" name="newPass" value = "비밀번호 변경" onclick="newPassNullCheck()">
</div>
</form>
	</div>
	</div>
	<aside id="main-aside">
					<div class="aside-list">
						<h3> 카테고리</h3>
						<ul>
							<li> <a href= "#" style="color:black"> 소동물 소개</a> </li>
							<li> <a href= "hospital.jsp" style="color:black"> 동물병원 안내</a> </li>
							<li> <a href= "#" style="color:black"> 임시보호 매칭</a> </li>
							<li> <a href= "bbs.jsp" style="color:black"> Community</a> </li>
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

}

%>

</body>

</html>