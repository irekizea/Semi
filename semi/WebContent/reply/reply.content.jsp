<%@page import="java.util.List"%>
<%@page import="semi.beans.board.BoardTextDto"%>
<%@page import="semi.beans.board.BoardDto"%>
<%@page import="semi.beans.board.BoardTextDao"%>
<%@page import="semi.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>






</head>
<body>
	<h1>헤더</h1>
			<div align="center">
		<h2>토론 게시판</h2>
		<h5> 지나친 비방은 자제해주세요</h5>
		
		<table border="1" width="90%">
		
			<thead>
			<tr>	
				<th>작성자</th>
				<th>날짜</th>
				<th width="70%">내용</th>
			</tr>
			</thead>
			</table>
			<tfoot>
					<tr>
					<td colspan="5" align="">
						<a href="#">글쓰기</a>
					</tr>
			</tfoot>
	
	</div>
	
		<h4>[이전]1 2 3 4 5 6 7 8 9 10[다음]</h4>

	
	<h1>푸터</h1>
</body>
</html>





