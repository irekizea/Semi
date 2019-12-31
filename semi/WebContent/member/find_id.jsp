<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
}
.s{
height: 580px;
}
</style>

<div class="s">
<div class="sun-container">

	<div align="center" class="sun-container-wrap">
	<br><br><br><br>
		<h3 style="margin-left: 55px;">아이디 찾기</h3>

		<form action="find_id.do" method="post">
			<table class="sun-table" border="0">
				<tr>
					<th><label for="email">이메일</label></th>
					<td><input class="sun-input" type="text" id="email" name="email" required></td>
				</tr>
				<tr>
					<th colspan="2" style="text-align: right;"><input class="sun-button" type="submit" value="찾기"></th>
				</tr>
			</table>
		</form>
	</div>
</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>