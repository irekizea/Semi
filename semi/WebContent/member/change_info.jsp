<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
}
.btnsun-button input[type=submit] {
	color: white;
	background-color: #000000;
	cursor: pointer;
}

</style>

<div class="sun-container">
	<div align="center" class="sun-container-wrap vcenter">

		<h2>회원 정보 수정</h2>

		<form action="change_info.do" method="post">

			<table border="0">
				<tr>
					<th>이메일</th>
					<td><input class="sun-input" type="email" name="email" placeholder="이메일">
					</td>
				</tr>


				<tr>
					<th colspan="2"><input class="btn sun-button" type="submit"  value="수정하기" ></th>
				</tr>
			</table>
		</form>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>