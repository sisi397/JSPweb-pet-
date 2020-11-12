<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>소동물 관련 서비스 제작</title>
	<link rel="stylesheet" href="css/style.css">

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
			<div id="content">
				<section id="main-section">
					<article>
						<div class="article-body">
							<img src="images/pet.png"><br><br>
							<p style="font-family: BMYEONSUNG; color: #8FD3E8; font-size: 50px; font-weight: bold;" align="center" >We Have Everything Your Pet Needs</p>
					</article>
					<article>
						<div class="article-header">
							<h1 class="article-title">소동물 관련 서비스 간단 소개</h1>
						</div>
						<div class="article-body">
							<img src="http://placehold.it/430x280" / ><br><br>
							<p>Lorem ipsum dolor sit amet.</p><br>
							<p>Proin ut fringilla sapien.</p>
						</div>
					</article>
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
			</div>
			<footer id="main-footer">
				<p align="center">Created By ConSeQ </p>
			</footer>
		</div>
	</body>
</html>