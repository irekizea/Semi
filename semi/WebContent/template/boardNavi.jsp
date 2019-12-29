<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
 	String type = request.getParameter("type");
 	String keyword = request.getParameter("keyword");
 	
 	int pno = Integer.parseInt(request.getParameter("pno"));
 	int count = Integer.parseInt(request.getParameter("count"));
 	int navsize = Integer.parseInt(request.getParameter("navsize"));
	int startBlock = (pno-1)/navsize * navsize +1;
	int pageSize = Integer.parseInt(request.getParameter("pageSize"));
	
	int finishblock = startBlock +(navsize-1);
	int pagecount = (count+pageSize)/pageSize;
	
	if(finishblock>pagecount){
		finishblock = pagecount;
		
	
	}
 	
	%>
	
	


	 <h4>
	  			<%if(startBlock>1){ %>
	  	
	  	 			<a href="<%=request.getRequestURI()%>?pno=<%=startBlock - 1%>&keyword=<%=keyword%>">[이전]</a> 
				 <%} %>
				 <% for(int i=startBlock; i<= finishblock; i++){%>	
				 	<%if(i==pno){ %>
				 		<%=i %>
				 	<%}else {%>
				 	
	 	 	 			<a href="<%=request.getRequestURI()%>?pno=<%=i%>&keyword=<%=keyword%>"><%=i%></a>
	 	 	 						<%} %>
	  
	 	 	 	<%} %>
	 	 	 <%if(finishblock<pagecount){ %>
	 	 	
	 	 	<a href="<%=request.getRequestURI()%>?pno=<%=finishblock + 1%>&keyword=<%=keyword%>">[다음]</a>
			<% } %>

	 	 
	 	</h4>
 	