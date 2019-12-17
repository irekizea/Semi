<%@page import="java.util.List"%>
<%@page import="servlet.reply.ReplyDao"%>
<%@page import="servlet.reply.ReplyDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ReplyDao rdao = new ReplyDao();
	List<ReplyDto> List = rdao.getList();

%>	

<jsp:include page="/template/header.jsp"></jsp:include>

<tr>
	<td>
		<table border"1" width="100%">
		<%for(ReplyDto rdto : list){ %>
		<tr>
			<th width="100">
				<img src="http://placehold.it/100x100">
			</th>
			<td>
				<%=rdto.getId() %>
				
				<%if(bdto.getId().equals(rdto.getId())){ %>	
				<!-- 글 작성자의 댓글에만 작성자 표시 -->
				<font color="blue">(작성자)</font>
				<%} %>
				
				답글
				
				<%if(userId.equals(rdto.getId())){ %>
				<!--  수정/삭제 버튼은 본인의 댓글에만 표시 -->
				<a href="#">수정</a>
				<a href="reply_delete.do?no=<%=rdto.getReply_no %>&origin=<%=bdto.getBoard_no%>">삭제</a>
				<%} %>
				
				<br><br>
				<%=rdto.getReplytitle() %>
			</td>
		</tr>
			<%} %>	
		</table>
		
	</td>
</tr>
		
<!-- 댓글 작성칸이 표시될 자리 -->
<tr>
	<td align="right">
		
		
		<form action="reply_insert.do" method="post">
		
			<input type="hidden" name="origin" value="<%=bdto.getNo() %>">
			
			<textarea name="content" row="5" col="100" required></textarea>
			
			<input type="submit" value="등록"	>
			
		</form>	
	</td>
</tr>

<tr>
	<td align="right">
		<a href="#"><input type="button" value="글쓰기"></a>
		<a href="#"><input type="button" value="답글쓰기"></a>
		
		<%//if(isAdmin || isMine){ %>		
		<!-- 수정/삭제 버튼 관리자이거나 본인글에만 표시 -->
		<a href="#"><input type="button" value="수정"></a>
		<a href="#"><input type="button" value="삭제"></a>
		
		<%//}%>
		
		<a href="#"><input type="button" value="목록"></a>
		
	</td>
</tr>	


</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
