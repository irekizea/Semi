<<<<<<< HEAD
<%@page import="semi.beans.board.BA_Board.BA_FileDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.board.BA_Board.BA_FileDao"%>
<%@page import="semi.beans.board.BA_Board.BA_BoardDto"%>
<%@page import="semi.beans.board.BA_Board.BA_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int no=Integer.parseInt(request.getParameter("no"));
BA_BoardDao bdao = new BA_BoardDao();
BA_BoardDto bdto = bdao.get(no);

BA_FileDao fdao = new BA_FileDao();
List<BA_FileDto> flist=fdao.getList(no);

String userId = (String)session.getAttribute("id");
String grade = (String)session.getAttribute("grade");

boolean isAdmin = grade.equals("관리자");

%>
<h1>헤더</h1>
<link rel="stylesheet" type="text/css" href="../css/semi_common.css">

<article class="w-40">
<!--토론 부분-->
    <div class="content-wrap">
<!--제목 부분-->
        <div class="content-top">
           <h2 class="title"><%=bdto.getTitle()%></h2>
           <h3 class="subtitle">소제목</h3>
        </div>
        
<!--내용 부분--> 
	<!--(주제 생성)작성된 댓글 내용-->			    
		<div class="content-item right">
            <div class="date">
            <%if(bdto.getUdate() != null){%>
					<h5><%=bdto.getUdate()%></h5>
				<%} else{%>
					<h5><%=bdto.getWdate()%></h5>
				<%} %>
            </div>
            <div>
                <%if(flist.size() > 0){ %>
				 	<%for(BA_FileDto fdto : flist){ %>
					 		<!--파일 미리보기 출력 -->
					 		<img src="download.do?no=<%=fdto.getNo()%>" class="img">
					 		<h5>
					 		<%=fdto.getUploadname()%>
					 		(<%=fdto.getFilesize()%> bytes)
					 		</h5>
				 	<%} %>
				<%} %>
            </div>
            <%=bdto.getContent()%>
            <h5 id="writer left"><%=bdto.getWriter()%></h5>
        </div>

		      
		      
		      
	<!--(주제 생성 후)작성된 댓글 내용-->		 
<%-- 	<%if(bdto.getWriter().equals(rdto.getWriter())||isAdmin) {%> --%>
<!-- 		<div class="content-item right">                   -->
<%--     <%} else {%> --%>
        <div class="content-item left" align="right">    
<%--     <%} %>     --%>
           <div class="date">
                <h5>댓글 작성 시각</h5>
            </div>
<!--              <div> -->
<%--                 <%if(flist.size() > 0){ %> --%>
<%-- 				 	<%for(BA_FileDto fdto : flist){ %> --%>
<!-- 					 		파일 미리보기 출력 -->
<%-- 					 		<img src="download.do?no=<%=fdto.getNo()%>" class="img"> --%>
<!-- 					 		<h5> -->
<%-- 					 		<%=fdto.getUploadname()%> --%>
<%-- 					 		(<%=fdto.getFilesize()%> bytes) --%>
<!-- 					 		</h5> -->
<%-- 				 	<%} %> --%>
<%-- 				<%} %> --%>
<!--             </div> -->
            	댓글내용 표시 될 자리
            <h5 id="writer right">댓글 작성자</h5>
        </div>
        
        
        <!--좋아요 싫어요 표시-->
        <a href="like.do?no=<%=no%>">좋아요</a> <%=bdto.getUp()%>
        <a href="dislike.do?no=<%=no%>">싫어요</a> <%=bdto.getDown()%>
        
        
        
<!--토론 작성 부분-->
<form action="#" method="post">
	<input type="hidden" name="writer" value="<%=userId%>">
    <div class="reply">
        <h4>댓글달기</h4>
        <h6>[알림] 비로그인 상태로 토론에 참여합니다. 토론 내역에 IP(?)가 영구히 기록됩니다.</h6>
        <textarea name="reply_title" id="rt" rows="3" cols="80" required></textarea><br><br>

        <div align="right">
            <input type="submit" value="전송" id="bt">
        </div>
    </div>
</form>
    </div>
</article>

<h1>푸터</h1>
