<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="hospital.Hospital" %>
<%@ page import="hospital.HospitalDAO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>소동물 관련 서비스 제작</title>
	<link rel="stylesheet" href="css/style.css">
	<!--  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js">
	</script>-->
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
	request.setCharacterEncoding("UTF-8");
	String category = "전체";
	String region = "전체";
	String search = "";
	int pageNumber = 0;
	if(request.getParameter("category")!=null){
		category = request.getParameter("category");
	}
	if(request.getParameter("region")!=null){
		region = request.getParameter("region");
	}
	if(request.getParameter("search")!=null){
		search = request.getParameter("search");
	}
	if(request.getParameter("pageNumber") != null){
		try{
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}catch(Exception e){
			System.out.println("검색 페이지 번호 오류");
		}
	}
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
			<span><h1 class="master-title">소동물 관련 서비스&#160;&#160;&#160;&#160;&#160;&#160;&#160;</h1><br>
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
		<section id = "main-section">
			<form method="get" action="hospital.jsp" class="form-inline">
				<select class="category" name="category" class="form-control">
					<option value="전체">전체</option>
					<option value="고슴도치" <% if(category.equals("고슴도치")) out.println("selected"); %>>고슴도치</option>
					<option value="햄스터"<% if(category.equals("햄스터")) out.println("selected"); %>>햄스터</option>
					<option value="기니피그" <% if(category.equals("기니피그")) out.println("selected"); %>>기니피그</option>
					<option value="조류" <% if(category.equals("조류")) out.println("selected"); %>>조류</option>
				</select>
				<select class="region" name="region" class="form-control mx-1 mt-2">
					<option value="전체">전체</option>
					<option value="서울"<% if(region.equals("서울")) out.println("selected"); %>>서울</option>
					<option value="경기"<% if(region.equals("경기")) out.println("selected"); %>>경기</option>
					<option value="강원"<% if(region.equals("강원")) out.println("selected"); %>>강원</option>
					<option value="부산"<% if(region.equals("부산")) out.println("selected"); %>>부산</option>
					<option value="광주"<% if(region.equals("광주")) out.println("selected"); %>>광주</option>
					<option value="대구"<% if(region.equals("대구")) out.println("selected"); %>>대구</option>
					<option value="대전"<% if(region.equals("대전")) out.println("selected"); %>>대전</option>
				</select>
				<input type="text" name="search" class="search2" value="<%=search%>" placeholder="내용을 입력하세요.">
				<button type="submit" class="btn3">검색</button>
			</form>
	<div id="map">
		<script>
			var map;
			function initMap(){
				var locations = [
		    	['애견종합동물병원', 37.756733, 128.899417],
		     	['하나동물병원', 37.881295, 127.744971],
		      	['우리동물병원', 37.856064, 127.751593],
		      	['펫피아동물병원', 37.616251,126.834787],
		      	['그래드동물병원',37.670725, 126.758142],
		      	['사과나무동물병원', 37.677457,126.768064],
		      	['센트럴동물병원',37.208624, 127.064018],
		      	['광명종합동물병원',37.478005, 126.852805],
		      	['명문종합동물병원', 37.608821, 127.138152],
		      	['다우동물병원',37.623319, 126.700170],
		      	['하노바동물병원',37.496411, 126.764497],
		      	['케나인동물병원',36.349129,127.399759],
		      	['이즈동물병원', 36.622166, 127.513997],
		      	['늘푸른동물병원',36.825453,127.137000],
		      	['하나로동물병원',36.332851,127.444865],
		      	['아나푸게동물병원',35.177102,126.896662],
		      	['펫동물병원',35.807362, 127.116350],
		      	['자연동물병원',35.178652, 126.875893],
		      	['수영종합동물병원',35.164211,129.114726],
		     	['동인동물병원',35.868569,128.609604],
		      	['조은동물병원',36.018465,129.351877],
		      	['튼튼동물병원',35.138163, 129.102106],
		      	['사하동물병원',35.101654,128.978888],
		      	['레알동물병원',35.202584,129.098858]
		  	  ];
				var latitude = 37.566536;
				var longitude = 126.97797;
				var seoul = {lat: latitude, lng: longitude};
				map = new google.maps.Map(document.getElementById('map'),{
					center : seoul,
					zoom: 8
				});
		
				var infowindow = new google.maps.InfoWindow();

		  		var marker, i;
		    	for (i = 0; i < locations.length; i++) {  
		      		marker = new google.maps.Marker({
		        		position: new google.maps.LatLng(locations[i][1], locations[i][2]),
		        		map: map
		      		});
	      
		 	      google.maps.event.addListener(marker, 'click', (function(marker, i) {
		   		     return function() {
	    	   		    infowindow.setContent(locations[i][0]);
	        	  		infowindow.open(map, marker);
	          			map.setZoom(15);
	          			map.setCenter(marker.getPosition());
	       	 			}
	      		 })(marker, i));
	   	  		}
			}
		</script>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDT7sSTMO5sgyqu_1l0KuaIK_QAyv0U44c&callback=initMap" async defer></script>
	</div>	
	<%
		ArrayList<Hospital> list=new ArrayList<Hospital>();
		list = new HospitalDAO().getList(category, region, search, pageNumber);
	%>
	<div class="mainlist">
		<ul class="title">
			<li class="l1">종류</li>
			<li class="l2">지역</li>
			<li class="l3">주소</li>
			<li class="l4">병원이름</li>
			<li class="l5">전화번호</li>
		</ul>
	<%
		if(list != null)
		for(int i = 0; i < list.size(); i++){
			if(i == 5) break;
			Hospital hos = list.get(i);
	%>
		<ul class="list">
			<li class="l1"><%= hos.getCategory() %></li>
			<li class="l2"><%= hos.getRegion() %></li>
			<li class="l3"><%= hos.getAddress() %></li>
			<li class="l4"><%= hos.getName() %></li>
			<li class="l5"><%= hos.getPhone() %></li>
		</ul>		
	 <% } %>			
	</div>
	<div>
		<ul>
			<li>
			<%
				if(pageNumber <= 0){
			%>
			<a class="back">◀ 이전</a>
			<%
				} else {
			%>
			<a class="back" href="./hospital.jsp?category=<%= URLEncoder.encode(category, "UTF-8")%>&region=
			<%= URLEncoder.encode(region, "UTF-8")%>&search=<%= URLEncoder.encode(search, "UTF-8")%>&pageNumber=
			<%= pageNumber - 1%>">◀ 이전</a>
			<% } %>
			</li>
			<li>
			<%
				if(list.size()<6) {
			%>
			<a class="next">다음 ▶</a>
			<%
				} else {
			%>
			<a class="back" href="./hospital.jsp?category=<%= URLEncoder.encode(category, "UTF-8")%>&region=
			<%= URLEncoder.encode(region, "UTF-8")%>&search=<%= URLEncoder.encode(search, "UTF-8")%>&pageNumber=
			<%= pageNumber + 1%>">다음 ▶</a>
			<% } %>
			</li>
		</ul>
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
	</div>
	<footer id="main-footer">
	<p align="center">Created By ConSeQ </p>
	</footer>
</div>	
</body>
</html>