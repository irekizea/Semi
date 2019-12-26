<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String context=request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Alcohol wiki - 어디까지 마셔봤니?</title>
    <link rel="stylesheet" type="text/css" href="<%=context%>/css/semi_common.css"> 
</head>
<body>
     <div class="fixed">
     <nav class="tab">
     	<a href="<%=context%>" class="logo">Alcohol</a>
        <ul>
            <li><a href="<%=context%>/board/history.jsp?keyword=<%=request.getParameter("keyword")%>">HISTORY</a></li>
            <li>
                <a href="<%=context%>/ba_board/list.jsp">DEBATE</a>
          
                <ul>
                    <li><a href="<%=context%>/ba_board/write.jsp">새주제 등록</a></li>
                    <li><a href="<%=context%>/ba_board/list.jsp">토론 목록</a></li>
                </ul>
            
            </li>
            <li><a href="<%=context%>/member/regist.jsp">JOIN</a></li>
            <li><a href="<%=context%>/member/login.jsp">LOGIN</a></li>
         </ul>
    </nav>
    </div>
<article>
<br><br><br><br>
    