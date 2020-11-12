<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tp.TpDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
%>
<jsp:useBean id="tp" class="tp.Tp" scope="page" />
<jsp:setProperty name="tp" property="tpTitle" />
<jsp:setProperty name="tp" property="tpContent" />
<%
	System.out.println(tp);
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
			if (tp.getTpTitle() == null || tp.getTpContent() == null) {
				//제목이나 내용을 입력하지 않은경우는 오류발생
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				TpDAO TpDAO = new TpDAO();
				int result = TpDAO.write(tp.getTpTitle(), userID, tp.getTpContent());
					if (result == -1) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('글쓰기에 실패했습니다')");
						script.println("history.back()");	//이전 페이지로 돌려보냄
						script.println("</script>");
					} else {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("location.href='matching.jsp'");
						script.println("</script>");
					}
				}
			}
		%>
	</body>
</html>
