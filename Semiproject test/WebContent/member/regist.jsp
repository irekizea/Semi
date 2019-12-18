<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>

<body>
<form action="regist.do" method="post">
	<div align="center">
		<br>
		<h1>회원가입</h1>
		<table border="0">
			<tr>
				<th>아이디</th>
			</tr>
			<tr>
				<td><input type="text" name="id" required>
				<td>
			</tr>
			<tr>
				<th>비밀번호</th>
			</tr>
			<tr>
				<td><input type="password" name="pw"  required>
				<td>
			</tr>
			<tr>
				<th>비밀번호재확인</th>
			</tr>
			<tr>
				<td><input type="password" name="pw"  required>
				<td>
			</tr>

			<tr>
				<th>이메일</th>
			</tr>
			<tr>
				<td><input type="text" name="email" required>
				<td>
			</tr>
			
			<tr>
				<th><input type="submit" value="가입하기"></th>
			</tr>
		</table>
		
	</div>
</form>
</body>

</html>