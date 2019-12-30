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

.s{
height: 600px;
}

input.sun-button {
    background: black;
    color: white;
    border: none;
    width: 120px;
    line-height: 35px;
    margin: 30px 5px;
    cursor: pointer;
}

input.sun-button:hover {
    opacity: 0.7;
}


</style>
<div class="s">
<br>
<div class="sun-container">
	<div align="center" class="sun-container-wrap">
		<label for="id" class="sun-user-label">아이디</label>
		<input id="id" name="id" class="sun-user-input" type="text" value="<%=dto.getId()%>" readonly />

		<label for="email" class="sun-user-label">이메일</label>
		<input id="email" name="email" class="sun-user-input" type="text" value="<%=dto.getEmail()%>" readonly />

		<label for="grade" class="sun-user-label">등급</label>
		<input id="grade" name="grade" class="sun-user-input" type="text" value="<%=dto.getGrade()%>" readonly />

		<br/>

		<input class="sun-button" type="button" onclick="location.href='check.jsp?go=/member/change_pw.jsp'" value="비밀번호 변경">
		<input class="sun-button" type="button" onclick="location.href='check.jsp?go=/member/change_info.jsp'" value="회원정보 수정">
	</div>
</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>