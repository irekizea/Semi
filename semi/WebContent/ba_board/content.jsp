<%@page import="baens.BA_FileDto"%>
<%@page import="java.util.List"%>
<%@page import="baens.BA_FileDao"%>
<%@page import="baens.BA_BoardDto"%>
<%@page import="baens.BA_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int no=Integer.parseInt(request.getParameter("no"));
BA_BoardDao bdao = new BA_BoardDao();
BA_BoardDto bdto = bdao.get(no);

BA_FileDao fdao = new BA_FileDao();
List<BA_FileDto> flist=fdao.getList(no);
%>
<h1>헤더</h1>
<table border="1" width="70%">
	<tr>
		<td><%=bdto.getTitle()%></td>
	</tr>
	
	<tr>
		<td><%=bdto.getWriter()%></td>
	</tr>
	
	<tr>
		<td><%=bdto.getContent()%></td>
	</tr>

	<%if(flist.size() > 0){ %>
	<tr>
		<td>
			 <ul>
				 	<%for(BA_FileDto fdto : flist){ %>
					 	<li>
					 		<!-- 미리보기 출력 -->
					 		<img src="download.do?no=<%=fdto.getNo()%>" width="700" height="500">
					 	
					 		<%=fdto.getUploadname()%>
					 		(<%=fdto.getFilesize()%> bytes)
					 		
					 	</li>
				 	<%} %>
				 </ul>
		</td>
	</tr>
	<%} %>
	
	<tr>
		<td>
		댓글
		
		</td>
	</tr>
	
	<tr>
		<td align="right">
			<a href="#"><input type="button" value="추가"></a>
		</td>
	</tr>
</table>
<h1>푸터</h1>
