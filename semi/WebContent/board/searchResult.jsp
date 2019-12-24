
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 게시글 체크박스(누르면 나타나기) 설정 
	<label for="체크박스id"> 클릭할 것 </label>
	<input type="checkbox" id="체크박스id">
	이하 숨겨둘 div 영역                                    
-->
<style> 
	.checkbox {
		display: none;
	}
	.checkbox +div {
		display: none;
	}
	.checbox:checked +div {
		display: block;
	}
	.table {
		width
	}
</style>

<%@page import="semi.beans.board.BoardReplyDto"%>
<%@page import="semi.beans.board.BoardReplyDao"%>
<%@page import="semi.beans.board.BoardTextDto"%>
<%@page import="semi.beans.board.BoardTextDao"%>
<%@page import="semi.beans.board.BoardDto"%>
<%@page import="semi.beans.board.BoardDao"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.InetAddress" %>
<%@ page import = "semi.beans.board.BoardDao" %>
<%@ page import = "semi.beans.board.BoardDto" %>
<%@ page import = "semi.beans.board.BoardTextDao" %>
<%@ page import = "semi.beans.board.BoardTextDto" %>
<%@page import="semi.beans.ba_board.BA_FileDao"%>
<%@page import="semi.beans.ba_board.BA_FileDto"%>

<%
	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(keyword);   
	boardDao.searchCount(keyword); 
	
	BoardTextDao boardTextDao = new BoardTextDao();
	List<BoardTextDto> getList =boardTextDao.getList(keyword);	
	
	String ip = request.getRemoteAddr();	//전송자 ip
	String writer = (String)request.getSession().getAttribute("id");
	
	BoardReplyDao boardReplyDao = new BoardReplyDao();
	List<BoardReplyDto> replyList = boardReplyDao.replyList(keyword);	
	
	// 승인된 후 첫글인지, 사용자가 수정한 글인지 판단
	boolean editCheck= boardDto.getEditCheck();
	
	// 파일 다운로드 파일정보 불러오기(List)
	BA_FileDao fdao = new BA_FileDao();
	List<BA_FileDto> flist=fdao.getList(keyword);
	
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css">
<jsp:include page="/template/header.jsp"></jsp:include>

<% if(boardDto.getTitle()!=null){ %>

<article>
<table border="1" class="w-80">
	<tr>				<!-- 승인된 첫 화면.(=사용자 수정 전) -->
		<th>
		<%=boardDto.getTitle() %>
		</th>
	</tr>

		<%if(!editCheck){ %>
	<tr>
		<th>
			개요
		</th>
		<th>
		</th>
		<th>
			최근 수정시간
		</th>
		<th>
			최근 수정자
		</th>
	</tr>
	
	<tr>
		<td></td>
		<td></td>
		<td><%=boardDto.getUdate() %></td>
		<td><%=boardDto.getWriter() %></td>
	</tr>
	
	<tr>
	<td colspan = "4">
		  <%= boardDto.getContent()%>
		   <%for(BA_FileDto boardFileDto : flist) {%>
		  	<!-- 파일 미리보기 -->
		  	<img src="filedown.do?keyword=<%=boardFileDto.getTitle_key() %>" class="img" style="width:100px; height:auto;">
		  <%} %>
	</td>
	</tr>
	
	<tr>
		<td colspan = "4">
			<a href="boardedit.jsp?boardno=<%=boardDto.getNo()%>&keyword=<%=boardDto.getTitle()%>">
								<input type="button" value="편집">
								</a>
		</td>
	
	</tr>


<%} else{%>	
	<tr>							<!-- 사용자들이 수정된 뒤의 상세글 -->
		<th>
		<%=boardDto.getTitle() %>
		</th>
		<th>
		최근 수정 시간: <%=boardDto.getUdate() %>
		</th>
	</tr>

	<tr>
		<th>
		개요
		</th>
		<th>
		</th>
		<th>
		수정시간
		</th>
		<th>
		수정자
		</th>
	</tr>
		
	  	<%for(BoardTextDto boardTextDto:getList){ %>
	
	<tr>
		<td><%=boardTextDto.getSub_title()%></td>
		<td></td>
		<td>
			<%=boardDto.getUdate() %>
		</td>
		<td>
			<%if(boardTextDto.getWriter()!=null){ %>
				<%=boardTextDto.getWriter() %>
			<%} 
			else { %>
				<%=boardTextDto.getIp_addr() %>
			<%} %>
							
		</td>
	</tr>
	
	<tr>
	<td colspan = "4">
		  <%= boardTextDto.getText_content()%>
	</td>
	</tr>
	
	<tr>
		<td colspan = "4">
			<a href="boardedit.jsp?boardno=<%=boardDto.getNo()%>&keyword=<%=boardDto.getTitle()%>">
			<input type="button" value="편집">
			</a>
		</td>
	
	</tr>
<%} %>
<%} %>

	<tr>
	
		<td colspan = "4">
			<form action="textInsert.do" method="post"  enctype="multipart/form-data">
							<label for="show">목차 추가</label>
							<input type="checkbox" id="show" class="checkbox'">
							
								<input type="hidden" name="keyword" value=<%=keyword %>>
								<input type="hidden" name="board_no" value="<%=boardDto.getNo()%>">
								<input type="text" name="sub_title" value="목차[소제목]" required class="sub-title" style="width:100%; height:5%;">
								
								<input type="file" name="file" accept="jpg,png,gif" >
								
								<textarea name="text_content" required class="text">
								</textarea>
								<%if(writer==null) {%> 
										[알림] 비로그인 상태로 편집합니다. 편집 내역에 IP "<%=ip %>"가 영구히 기록됩니다.
								<%} %> 
								<p align="right" style="margin: 5px 0px"><input type="submit" value="등록완료"></p>
							
			</form>
		</td>
	
	</tr>


</table>
<table border="1">
	<tr>
		<th colspan = "4">
			토론
		</th>
	</tr>
	<%for(BoardReplyDto boardReplyDto: replyList){ %>
	
	<tr>
		<td>
		<%if(boardReplyDto.getWriter()!=null){ %>
		<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?writer=<%=boardReplyDto.getWriter() %>">
									<%=boardReplyDto.getWriter() %>
				
								
		<%} else {%>
				<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?ip_addr=<%=boardReplyDto.getIp_addr() %>">
					<%=boardReplyDto.getIp_addr() %>
				</a>
			<%} %>
		</td>
		
		<td colspan ="2">
		</td>
	
		<td>
			<%=boardReplyDto.getWdate() %>
		</td>
	</tr>
	
	<tr>
		<td colspan = "4">
			<%=boardReplyDto.getContent() %>
		</td>
	</tr>

	<%} %>
	
	<tr>
			<td clospan="4">
					<form action="replyInsert.do" method="post">                               
	       
	            		<input type="hidden" name="board_title" value="<%=boardDto.getTitle()%>">	   
	            		<textarea name="content" onkeyup="textLimit(this, 1000);" required></textarea>
	            		
		            	<%if(writer==null) { %>
							[알림] 비로그인 상태로 토론에 참여합니다. 토론 내역에 IP "<%=ip %>"가 영구히 기록됩니다.
						<%} %>
		
			</td>
	
		</tr>
	
		<tr>
			<td>
			토론은 사용자에 의한 임의삭제가 불가능하므로 신중하게 작성하여 주시길 바랍니다.
			<input type="submit" value="등록">
			</form>
		</td>
	</tr>
	
					<% }else {%>
	<tr>
		<td >
		"<%=keyword %>"에 대한 검색결과가 없습니다. <br>
		</td>
		<td colspan="3">
			<%if(writer==null){ %>
								로그인 후 " <%=keyword %> "에 대한 <a href="<%=request.getContextPath()%>/member/login.jsp">새 글 제안하기</a>
			<%}else{%>
				 " <%=keyword %> "에 대한 <a href="<%=request.getContextPath()%>/ba_board/write.jsp">새 글 제안하기</a>
			<%} %>
		</td>
	
	</tr>
			<%} %>

</table>

</article>



<jsp:include page="/template/footer.jsp"></jsp:include>
