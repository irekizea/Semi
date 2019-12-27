<%@page import="semi.beans.member.MemberDao"%>
<%@page import="semi.beans.member.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- // 	//  회원정보 불러오는 코드 -->

<%
	String id = (String) session.getAttribute("id"); //  session에서 id에 있는 데이터를꺼냄 -->

	MemberDao dao = new MemberDao();
	MemberDto dto = dao.get(id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
}
</style>

<div class="sun-container">
	<div align="center" class="sun-container-wrap">

		<h2><%=dto.getId()%>
			님의 정보
		</h2>

		<table border="1" width="450">
			<tr>
				<th width="25%">아이디</th>
				<td><%=dto.getId()%></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><%=dto.getEmail()%></td>
			</tr>

			<tr>
				<th>등급</th>
				<td><%=dto.getGrade()%></td>
			</tr>

			<tr>
				<th>포인트</th>
				<td><%=dto.getPoint()%></td>
			</tr>

		</table>

		<!--  다른 기능으로 링크 -->
		<h4>
			<a href="check.jsp?go=/member/change_pw.jsp">비밀번호 변경</a>
		</h4>
		<h4>
			<a href="check.jsp?go=/member/change_info.jsp">회원정보 수정</a>
		</h4>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>