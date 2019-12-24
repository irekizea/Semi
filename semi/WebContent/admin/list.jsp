<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="semi.beans.member.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!--  관리자 회원 검색 페이지 -->

<%
		// - 검색기능 구현
		// - 검색어가 없으면 빈 페이지를 출력
		
		//[1] 검색어 받기(type, keyword)
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
			if(isSearch){
			list  = dao.search(type, keyword);
// 			list = new ArrayList<>();
		}
		else{
		list=null;
		}
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">

	<h2>회원 검색</h2>

	<!-- 검색창 -->
	<form action="list.jsp" method="get">

<!-- 		<input type="text" name="type"> -->

		<select name="type">
			<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="grade">등급</option>
			<option value="phone">전화번호</option>
		</select>
				
		<input type="text" name="keyword">
		
		<input type="submit" value="검색">
	
	</form>

	<h3>
		type =<%=request.getParameter("type")%>,
	    keyword =<%=request.getParameter("keyword")%>
	</h3>
	
	<%--결과 list가 null인지 아닌지에 따라 다른 결과를 보여 주겠다--%>
 	<%if(list == null){ %> <!-- 검색어 입력을 안한거 -->
		<h3> 검색어를 입력해주세요</h3>
	<%}else{ %>	
	<!-- 검색 결과 -->
	<table border="0" width="80%">
		<!-- 테이블 헤더 -->
		<thead>
			<tr>
				<th>ID</th>
				<th>email</th>
				<th>등급</th>
				<th>포인트</th>
				<th>차단 관리</th>
			</tr>
		</thead>

		<tbody align="center">
			<%for(MemberDto dto : list){ %>
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getEmail()%></td>
				<td><%=dto.getGrade()%></td>				
				<td><%=dto.getPoint()%></td>
			<!--  관리 메뉴 --> 	
			<td>
		<a href="#" ><input type="button" name="block" value="차단"></a> 
				</td>	
			</tr>
			<%} %>
		</tbody>


	</table>
	<%} %>

</div>

<jsp:include page="/template/footer.jsp"></jsp:include>