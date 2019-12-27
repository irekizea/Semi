<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
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
	display: table;
	width: 100%;
}
</style>

<form action="regist.do" method="post">
	<article class="w-50">
		<div class="row">
			<h2 style="margin-left: 40px;">회원가입</h2>
		</div>
		
		<div class="row-left">
			<label for="id=input">아이디</label>
			<input id="id-input" class="block-item input-item" type="text" name="id" required>
		</div>
		
		<div class = "row-left">
			<label for="pw-input">비밀번호</label>
			<input id="name-input" class="block-item input-item" type="password" name="pw" required>		
		</div>
		
		<div class = "row-left">
			<label >이메일</label>
			<input id="email-input" class="block-item input-item" type="text" name="email" required>	
		</div>
		
		<div style="margin-left: 80px;">
			<input class="btn" type="submit" value="가입하기">
			<input class="btn" type="reset" value="지우기">		
		</div>
		
	</article>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>