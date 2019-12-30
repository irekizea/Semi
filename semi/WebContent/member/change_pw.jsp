<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
}
</style>

<div class="sun-container">
	<div align="center" class="sun-container-wrap vcenter">
		<form action="change_pw.do" method="post">

			<h1>신규 비밀번호 입력</h1>

			<input class="sun-input" type="password" name="pw" required>
			<input class="sun-button" type="submit" value="완료">
		</form>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>