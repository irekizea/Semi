<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div align="center">
		<h2>로그인</h2>
		<form action="login.do" method="post">
			<table border="0">
				<tr>
					<td><input type="text" name="id" placeholder="ID"required">
					</td>
				</tr>
				<tr>
					<td><input type="password" name="pw" placeholder="pw"required">
					</td>
				</tr>
				<tr>
					<td><input type="checkbox"> 아이디 저장하기</td>
				</tr>
				<tr>
					<td align="right"><input type="submit" value="Login">
					</td>
				</tr>
			<table>
			<tbody>
			<tr>
			 <td>아이디 찾기 |
			비밀번호 찾기 |
			회원가입</td>
			</tr>
			</tbody>
			</table>
			</table>
		</form>
	</div>
</body>
</html>