<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	boolean isSearch = type != null && keyword != null;
	
	int pno = Integer.parseInt(request.getParameter("pno"));
	int count = Integer.parseInt(request.getParameter("count"));
	int navsize = Integer.parseInt(request.getParameter("navsize"));
	int pagesize = Integer.parseInt(request.getParameter("pagesize"));
	
	
	int pagecount = (count + pagesize) / pagesize;
	int startBlock = (pno - 1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize - 1);
	
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}
%>

<h4>
	<!-- 이전 버튼 -->
	<%if(startBlock > 1){ %>
		<%if(isSearch){ %>
			<a href="<%=request.getRequestURI()%>?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">이전</a>
		<%}else{ %>
			<a href="<%=request.getRequestURI()%>?pno=<%=startBlock - 1%>">이전</a>
		<%} %>
	<%} %>
    
    <%for(int i=startBlock; i <= finishBlock; i++){ %>
    	<%if(i == pno){ %>
			<a href="#"><%=i%></a>
		<%}else{ %>
			<%if(isSearch){ %>
				<a href="<%=request.getRequestURI()%>?type=<%=type%>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a></li>
			<%}else{ %>
				<a href="<%=request.getRequestURI()%>?pno=<%=i%>"><%=i%></a>
			<%} %>
		<%} %>
	<%} %>
    
    <!-- 다음 버튼 -->
    <%if(finishBlock < pagecount){ %>
		<%if(isSearch){ %>
			<a href="<%=request.getRequestURI()%>?type=<%=type%>&keyword=<%=keyword%>&pno=<%=finishBlock + 1%>">다음</a>
		<%}else{ %>
			<a href="<%=request.getRequestURI()%>?pno=<%=finishBlock + 1%>">다음</a>
		<%} %>
	<%} %>
	
</h4>