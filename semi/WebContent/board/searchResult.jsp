<%@page import="semi.beans.board.HistoryDto"%>
<%@page import="semi.beans.board.HistoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
    

<%
	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(keyword);   
	boardDao.searchCount(keyword); 
	

	BoardTextDao boardTextDao = new BoardTextDao();
	List<BoardTextDto> getList =boardTextDao.getList(keyword);	
	
	
	String writer = (String)request.getSession().getAttribute("id");
	
	BoardReplyDao boardReplyDao = new BoardReplyDao();
	List<BoardReplyDto> replyList = boardReplyDao.replyList(keyword);


	
// 	System.out.println("<p>Remote Addr: " + request.getRemoteAddr() + "</p>");
// 	System.out.println("<p>Remote Host: " + request.getRemoteHost() + "</p>");
// 	System.out.println("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>");
			
	String login = (String)session.getAttribute("id");
%>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css">
<jsp:include page="/template/header.jsp"></jsp:include>

			<!-- 검색된 메인글 주제 -->
            <article class="board">           
			    <div class="title">
                    <% if(boardDto.getTitle()!=null){ %>
                   		<%=boardDto.getTitle() %>
                </div>
                <div class="board-udate">
					<span>최근 수정 시간: <%=boardDto.getUdate() %></span>
                </div>
                <article class="clear"></article>
				<div class="row-empty"></div>
				
						<!-- 메인 주제에 대한 상세글-->
			           
			         
			                <%for(BoardTextDto boardTextDto:getList){ %>
			              
							
							<%if(boardTextDto.getIp_addr() !=null){ %>
								<p class="board-udate">최근수정자: <%=boardTextDto.getIp_addr() %></p>
							<%}else{ %>
								<p class="board-udate">최근수정자: <%=boardTextDto.getWriter() %></p>
							<%} %>
							
			                <div class="sub-title">
			                  	상세
			                    <hr>
			                </div>
			                <div class="text">
			                    <%= boardTextDto.getContent()%>
			                </div>
			                <%} %>
					
					<%if(boardDto.getTitle() !=null) {%>
						<a href="boardedit.jsp?boardno=<%=boardDto.getNo()%>&keyword=<%=boardDto.getTitle()%>">
						<input type="button" value="편집">
						</a>
					<%}%>
            </article>
            
           <!-- 메인 주제에 대한 댓글(토론) -->
            <article>
				<span class="sub-title">토론</span>
				<hr>

<!-- 				댓글(토론) 목록 -->
				<%for(BoardReplyDto boardReplyDto: replyList){ %>
					<div class="reply-list">
							<div class="writer">
									<%if(boardReplyDto.getWriter()!=null){ %>
										<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?writer=<%=boardReplyDto.getWriter() %>">
											<span><%=boardReplyDto.getWriter() %></span>
										</a>
									<%} 
										else {%>
										<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?ip_addr=<%=boardReplyDto.getIp_addr() %>">
											<span><%=boardReplyDto.getIp_addr() %></span> 
										</a>
									<%} %>
							</div>
							<div  class="wdate">
									<span><%=boardReplyDto.getWdate() %></span>
							</div>
						<p class="clear p-empty"></p>
						<div><%=boardReplyDto.getContent() %></div>
					</div>
 				<div class="row-empty"></div>
				<%} %>	
				<div class="row-empty"></div>

<jsp:include page="/board/searchResultScript.jsp"></jsp:include>

				<!-- 입력창 -->
            	<form action="replyInsert.do" method="post">                               
	            	<div class="reply-insert">
	            		<input type="hidden" name="board_title" value="<%=boardDto.getTitle()%>">	   
	            		<textarea name="content" onkeyup="textLimit(this, 1000);" required></textarea>
						
						<span>
		            	<%if(writer==null) { %>
							[알림] 비로그인 상태로 토론에 참여합니다. 토론 내역에 IP "<%=InetAddress.getLocalHost().getHostAddress()%>"가 영구히 기록됩니다.
						<%} %>
						</span><br>
						<span>토론은 사용자에 의한 임의삭제가 불가능하므로 신중하게 작성하여 주시길 바랍니다.</span>
		            	<p align="right" style="margin: 5px 0px"><input type="submit" value="등록"></p>
	            	</div>	            			            	

            	</form>
     
					<% }
					else {%>
					<div>
						<P style="font-size:25px">
							"<%=keyword %>"에 대한 검색결과가 없습니다. <br>
						</P>
							<p style="font-size: 15px">
							<%if(writer==null){ %>
								로그인 후 " <%=keyword %> "에 대한 <a href="<%=request.getContextPath()%>/member/login.jsp">새 글 제안하기</a>
							<%} 
							else{%>
								 " <%=keyword %> "에 대한 <a href="<%=request.getContextPath()%>/ba_board/write.jsp">새 글 제안하기</a>
							<%} %>
							</p>
					<% }%>
					</div>
            </article>

<jsp:include page="/template/footer.jsp"></jsp:include>
