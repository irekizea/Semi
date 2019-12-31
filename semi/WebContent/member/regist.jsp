<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>


<style>
.hei{
height:600px;
}


>>>>>>> branch 'dahye' of https://github.com/irekizea/Semi
	input.input-item {
    width: 300px;
    line-height: 30px;
    padding: 0 10px;
}

div.row-left > label {
    width: 70px;
    display: inline-block;
    text-align: left;
}

.row-left {
    margin: 10px 0;
}

.row > h2 {
    margin: 30px 0;
}

input.btn {
    width: 120px;
    line-height: 30px;
    height: 35px;
    text-align: center;
    color: white;
    background: black;
    margin: 0 5px;
    border: 1px solid #999;
    outline: none;
}

article.w-50 {
    display: table-cell;
    vertical-align: middle;
    text-align: center;
    /* background: #f5f5f5; */
}

body {
	background: #f5f5f5;
	
}

.row-left {
	text-align: center;
}

form {
height: 600px;
	display: table;
	width: 100%;
}
</style>

<form action="regist.do" method="post">
<!-- <div class="auu" align="center" > -->

<!-- 	<article class="w-50"> -->

	<div class="row">
		<h2 style="margin-left: 25px;">회원가입</h2>
		</div>

		<div align="center">
			<table>
			<tr>
				<td>아이디<td>
				<td><input id="id-input" class="block-item input-item sun-input" type="text" name="id" required></td>
			</tr>
			<tr>
				<td>비밀번호<td>
				<td><input id="pw-input" class="block-item input-item sun-input" type="password" name="pw" required></td>
			</tr>
			<tr>
				<td>이메일<td>
				<td>	<input id="email-input" class="block-item input-item sun-input" type="email" name="email" required></td>
			</tr>
		</table>
<br>

		<div style="margin-left: 50px;">
			<input class="btn sun-button" type="submit" value="가입하기"> 
		</div>
		<h5>※ 저희 알콜위키는 회원가입 후 탈퇴가 불가능합니다. </h5>
	</div>
		
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>