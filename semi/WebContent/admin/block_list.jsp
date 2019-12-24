
<%@page import="semi.beans.block.mem.BlockMemberDto"%>
<%@page import="semi.beans.block.mem.BlockMemberDao"%>
<%@page import="semi.beans.member.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  관리자 차단회원 검색 페이지 -->

<%
	// - 검색 기능 구현
	// - 검색어가 없으면 빈 페이지를 출력

	// [1] 검색어 받기(type, keyword)
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");

	//[2] 검색인지 아닌지 판정

	//     boolean isSearch는   type도 null이 아니고 keyword도  null이 아니고
	boolean isSearch = type != null && keyword != null;

	//[3] 처리
	BlockMemberDao dao = new BlockMemberDao();

	List<BlockMemberDto> list;
// 	if (isSearch) {
// 		list = dao.getList(start, finish);
// 	} else {
// 		list = null;
// 	}
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>회원 검색</h2>

	<!-- 검색창 -->
	<form action="list.jsp" method="get">

		<select name="type">

			<option value="id">아이디</option>
			<option value="date">차단 날짜</option>
			<option value="admin">관리자</option>
			<option value="reason">차단사유</option>

		</select> <input type="text" name="keyword"> <input type="submit"
			value="검색">

	</form>

	<h3>
		type =
		<%=request.getParameter("type") %>, keyword =<%=request.getParameter("keyword") %>
	</h3>

<%-- 	<%if(list == null){%> --%>
<!-- 	<!-- 검색어 입력이 없는거 --> -->
<!-- 	<h3>검색어를 입력해주세요</h3> -->
<%-- 	<%}else{ %> --%>
<!-- 	<!--  검색 결과  --> -->
<!-- 	<table border="0" width="80%"> -->
<!-- 	<!-- 테이블 헤더 --> -->
<!-- 	<thead> -->
<!-- 	<tr> -->
<!-- 	<th>ID</th> -->
<!-- 	<th>차단 날짜</th> -->
<!-- 	<th>관리자</th> -->
<!-- 	<th>차단 사유</th> -->
<!-- 	</tr> -->
<!-- 	</thead> -->

<!-- 	<tbody align="center"> -->
<%-- 		<%for(BlockMemberDto dto : list){ %> --%>
<!-- 		<tr> -->
<%-- 	<td><%=dto.getB_id()%></td> --%>
<%-- 	<td><%=dto.getBdate()%></td> --%>
<%-- 	<td><%=dto.getBadmin()%></td> --%>
<%-- 	<td><%=dto.getBreason()%></td> --%>
	
<!-- 					</tr> -->
<%-- 			<%} %> --%>
<!-- 		</tbody> -->
		
		
<!-- 	</table> -->
<%-- 	<%} %> --%>

<!-- </div> -->

<jsp:include page="/template/footer.jsp"></jsp:include>