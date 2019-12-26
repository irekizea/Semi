
<%@page import="semi.beans.block.mem.BlockMemberDto"%>
<%@page import="semi.beans.block.mem.BlockMemberDao"%>
<%@page import="semi.beans.member.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--  관리자 차단회원 검색 페이지 -->

<%
//	페이지 크기
	int pagesize = 10;
//	네비게이터 크기
	int navsize = 10;

//	페이징 추가
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno <= 0) throw new Exception();
	}
	catch(Exception e){
		pno = 1;
	}
	
	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);

	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");

	boolean isSearch = type != null && keyword != null;
	
	BlockMemberDao dao = new BlockMemberDao();
	List<BlockMemberDto> list;
	if (isSearch) {
		list = dao.search(type, keyword, start, finish);
	} else {
		list = dao.getList(start, finish);
	}
	
	int count=dao.getCount(type, keyword);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	<h2>차단 회원 목록</h2>
	<table border="0" width="80%">
	<!-- 테이블 헤더 -->
		<thead>
			<tr>
				<th>회원 아이디</th>
				<th>차단 날짜</th>
				<th>관리자</th>
				<th>차단 사유</th>
				<th>차단 해제</th>
			</tr>
		</thead>

		<tbody align="center">
		<%for(BlockMemberDto dto : list){ %>
			<tr>
				<td><%=dto.getB_id()%></td>
				<td><%=dto.getBdate()%></td>
				<td><%=dto.getBadmin()%></td>
				<td><%=dto.getBreason()%></td>
				<td><a href="release.do?id=<%=dto.getB_id()%>"><input type="button" name="release"  value="차단해제"></a></td>
			</tr>
		<%} %>
		</tbody>
	</table>
	
	<div>
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/navigatorSearch.jsp">
			<jsp:param name="pno" value="<%=pno%>"/>
			<jsp:param name="count" value="<%=count%>"/>
			<jsp:param name="navsize" value="<%=navsize%>"/>
			<jsp:param name="pagesize" value="<%=pagesize%>"/>
		</jsp:include>
	</div>
	<div>
	
		<form action="block_list.jsp" method="get">
		
			<select name="type">
				<option value="b_id">회원아이디</option>
				<option value="badmin">관리자아이디</option>
				<option value="breason">차단 사유</option>
				
			</select>
			
			<input type="search" name="keyword" placeholder="검색어" required>
			<input type="submit" value="검색">
		</form>
		
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>