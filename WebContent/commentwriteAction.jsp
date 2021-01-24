<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="tp.*"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<jsp:useBean id="tp" class="tp.Tp" scope="page" />
<jsp:setProperty name="tp" property="tpID" />

<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>자유 게시판</title>
</head>
<body>
	<!-- 글쓰기 기능은 로그인이 되어있는 경우여야 한다. -->
	<%
		String userID = null;
		int tpID = Integer.parseInt(request.getParameter("tpID"));
		String comment=request.getParameter("comment");
		
		if (session.getAttribute("userID") != null) {	//세션이 존재하는 회원
			userID = (String) session.getAttribute("userID");	//해당 세션의 값을 넣는다.
		}
		if (userID == null) {	//로그인이 되어있지 않은경우(글쓰기가 안되야함)
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			if (comment == null) {
				//제목이나 내용을 입력하지 않은경우는 오류발생
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				CommentDAO CommentDAO = new CommentDAO();
				int result = CommentDAO.write(tpID, comment, userID);
					if (result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다')");
						script.println("history.back()");	//이전 페이지로 돌려보냄
						script.println("</script>");
					} else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='tpview.jsp?tpID="+tpID+"'");
						script.println("</script>");
					}
				}
			}
		%>
	</body>
</html>
