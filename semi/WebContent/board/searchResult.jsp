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
	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(keyword);   
	
	BoardTextDao boardTextDao = new BoardTextDao();
	List<BoardTextDto> getList =boardTextDao.getList(keyword);	
	
	String writer = (String)request.getSession().getAttribute("id");
	
	BoardReplyDao boardReplyDao = new BoardReplyDao();
	List<BoardReplyDto> replyList = boardReplyDao.replyList(keyword);
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
			                <div class="sub-title">
			                  	<%= boardTextDto.getSub_title()%>
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
						<div>
							<a href="#'"> 기여내역
								<span><%=boardReplyDto.getWriter() %></span>
							</a>
								<span><%=boardReplyDto.getWdate() %></span>
						</div>
						<div><%=boardReplyDto.getContent() %></div>
					</div>
				<%} %>	
 
 <script>
	 <!-- 댓글(토론) 입력 글자수 제한 스크립트-->
	 function textLimit(reply, maxByte) {				// textLimit(입력문자열 이름, max크기)
		 
	     var strValue = reply.value;						//입력문자열 값의 변수
	     var strLen = strValue.length;					//입력문자열 값 길이의 변수
	     
	     var totalByte = 0;									// 문자크기(영문/한글)를 구하기 위한 변수값 초기화
	     var len = 0;											// 입력문자열의 길이제한을 위한 변수
	     
	     var oneChar = "";									// 글자 1개 크기를 추출할 비어있는 변수
	     var reply2 = "";										// 최대허용 문자열을 담을 비어있는 변수
	
	     for (var i = 0; i < strLen; i++) {				//입력문자열 길이만큼 i 증가
	         oneChar = strValue.charAt(i);				//입력문자열의 i 하나씩 oneChar
	         if (escape(oneChar).length > 4) {
	             totalByte += 2;								//totalByte +2 ? 한글
	         } else {
	             totalByte++;									//totalByte +1 ? 영문
	         }
	         
	         // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	         if (totalByte <= maxByte) {					// 위에서 구한 total값이 max값과 같게 되면
	             len = i + 1;									// 입력문자길이(i)에 +1 한다.
	         }
	     }
	
	     // 넘어가는 글자는 자른다.
	     if (totalByte > maxByte) {						// 위에서 구한 max가 total보다 크면
	         alert("토론은"+maxByte + "자를 초과 입력 할 수 없습니다.");
	         reply2 = strValue.substr(0, len);			// 최대허용문자열(reply2) = 입력문자열의 0 ~ 문자길이+1(len)
	         reply.value = reply2;
	         textLimit(reply, 4000);	
	     }
	 }
	 
 </script>
				<!-- 입력창 -->
            	<form action="replyInsert.do" method="post">                               
	            	<div class="board-reply">
	            		<input type="hidden" name="board_title" value="<%=boardDto.getTitle()%>">	   
	            		<textarea name="content" oninput="textLength()" onkeyup="textLimit(this, 1000);" required></textarea>
						
						<span>
		            	<%if(writer==null) { %>
							[알림] 비로그인 상태로 토론에 참여합니다. 토론 내역에 IP "<%=InetAddress.getLocalHost().getHostAddress()%>"가 영구히 기록됩니다.
						<%} %>
						</span>
						
		            	<p align="right"><input type="submit" value="등록"></p>
	            	</div>
	            	
		            	
            	</form>
            	
					<% }
					else {%>
						<P style="font-size:20px" align="center">
							"<%=keyword %>"에 대한 검색결과가 없습니다. <br><br>
							로그인 후 "<%=keyword %>"에 대한 <a href="#">새 글 제안하기</a>
						</p>
					<% }%>

            </article>

<jsp:include page="/template/footer.jsp"></jsp:include>
