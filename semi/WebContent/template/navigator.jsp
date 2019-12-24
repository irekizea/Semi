<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


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
	<%if(startBlock > 1) {%>
		<a href="<%=request.getRequestURI()%>?pno=<%=startBlock-1%>">[이전]</a>
	<%} %>
	
	<%for(int i=startBlock; i<=finishBlock; i++) {%>
		<%if(i==pno) {%>
			<%=i %>
		<%} else {%>
			<a href="<%=request.getRequestURI()%>?pno=<%=i%>"><%=i%></a>	
		<%} %>
	<%} %>
	
	<%if(finishBlock < pagecount) {%>
		<a href="<%=request.getRequestURI()%>?pno=<%=startBlock+1%>">[다음]</a>
	<%} %>
</h4>