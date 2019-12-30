<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
}
</style>

<div class="sun-container">
	<div align="center" class="sun-container-wrap">

		<h3>비밀번호 찾기</h3>

		<form action="find_pw.do" method="post">
			<table class="sun-table" border="0">
				<tr>
					<th>아이디</th>
					<td><input class="sun-input" type="text" name="id" required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input class="sun-input" type="text" name="email" required></td>
				</tr>
				<tr>
					<th colspan="2" style="text-align: right;"><input class="sun-button" type="submit" value="찾기"></th>
				</tr>
			</table>
		</form>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>