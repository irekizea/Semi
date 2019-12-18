<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	
	<h2>자유 게시판</h2>
	<h5>글은 자신의 인격입니다</h5>
	
	<table border="1" width="90%">
		<thead>
			<tr>
				<th>rn</th>
				<th>번호</th>
				<th>그룹</th>
				<th>상위</th>
				<th>차수</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody align="center">

			<tr>
				<td><%=dto.getNo()%></td>
				<td><%=dto.getGroupno()%></td>
				<td><%=dto.getSuperno()%></td>
				<td><%=dto.getDepth()%></td>
				<td align="left">
					
					<!-- 제목을 depth번 만큼 띄어쓰기 후 출력 -->

						&nbsp;&nbsp;&nbsp;&nbsp;

					
					<%if(dto.getHead() != null){ %>
						<!-- 말머리 출력 -->
						<font color="blue">
							[<%=dto.getHead()%>]
						</font>					
					<%} %>
					
					<a href="content.jsp?no=<%=dto.getNo()%>">
						<!-- 제목 출력 -->
						<%=dto.getTitle()%>
					</a>
					
					<%if(dto.getReplycount() > 0){ %>
						<!-- 댓글수 출력 -->
						<font color="red">
							[<%=dto.getReplycount()%>]
						</font>
					<%} %>
				</td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getWdate()%></td>
				<td><%=dto.getReadcount()%></td>
			</tr>
			<%} %>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="9" align="right">
					<a href="write.jsp">글쓰기</a>
				</td>
			</tr>
		</tfoot>
	</table>
	
	<jsp:include page="/template/footer.jsp"></jsp:include>