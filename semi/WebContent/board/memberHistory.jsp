<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String writer = request.getParameter("writer"); 
	
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<article>
	<section>
		<div>
			"<%= %>"
			기여목록
		</div>
		
		<div>" "의 기여목록을 가져오자</div>
	</section>
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>