<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	String go = request.getParameter("go");
%>
    
<jsp:include page= "/template/header.jsp"></jsp:include>

<div align="center">
<h2> 비밀번호 확인</h2>

<form action="check.do" method="get">

<input type="hidden"  name="go" value="<%=go%>">
<input type="password" name="pw" required>

<input type="submit" value="확인">

</form>
	<%if(request.getParameter("error") != null){ %>
	<h4><font color="red">비밀번호가 맞는지 다시 확인 후 입력하세요</font></h4>
	<%} %>

</div>
<jsp:include page= "/template/footer.jsp"></jsp:include>

