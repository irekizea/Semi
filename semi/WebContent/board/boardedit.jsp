
<%@page import="java.util.List"%>
<%@page import="semi.beans.board.BoardTextDao"%>
<%@page import="semi.beans.board.BoardDto"%>
<%@page import="semi.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<%
	// 	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(request.getParameter("keyword"));
	BoardTextDao boardtextdao = new BoardTextDao();
	int boardno = Integer.parseInt(request.getParameter("boardno"));
	BoardTextDto boardtextdto = boardtextdao.get(boardno);
	String keyword = request.getParameter("keyword");
	List<BoardTextDto> getList = boardtextdao.getList(keyword);
%>
<jsp:include page="/template/header.jsp"></jsp:include>


<form action=boardedit.do method="post">
	<input type="hidden" name="boardtextno" value="<%=boardDto.getNo()%>"> 
	<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
	<input type="hidden" name="boardtitle" value="<%=boardDto.getTitle() %>">
	<input type="hidden" name="writer" value="<%=boardDto.getWriter()%>">
	<input type="hidden" name="boardtextudate" value="<%=boardDto.getUdate()%>">
	<input type="hidden" name="no"	 value="<%=boardtextdto.getNo() %>">
	<input type="hidden" name="board_no"	 value="<%=boardtextdto.getBoard_no()%>">
	<input type="hidden" name="ip_addr" value="111">;
	<article class="board">

		<div class="title">
			<%=boardDto.getTitle()%>
		</div>
		<div class="sub-title">
			작성자:<%=boardDto.getWriter()%>
		</div>
		<p class="board-udate">
			최종 수정시간:<%=boardtextdto.getUdate()%>
		</p>

		<div class="sub-title">
			내용<br>
			<textarea name="content"
				style="resize: none; width: 100%; height: 200px"><%=boardtextdto.getContent()%></textarea>
		</div>

		<div align="left">	
		<input type="submit" value="편집완료">
		</div>
	</article>
	
</form>


<jsp:include page="/template/footer.jsp"></jsp:include>