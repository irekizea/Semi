<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<h3>아이디 찾기</h3>
	
	<form action="find.do"  method="post">
		<table border="0">
			<tr>
				<th>이메일 </th>
				<td>
				<input type="text" name="email" required>
				</td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="submit" value="찾기">
				</th>
			</tr>
		</table>
	</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>