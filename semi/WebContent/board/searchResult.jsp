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
	
	BoardTextDao boardtextdao = new BoardTextDao();
	List<BoardTextDto> getList =boardtextdao.getList(keyword);
	
	System.out.println("<p>Remote Addr: " + request.getRemoteAddr() + "</p>");
	System.out.println("<p>Remote Host: " + request.getRemoteHost() + "</p>");
	System.out.println("<p>X-Forwarded-For: " + request.getHeader("x-forwarded-for") + "</p>");

%>


<jsp:include page="/template/header.jsp"></jsp:include>

			<!-- 검색된 메인글 주제 -->
            <article class="board">           
			     <div class="title">
                   	
                    <% if(boardDto.getTitle()!=null){ %>
                   		<%=boardDto.getTitle() %>
                </div>
				<p class="board-udate">최근 수정 시간: <%=boardDto.getUdate() %></p>
				
						<!-- 메인 주제에 대한 상세글-->
			                <%for(BoardTextDto boardTextDto:getList){ %>
							<p class="board-udate">최근 수정자: <%=boardTextDto.getWriter() %></p>
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
				<span class="sub-title">토론</span><hr>
				
				<!-- 댓글(토론) 목록 -->
				
				<!-- 입력창 -->
            	<form action="replyInsert.do" method="post">                               
	            	<div class="board-reply">
	            		<input type="hidden" name="board_title" value="<%=boardDto.getTitle()%>">	   
	            		<textarea name="content" required></textarea>
	            	</div>
	            	<div align="right">
	            		<input type="submit" value="등록">
	            	</div>
            	</form>
					<% }
					else {%>
						<h6>"<%=keyword %>"에 대한 검색결과가 없습니다.</h6>
						<h6>로그인 후 "<%=keyword %>"에 대한 <a href="#">새 글 제안하기</a></h6>
					<% }%>

            </article>

<jsp:include page="/template/footer.jsp"></jsp:include>
