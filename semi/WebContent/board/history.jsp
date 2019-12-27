<%@page import="java.util.List"%>
<%@page import="semi.beans.board.HistoryDao"%>
<%@page import="semi.beans.board.HistoryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String keyword = request.getParameter("keyword");
	HistoryDto dto = new HistoryDto();
	HistoryDao dao = new HistoryDao();
	List<HistoryDto> list = dao.hList(keyword);
%>    
<jsp:include page="/template/header.jsp"></jsp:include>



<div align=center>

<table border="1" width = 70%>
	
	<tr>
		<th>
			<%=keyword %>
		</th>

		<th>
		수정일자
		</th>
		<th>
		작성자
		</th>
	</tr>
	
	<% for(HistoryDto hdto : list){ %>
	<tr>
		<td></td>
		<td><%=hdto.getBoardtextudate() %></td>
		<td>
		<%if(hdto.getWriter()!=null){ %>
		<%=hdto.getWriter() %>
		<%} else {%>
		<%=hdto.getIp_addr() %>
		<%} %>
		
		</td>
	</tr>
	<%} %>
</table>

</div>



<jsp:include page="/template/footer.jsp"></jsp:include>