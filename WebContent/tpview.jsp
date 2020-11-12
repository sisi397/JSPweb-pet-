<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="tp.Tp"%>
<%@ page import="tp.TpDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
    <%@ page import="java.util.ArrayList" %>
    
   <%@ page import="java.net.URLEncoder" %>
    


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
		}
		int tpID = 0;
		if (request.getParameter("tpID") != null) {
			tpID = Integer.parseInt(request.getParameter("tpID"));
		}
		if (tpID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'matching.jsp'");
			script.println("</script>");
		}
		Tp tp = new TpDAO().getTp(tpID);
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
			
<!-- 게시글 보기 -->
<div id="content">
<section id="main-section">
<article>
<div class="container">
	<div class="row">
		<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3"
								style="background-color: #eeeeee; text-align: center;">글 보기 </th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;"> 글 제목 </td>
							<td colspan="2"><%= tp.getTpTitle() %></td>
						</tr>
						<tr>
							<td>작성자</td>	
							<td colspan="2"><%= tp.getUserID() %></td>
						</tr>
						<tr>
							<td>작성일</td>	
							<td colspan="2"><%= tp.getTpDate().substring(0, 11) + tp.getTpDate().substring(11, 13) + "시"
							+ tp.getTpDate().substring(14, 16) + "분"%></td>
						</tr>
						<tr>
							<td>내용</td>	
							<td colspan="2" style="min-height: 200px; text-align: left;"><%= tp.getTpContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br/>")%></td>
						</tr>
					</tbody>	
				</table>
				<div>
				<form method="post" action="commentwriteAction.jsp">
					<textarea class="form-control" placeholder="댓글" name="comment" maxlength="1000" style="height: 100px; width:710px"></textarea><br>
					<input type="hidden" name="tpID" class="tpID" value="<%=tp.getTpID()%>">
					<div class="btnwrap">	
						<input type="submit"  id="writebtn" value="댓글작성" />
					</div>
				</form>
				</div>
				<div>
				<table class="table2">
					<tbody>
					<tr>
					<th class="td0">댓글</th>
					</tr>
					</tbody>
					</tbody>
				
						<%
							CommentDAO CommentDAO = new CommentDAO();
							ArrayList<Comment> list = CommentDAO.getList(tpID);
							for (int i = 0; i < list.size(); i++) {
								System.out.println(list.get(i).getComment());
						%>
						<tbody>
						<tr>
							<td class="td1">[<%= list.get(i).getcCode()%>]  작성자 : <%= list.get(i).getUserID()%> 작성일시 : <%= list.get(i).getRegDatetime()%></td>
						</tr>
						</tbody>
						<tbody>
						<tr>
							<td class="td2"><%= list.get(i).getComment()%></td>
						</tr>
						</tbody>
						<%
							}
						%>
					
				</table>
				</div>
				
				<a href = "matching.jsp" id="nextbtn">목록</a>
				<%
				//글작성자 본인일시 수정 삭제 가능 
					if(userID != null && userID.equals(tp.getUserID())){
				%>
					<a href="tpupdate.jsp?tpID=<%= tpID %>" id="nextbtn">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="tpdeleteAction.jsp?tpID=<%= tpID %>" id="nextbtn">삭제</a>
				<%					
					}
				%>
		</div>
	</div>
</article>
</section>
</div>

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