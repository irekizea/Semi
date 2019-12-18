<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>

<%@ page import = "semi.beans.BoardDao" %>
<%@ page import = "semi.beans.BoardDto" %>
<%@ page import = "semi.beans.BoardTextDao" %>
<%@ page import = "semi.beans.BoardTextDto" %>
    
<%

	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(keyword);   
	
	BoardTextDao boardTextDao = new BoardTextDao();
	List<BoardTextDto> getList =boardTextDao.getList(keyword);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="left">
<!-- 검색된 메인글 주제 -->
	<% if(boardDto.getTitle()!=null){ %>
	<table class="title"  border="1">
		<tr>
			<td colspan="2"><h3><%=boardDto.getTitle() %></h3></td>
		</tr>
		<tr>
			<td>작성자: <%=boardDto.getWriter() %></td>
			<td>최종 수정시간: <%=boardDto.getUdate() %></td>
		</tr>
	</table>
	<% }
	else {%>
		<h2>"<%=keyword %>"에 대한 검색결과가 없습니다.</h2>
		<h3>로그인 후 <%=keyword %>에 대한 <a href="#">새 글 제안하기</a></h3>
	<% }%>
	
<!-- 검색된 메인글 상세내용 -->

			<table class="text" border="1">
				<%for(BoardTextDto boardTextDto:getList){ %>
				<tr align="left" >
					<td>
						<%= boardTextDto.getSub_title()%>
					</td>
				</tr>
				<tr>
					<td>
						<%= boardTextDto.getContent()%>
					</td>
				</tr>
				<%} %>
			</table>
			<%if(boardDto.getTitle() !=null) {%>
			<a href="boardedit.jsp?boardno=<%=boardDto.getNo()%>&keyword=<%=boardDto.getTitle()%>">
			<input type="button" value="편집">
			</a>
			<%}%>
	</div>
</body>
</html>