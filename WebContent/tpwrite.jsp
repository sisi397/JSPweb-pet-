<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>자유 게시판</title>
	<link rel="stylesheet" type="text/css"  href="css/style.css">

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
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} //로그인이 된 회원은 로그인의 정보를 담을수 있도록 설정
	%>
	<div id="page-wrapper">
		<header id="main-header">
			<hgroup>
				<span><h1 class="master-title">소동물 관련 서비스&#160;&#160;&#160;&#160;&#160;&#160;&#160;</h1><br>
				<a href="logoutAction.jsp"><button class="login-button" type="button" style="float:right;"><img src="images/logout.png" width="90" height="35"></button></a>
				<a href="index.jsp"><img class="master-title" src="images/pontopet.png"></a><br><br></span>
			</hgroup>
		</header>
		<nav id="main-navigation">
			<div class="pull-left">
				<ul class="outer-menu">
					<li class="outer-menu-item">
						<span class="menu-title"> <a href= "main.jsp" style="color:black"> Home </a></span>
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
							<input type="text" class="input-search"/>
							<input type="submit" class="input-search-submit" value= "검색"/>
						</form>
					</div>
				</div>
			</nav>
			
<!-- 게시판 -->
<div id="content">
<section id="main-section">
<article>
<div class="container">
	<div class="row">
		<form method="post" action="tpwriteAction.jsp">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="tpTitle" maxlength="50"/></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="tpContent" maxlength="2048" style="height: 550px"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div class="btnwrap">	
				<input type="submit"  id="writebtn" value="글쓰기" />
			</div>
		</form>
	</div>
</div>
</article>
</section>

<!-- 우측 내용 -->
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
	</div>
</div>
</body>
</html>