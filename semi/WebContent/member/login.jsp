<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="login.do" method="post">
	<article class="w-40">
		<div align="center">
			<h2>로그인</h2>

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
      </table>

				<table>
					<tbody>
						<tr>
							<td>아이디 찾기 | 비밀번호 찾기 | 회원가입</td>
						</tr>
					</tbody>
				</table>
		</div>
	</article>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>

