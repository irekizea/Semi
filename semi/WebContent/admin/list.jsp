<%@page import="semi.beans.block.mem.MemberStatusDto"%>
<%@page import="semi.beans.block.mem.MemberStatusDao"%>
<%@page import="semi.beans.block.mem.BlockMemberDto"%>
<%@page import="semi.beans.block.mem.BlockMemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="semi.beans.member.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  관리자 회원 검색 페이지 -->

<%
	String id = (String) request.getSession().getAttribute("id");

	//	페이지 크기
	int pagesize = 10;
	//	네비게이터 크기
	int navsize = 10;

	//	   페이징 추가
	int pno;
	try {
		pno = Integer.parseInt(request.getParameter("pno"));
		if (pno <= 0)
			throw new Exception();
	} catch (Exception e) {
		pno = 1;
	}

	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);

	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");

	//[2] 검색인지 아닌지 판정
	// 		boolean isSearch =type도 있고 keyword도 있으면;
	boolean isSearch = type != null && keyword != null;

	//		[3]처리
	
	MemberStatusDao dao = new MemberStatusDao();
	
	List<MemberStatusDto> list;
	if (isSearch) {
		list = dao.search(type, keyword,start, finish);
		// 			list = new ArrayList<>();
	} else {
		list = dao.getList(start, finish);
	}
	int count = dao.getCount(type, keyword);

%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
	margin:0px;
}

table.sun-user-table td:first-child {
    word-break: normal;
    display: inline-block;
    height: 30px;
    text-overflow: ellipsis;
    white-space:nowrap;
    word-wrap:normal;
    width: 160px;
    overflow:hidden;
}
</style>

<div class="sun-container">
	<div align="center" class="sun-container-wrap vcenter">

		<h2>회원 검색</h2>
		<!-- 검색 결과 -->
		<table class="sun-user-table" cellpadding="0" cellspacing="0">
			<!-- 테이블 헤더 -->
			<thead>
				<tr>
					<th>ID</th>
					<th>email</th>
					<th>등급</th>
					<th>회원 차단</th>
				</tr>
			</thead>

			<tbody align="center">
				<%
					for (MemberStatusDto dto : list) {
				%>
				<tr>
					<td>
						<%=dto.getId()%>
  						<%if (dto.isBlocked()) {%> 
					 		<font color="red">[차단 회원]</font> 
					 	<%}%>
					</td>
					<td><%=dto.getEmail()%></td>
					<td><%=dto.getGrade()%></td>

					<!--회원 차단-->
					<td>
						<form action="block.do">
							<input type="hidden" name="id" value="<%=dto.getId()%>">
							<input type="hidden" name="admin" value="<%=id%>"> 
							<input type="text" name="reason" placeholder="차단 사유" required>
							<%if(dto.isBlocked()){ %> 
								<input type="submit" value="차단됨" disabled>
							<%}else{ %>
								<input type="submit" value="차단" >
							<%} %>
						</form>
					</td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<br><br><br><br>
		<!-- 검색창 -->
		<form action="list.jsp" method="get">

			<!-- 		<input type="text" name="type"> -->
			<div class="sun-select">
				<select name="type">
					<option value="id">아이디</option>
					<option value="grade">등급</option>
				</select> <input type="text" name="keyword"> <input type="submit"
					value="검색">
			</div>

		</form>
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/navigatorSearch.jsp">
			<jsp:param name="pno" value="<%=pno%>" />
			<jsp:param name="count" value="<%=count %>" />
			<jsp:param name="navsize" value="<%=navsize%>" />
			<jsp:param name="pagesize" value="<%=pagesize%>" />
		</jsp:include>
	</div>
	<div></div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
