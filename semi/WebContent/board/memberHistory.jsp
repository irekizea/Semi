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
<%@ page import = "semi.beans.board.HistoryDao" %>
<%@ page import = "semi.beans.board.HistoryDto" %>

<%
	String writer=request.getParameter("writer");
	String ip_addr=request.getParameter("ip_addr");
	
	HistoryDao historyDao = new HistoryDao();
	List<HistoryDto> list = historyDao.memberHis(writer, ip_addr);
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css">
<jsp:include page="/template/header.jsp"></jsp:include>

<article>
	<section>
		<div>
		<%if(request.getParameter("writer")!=null){ %>
				"<%=request.getParameter("writer") %>"의 기여목록
		<% } 
			else{ %>
				"<%=request.getParameter("ip_addr") %>"의 기여목록
		<%} %>
		</div>		
		<div class="">
		<%for(HistoryDto memberHis : list){ %>
			<div class="">
				<%=memberHis.getBoardtitle() %>
				<div>
					<%=memberHis.getBoardtextudate() %>
				</div>
				<div class="">
					<%=memberHis.getContent() %>
				</div>
		<%} %>
			</div>
		</div>
	</section>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>