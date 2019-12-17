<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "Semiproject.beans.BoardDao" %>
<%@ page import = "Semiproject.beans.BoardDto" %>

<% 
	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto list = boardDao.getDto(keyword);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
	
		<form action="board.do" method="get">
		
			<input type="text" name="keyword" placeholder="검색어" required>			
		
		</form>

		<%if(list==null ) {%>
			<h4>검색어를 입력해주세요.</h4>
		<%}
		else {%>
					
			<%} %>

	</div>
</body>
</html>