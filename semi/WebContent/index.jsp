<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>    
    
<%@ page import ="semi.beans.board.BoardDao" %>
<%@ page import ="semi.beans.board.BoardDto" %>
<%
	BoardDao boardDao = new BoardDao();
	List<BoardDto> list =boardDao.getTitleList(); 
%>
 <!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Alcohol Wiki-세상의 모든 알콜</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">

<script src="https://kit.fontawesome.com/3f30b7cd52.js" crossorigin="anonymous"></script>
<style>

/* body[test] { */
/* 	border: dotted 1px black; */
/* } 개발용 점 윤곽선*/ 

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
	width: 50%;
	height: 35px;
	margin-top: 2rem;
    border-radius: 20px;
    border-color : darkgray;
    font-size : 20px;
    padding-left: 20px;
    border-width: 1px;
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
    border:0px;
}

.form {
	text-align: center;
	font-size: 20px;
 
}
.loginlogo {
	width: 50px;
	height: 50px;
	margin-right: 10px;
	margin-top: 10px;
}
    
    #mainbtn{
        position :absolute;
        top: 553px;
        right: 35%;
        border:none;
        background-color: #fff;
        
        
    } 
    .fa-search{
        font-size :20px;
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
		<img src="<%=request.getContextPath()%>/image/logo2.png" class="mainlogo">
	</div>
	
	<h1 align="center">Welcome to Alcohol Wiki</h1>
	
	<div class="input">

		<form action="<%=request.getContextPath()%>/board/searchResult.jsp" method="get">
			<input type="text" class="search" name="keyword"
				placeholder="검색어를 입력하세요" required> 
				<button id="mainbtn"><i class="fas fa-search"></i></button>
				<p>
					<%for(BoardDto boardDto:list) {%>
						<a href="<%=request.getContextPath()%>/board/searchResult.jsp?keyword=<%=URLEncoder.encode(boardDto.getTitle(), "UTF-8") %>" >
							<span><%=boardDto.getTitle() %>  </span>
						</a>
					<%} %>
				</p>
		</form>
	</div>
	
</body>
</html>