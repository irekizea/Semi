
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<h2>일시적인 서버 오류가 발생했습니다</h2>
<!-- <img src="http://placehold.it/800x400"> -->
<img src="<%=request.getContextPath()%>/image/500.jpg" width="800" height="400">

<jsp:include page="/template/footer.jsp"></jsp:include>
