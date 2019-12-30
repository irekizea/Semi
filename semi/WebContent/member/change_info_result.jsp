<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>
body {
	background: #f5f5f5;
}
.s{
height: 550px;
}
</style>

<div class="s">
<br><br>
<div class="sun-container">
	<div align="center" class="sun-container-wrap vcenter">
		<h2>정보 변경이 완료되었습니다</h2>
		<h4>
			<a href="<%=request.getContextPath()%>">home으로 </a>
		</h4>
	</div>
</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>