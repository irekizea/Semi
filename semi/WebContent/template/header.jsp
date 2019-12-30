<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String context=request.getContextPath();
String userId = (String)session.getAttribute("id");
String grade = (String)session.getAttribute("grade");
boolean isAdmin;
if(grade!=null){
	if(grade.equals("관리자")){
		isAdmin = true;
	}else{
		isAdmin = false;
	}
}else{
	isAdmin = false;
}
boolean isLogin = userId != null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Alcohol wiki - 어디까지 마셔봤니?</title>
    <link rel="stylesheet" type="text/css" href="<%=context%>/css/semi_common.css"> 
</head>
<body>
     <%if(isLogin) {%>
     <div class="fixed">
	 <nav class="btab">
        <a href="<%=context%>" class="blogo">Alcohol</a>
        <ul>
            <li><a href="<%=context%>/board/history_total.jsp">HISTORY</a></li>
            <li>
                <a href="<%=context%>/ba_board/list.jsp">DEBATE</a>
                
                <ul>
                    <li><a href="<%=context%>/ba_board/write.jsp">새 주제 등록</a></li>
                    <li><a href="<%=context%>/ba_board/list.jsp">토론 목록</a></li>
                </ul>
            
            </li>
            <li ><a href="<%=context%>/member/info.jsp">MY PAGE</a></li>
            <li><a href="<%=context%>/member/logout.do">LOGOUT</a></li>
            <%if(isAdmin) {%>
            <!--관리자일 경우-->
            <li>
               <a href="<%=context%>/admin/list.jsp">REFERENCE</a>
                <ul>
                    <li>
                        <a href="<%=context%>/admin/list.jsp" id="list">회원 조회</a>
                    </li>
                    <li>
                        <a href="<%=context%>/admin/block_list.jsp" id="list">차단회원 조회</a>
                    </li>
                </ul>
            </li>
          <%} %>
         </ul>
         <div class="bsearch-box">
			<form action="<%=request.getContextPath()%>/board/searchResult.jsp" method="get">
				<input type="text" name="keyword" placeholder="search" required>
			</form>
         </div>
    </nav>
    </div>
<section>
     <%} else {%>
     <div class="fixed">
     <nav class="tab">
     	<a href="<%=context%>" class="logo">Alcohol</a>
        <ul>
            <li><a href="<%=context%>/board/history_total.jsp">HISTORY</a></li>
            <li>
                <a href="<%=context%>/ba_board/list.jsp">DEBATE</a>
          
                <ul>
                    <li><a href="<%=context%>/ba_board/list.jsp">토론 목록</a></li>
                </ul>
            
            </li>
            <li><a href="<%=context%>/member/regist.jsp">JOIN</a></li>
            <li><a href="<%=context%>/member/login.jsp">LOGIN</a></li>
         </ul>
         <div class="search-box">
			<form action="<%=request.getContextPath()%>/board/searchResult.jsp" method="get">
				<input type="text" name="keyword" placeholder="search" required>
			</form>
         </div>
    </nav>
    </div>
<section>
     <%} %>
<br><br><br><br>
    