<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f5f5f5;
}

.login-wrap {
	width: 460px;
	/* 내용물 가운데 정렬 */
	text-align: center;
	/* div 자신을 가운데 정렬 */
	margin-left: auto;
	margin-right: auto;
}

.login-wrap input[type=submit] {
	color: white;
	background-color: #000000;
	cursor: pointer;
}

/*        로고를 글자로 할 경우의 스타일*/
.login-wrap>.logo {
	font-size: 3rem;
	font-weight: 900;
	color: #000000;
}

a {
	color: gray;
	text-decoration: none;
}

hr {
	width: 460px;
}
</style>



<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
}
</style>


<div class="sun-container">
	<div align="center" class="sun-container-wrap vcenter">
		<h2>정보가 일치하지 않습니다</h2>

		<h3>
			<a href="login.jsp">다시 로그인하기</a>
		</h3>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>