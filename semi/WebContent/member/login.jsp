
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f5f5f5;
	margin:0px;
}

.login-wrap {
	height:550px;
	width: 310px;
	
	/* 내용물 가운데 정렬 */
	text-align: center;
	/* div 자신을 가운데 정렬 */
	margin-left: auto;
	margin-right: auto;
}

.login-wrap input[name=id], .login-wrap input[name=pw], .login-wrap input[type=submit]
	{
	width: 100%;
	margin: 10px 0px;
	padding: 10px;
	font-size: 13px;
	font-family: 굴림;
	background-color: white;
	border: 1px solid #999;
}

.login-wrap input[name=id]:focus, .login-wrap input[name=pw]:focus {
	border: 1px solid #000000;
}

/*        >를 사용하면 바로 아래에 있다는 뜻(직계자식태그) */
/*        .login-wrap > form > input[type=submit]{*/

/*        띄어쓰기를 하면 내부에 있다는 뜻(후손태그)*/
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
	width: 310px;
}

body {
	background: #f5f5f5;
}
</style>

<jsp:include page="/template/header.jsp"></jsp:include>
<br><br><br><br>
<div class="all">
	<div class="login-wrap">
		<div style="display: table; width: 100%;">
			<div class="display:table-cell; vertical-align:center;">

				<h1>Alcohole Wiki</h1>
				<form action="login.do" method="post">
					<input class="sun-input" type="text" name="id" placeholder="아이디" required autocomplete="off">
					<input class="sun-input" type="password" name="pw" placeholder="비밀번호" required autocomplete="off">
					<input class="sun-button" type="submit" value="로그인">

				</form>
			</div>
			<hr>
			<div align="center">
				<a href="../member/find_id.jsp">아이디 찾기</a> | <a
					href="../member/find_pw.jsp">비밀번호 찾기</a> | <a
					href="../member/regist.jsp">회원가입</a>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>
