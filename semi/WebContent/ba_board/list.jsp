<%@page import="baens.BA_BoardDto"%>
<%@page import="java.util.List"%>
<%@page import="baens.BA_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int pagesize = 10;
int navsize = 10;

int pno;
try{
	pno = Integer.parseInt(request.getParameter("pno"));
} catch(Exception e){
	pno = 1;
}

int finish = pno * pagesize;
int start = finish - (pagesize - 1);


BA_BoardDao dao = new BA_BoardDao();
List<BA_BoardDto> list = dao.getList(start,finish);

int count=dao.getCount();
%>
<h1>헤더</h1>
<div align="center">
	<table border="1" width="90%">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일시</th>
			</tr>
		</thead>
		
		<tbody>
		<%for(BA_BoardDto dto : list) {%>
			<tr>
				<td><%=dto.getBoard_no()%></td>
				<td>
					<a href="content.jsp?no=<%=dto.getBoard_no()%>">
						<%=dto.getTitle()%>
					</a>
				</td>
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
	
	<!-- 네비게이터(navigator) -->
	<jsp:include page="/template/navigator.jsp">
		<jsp:param name="pno" value="<%=pno%>"/>
		<jsp:param name="count" value="<%=count%>"/>
		<jsp:param name="navsize" value="<%=navsize%>"/>
		<jsp:param name="pagesize" value="<%=pagesize%>"/>
	</jsp:include>
	
</div>

<h1>푸터</h1>