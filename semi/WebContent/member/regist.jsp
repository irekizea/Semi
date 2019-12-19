<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="regist.do" method="post">
	<article class="w-50">
		<div class="row">
			<h2>회원가입</h2>
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
			<input id="email-input" class="block-item input-item" type="email" name="email" required>	
		</div>
		
		<div>
			<input class="btn" type="submit" value="가입하기">
			<input class="btn" type="reset" value="지우기">		
		</div>
		
	
	</article>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>