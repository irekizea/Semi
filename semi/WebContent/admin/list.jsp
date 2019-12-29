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
	MemberDao dao = new MemberDao();
	// 		List<MemberDto> list = isSearch가 true일 때 / is Search가  false일 때 
	// 		List<MemberDto> list = dao.search(type,keyword) or null;

	List<MemberDto> list;
	if (isSearch) {
		list = dao.search(type, keyword);
		// 			list = new ArrayList<>();
	} else {
		list = dao.getList(start, finish);
	}
	int count = dao.getCount(type, keyword);

	BlockMemberDao bdao = new BlockMemberDao();
	List<String> blist = bdao.same();

	// 	System.out.println(blist);
	String[] bArrays = blist.toArray(new String[blist.size()]);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
}
</style>

<div class="sun-container">
	<div align="center" class="sun-container-wrap vcenter">
		<h2>회원 검색</h2>

		<!-- 검색창 -->
		<form action="list.jsp" method="get">

			<!-- 		<input type="text" name="type"> -->
			<div class="sun-select">
				<select name="type">
					<option value="id">아이디</option>
					<option value="grade">등급</option>
					<option value="point">포인트</option>
				</select> <input type="text" name="keyword"> <input type="submit"
					value="검색">
			</div>

		</form>

		<h3>
			type =<%=request.getParameter("type")%>, keyword =<%=request.getParameter("keyword")%>
		</h3>

		<!-- 검색 결과 -->
		<table class="sun-user-table" cellpadding="0" cellspacing="0">
			<!-- 테이블 헤더 -->
			<thead>
				<tr>
					<th>ID</th>
					<th>email</th>
					<th>등급</th>
					<th>포인트</th>
					<th>회원 차단</th>
				</tr>
			</thead>

			<tbody align="center">
				<%
					for (MemberDto dto : list) {
				%>
				<tr>
					<td><%=dto.getId()%>
					<%for (String b : bArrays) {%>
  					<%if (b.equals(dto.getId())) {%> 
					 <font color="red">[차단 회원]</font> 
					 <%}%> 
					 <%}%></td>
					<td><%=dto.getEmail()%></td>
					<td><%=dto.getGrade()%></td>
					<td><%=dto.getPoint()%></td>

					<!--회원 차단-->
					<td>
						<form action="block.do">
							<input type="hidden" name="id" value="<%=dto.getId()%>">
							<input type="hidden" name="admin" value="<%=id%>"> <input
								type="text" name="reason"> <input type="submit"
								value="차단">
						</form>
					</td>

				</tr>
				<%
					}
				%>
			</tbody>
		</table>

		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/navigator.jsp">
			<jsp:param name="pno" value="<%=pno%>" />
			<jsp:param name="count" value="<%=count%>" />
			<jsp:param name="navsize" value="<%=navsize%>" />
			<jsp:param name="pagesize" value="<%=pagesize%>" />
		</jsp:include>
	</div>
	<div></div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>