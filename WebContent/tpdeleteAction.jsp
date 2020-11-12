<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="tp.TpDAO"%>
<%@ page import="tp.Tp"%>
<%@ page import="java.io.PrintWriter"%>
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
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if (userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp'");
		script.println("</script>");
	} 
	
	//글이 유효한지 판별
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
	if (!userID.equals(tp.getUserID())) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('권한이 없습니다.')");
		script.println("location.href = 'matching.jsp'");
		script.println("</script>");				
	} else {
			TpDAO TpDAO = new TpDAO();
			int result = TpDAO.delete(tpID);
			if (result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제에 실패했습니다')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='matching.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>