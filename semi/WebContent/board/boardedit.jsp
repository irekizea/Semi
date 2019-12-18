<%@page import="semi.beans.BoardTextDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.BoardTextDao"%>
<%@page import="semi.beans.BoardDto"%>
<%@page import="semi.beans.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// 	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(request.getParameter("keyword"));
	BoardTextDao boardtextdao = new BoardTextDao();
	int boardno = Integer.parseInt(request.getParameter("boardno"));
	BoardTextDto boardtextdto = boardtextdao.get(boardno);
%>
<html>
<head>
<meta charset="UTF-8">
<title>편집페이지</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
</head>
<body>
	<form action=boardedit.do method="post">
	<input type="hidden" name="no" value="<%=boardDto.getNo() %>">
	<input type="hidden" name="keyword" value=<%=request.getParameter("keyword") %>>
	<section class="w-100">
	<table class="w-100, table">
		<tr>
			<td colspan="2"><h3><%=boardDto.getTitle() %></h3></td>
		</tr>
		<tr>
			<td>작성자: <%=boardDto.getWriter() %></td>
			<td>최종 수정시간: <%=boardDto.getUdate() %></td>
		</tr>
		<tr>
			<td colspan="2">
				내용<br><br>
				<textarea name="content" style="resize: none; width: 100%; height:200px"><%=boardtextdto.getContent() %></textarea>
			</td>
		</tr>
	</table>
	<br>
		<div align="center">
		<input type="submit" value="편집완료">
		</div>
	</section>
	</form>
</body>
</html>