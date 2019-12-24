<%@page import="semi.beans.board.HistoryDto"%>
<%@page import="semi.beans.board.HistoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.InetAddress" %>

<%@ page import = "semi.beans.board.BoardDao" %>
<%@ page import = "semi.beans.board.BoardDto" %>
<%@ page import = "semi.beans.board.BoardTextDao" %>
<%@ page import = "semi.beans.board.BoardTextDto" %>
<%@ page import = "semi.beans.board.BoardReplyDao" %>
<%@ page import = "semi.beans.board.BoardReplyDto" %>

<%
	String writer=request.getParameter("writer");
	String ip_addr=request.getParameter("ip_addr");
	
	HistoryDao historyDao = new HistoryDao();
	List<HistoryDto> list = historyDao.memberHis(writer, ip_addr);
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css">
<jsp:include page="/template/header.jsp"></jsp:include>


<style>

    .table {
            width: 100%;
            border: 1px solid black;
            border-collapse: collapse
        }

        .table>thead>tr>td,
        .table>thead>tr>th,
        .table>tbody>tr>td,
        .table>tbody>tr>th {
            border: 1px solid black;
            padding: 0.5rem;
        }
</style>
	

<div align = "center">

<table border = "1" style = width:90%>
	<tr>
		<th>
	<%if(request.getParameter("writer")!=null){ %>
				"<%=request.getParameter("writer") %>"의 기여목록
		<% } 
			else{ %>
				"<%=request.getParameter("ip_addr") %>"의 기여목록
		<%} %>
		</th>
	</tr>
	<%for(HistoryDto memberHis : list){ %>
	<tr>
		<td>
			project
		</td>
		<td>
		 	<%=memberHis.getBoardtitle() %>
		</td>
		<td>
			최근 수정 시간
		</td>
		<td>
		 	<%=memberHis.getBoardtextudate() %>
		</td>
	
	</tr>
	<tr>
		<td>
		<%=memberHis.getContent() %>
		</td>
	</tr>
	<%} %>

</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>