<%@page import="baens.BA_BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="baens.BA_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

BA_BoardDao dao = new BA_BoardDao();
List<BA_BoardDto> list = dao.getList();

%>
<h1>헤더</h1>

<div align="center">
	<table border="1" width="90%">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일시(임시수정)</th>
			</tr>
		</thead>
		
		<tbody>
		<%for(BA_BoardDto dto : list) {%>
			<tr>
				<td><%=dto.getBoard_no()%></td>
				<td><%=dto.getTitle()%></td>
				<td><%=dto.getWriter()%></td>
				
				<%if(dto.getUdate() != null){%>
					<td><%=dto.getUdate()%></td>
				<%} else{%>
					<td><%=dto.getWdate()%></td>
				<%} %>		
			</tr>
		<%} %>		
		</tbody>
	</table>
</div>

<h1>푸터</h1>