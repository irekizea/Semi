<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
    <%--
	공통 모듈로 사용할 비밀번호 검사 페이지
	 - 목적지 정보(go)를 받아서 hidden 형태로 form에 첨부
 --%>
 
    <%
	String go = request.getParameter("go");
%>
    
<jsp:include page= "/template/header.jsp"></jsp:include>

<style>
	input.btn {
		margin: 30px 5px;
	    width: 120px;
	    line-height: 30px;
	    height: 35px;
	    text-align: center;
	    color: white;
	    background: black;
	    border: 1px solid #999;
	    outline: none;
	}
</style>

<div align="center">
<h2> 비밀번호 확인</h2>

<form action="check.do" method="get">

<input type="hidden"  name="go" value="<%=go%>">
<input class="sun-input" type="password" name="pw" required>

<br/>

<input class="btn sun-button" type="submit" value="확인">

</form>
	<%if(request.getParameter("error") != null){ %>
	<h4><font color="red">비밀번호가 맞는지 다시 확인 후 입력하세요</font></h4>
	<%} %>

</div>
<jsp:include page= "/template/footer.jsp"></jsp:include>

