<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "semi.beans.BoardDao" %>
<%@ page import = "semi.beans.BoardDto" %>
    
<%
	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(keyword);
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(keyword!=null){ %>
		<p>작성자: <%=boardDto.getWriter() %></p>
		<p>최종 수정시간: <%=boardDto.getUdate() %></p>
		<h3><%=boardDto.getTitle() %></h3>
		<p> <%=boardDto.getContent() %></p>
	<% }%>
</body>
</html>