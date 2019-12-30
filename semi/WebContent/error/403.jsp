<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>

.hrcenter{
font-size:2.5em;
}
.hrline {
border-bottom:2px solid black;
font-size:1.5em;
}

* {
	box-sizing: border-box;
}

body {
	background-color: #f5f5f5;
	margin:0px;
}

.login-wrap {
	height:600px;
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
<br><br><br><br><br><br><br><br><br>

				<h1 class="hrcenter" align="center">Alcohole Wiki</h1>
				<br>
<h2 class="hrline" width=100% align="center">403 Forbidden(접근이 금지되었습니다)</h2>
<div class="all">
	<div class="login-wrap">
		<div style="display: table; width: 350;">
			<div class="display:table-cell; vertical-align:center;">


			<!--  -->
				<p>가능성이 높은 원인: 이 웹사이트를 보려면<br> 로그인해야 합니다.</p>
				</div>
		</div>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>				