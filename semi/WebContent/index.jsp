<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Alcohol Wiki</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">


<style>
* {
	margin: auto;
}

.mainlogo {
	width: 18%;
	height: 200px;
	margin-top: 172px;
	margin-bottom: 2rem;
}

.search {
	width: 60%;
	height: 45px;
	margin-top: 2rem;
}

.button {
	margin-top: 2rem;
	width: 90px;
	height: 30px;
	margin-bottom: 200px;
	font-size: 12px;
}

.input {
	width: 60%;
	margin: auto;
	text-align: center;
}

form>* {
	text-align: center;
	font-size: 20px
}

.loginlogo {
	width: 50px;
	height: 50px;
	margin-right: 10px;
	margin-top: 10px;
}
</style>
</head>

<body>
	<div align="right">
	<a href="<%=request.getContextPath()%>/member/login.jsp">
		<img src="<%=request.getContextPath()%>/image/login.png" class="loginlogo">
	</a>
	</div>
	
	<div align="center">
		<img src="<%=request.getContextPath()%>/image/capture.png" class="mainlogo">
	</div>
	
	<h1 align="center">Welcome to Alcohol Wiki</h1>
	
	<div class="input">
		<form action="board/searchResult.jsp" method="get">
		
			<input type="search" class="search" name="keyword"
				placeholder="검색어를 입력하세요" required> <br>
			<input type="submit" class="button" value="검색">
		</form>
	</div>
	
</body>
</html>