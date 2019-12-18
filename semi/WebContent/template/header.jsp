<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "semi.beans.BoardDao" %>
<%@ page import = "semi.beans.BoardDto" %>
    
<%
	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(keyword);   
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ALcohol wiki - <%=keyword %></title>
    	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
</head>
<body test>
    <main>
        <header>
           <div>
                <img src="http://www.placehold.it/150x50"> 대략 로고 ..
           </div>
           <div>
              검색창...?
           </div>
        </header>
        
			<!-- 메뉴 불러오기 -->
			<jsp:include page="/template/menu.jsp"></jsp:include>
			
        <section>


