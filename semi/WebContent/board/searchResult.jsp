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
	
	BoardTextDao boardTextDao = new BoardTextDao();
	List<BoardTextDto> getList =boardTextDao.getList(keyword);

%>

<jsp:include page="/template/header.jsp"></jsp:include>

            <article class="board">
			<!-- 검색된 메인글 주제 -->
			     <div class="title">
                   	<% if(boardDto.getTitle()!=null){ %>
                   		<%=boardDto.getTitle() %>
                </div>
					<% }
					else {%>
						<h2>"<%=keyword %>"에 대한 검색결과가 없습니다.</h2>
						<h3>로그인 후 <%=keyword %>에 대한 <a href="#">새 글 제안하기</a></h3>
					<% }%>
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
            </article>

<jsp:include page="/template/footer.jsp"></jsp:include>