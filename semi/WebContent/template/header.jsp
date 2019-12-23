<%@page import="semi.beans.board.BoardDto"%>
<%@page import="semi.beans.board.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
    	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">







</head>
<body test>
        <header>
           <div>
           		<a href="<%=request.getContextPath()%>">
                <img src="<%=request.getContextPath()%>/image/logo2.png" width=50px. height=auto>
                </a>
           </div>

        </header>
        
			<!-- 메뉴 불러오기 -->
			<jsp:include page="/template/menu.jsp"></jsp:include>
			
        <section>



