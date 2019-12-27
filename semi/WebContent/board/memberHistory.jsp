<%@page import="semi.beans.board.HistoryDto"%>
<%@page import="semi.beans.board.HistoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.InetAddress" %>

<%@ page import = "semi.beans.board.BoardDao" %>
<%@ page import = "semi.beans.board.BoardDto" %>
<%@ page import = "semi.beans.board.BoardTextDao" %>
<%@ page import = "semi.beans.board.BoardTextDto" %>
<%@ page import = "semi.beans.board.BoardReplyDao" %>
<%@ page import = "semi.beans.board.BoardReplyDto" %>

<%
	String writer=request.getParameter("writer");
	String ip_addr=request.getParameter("ip_addr");
	
	HistoryDao historyDao = new HistoryDao();
	List<HistoryDto> list = historyDao.memberHis(writer, ip_addr);
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">
<style>
    /* memberHistory style */
    .his-board{
        border-collapse: collapse;
    }
    .his-board * {
        padding: 10px;
    }

    .his-board tr:nth-child(1)  {
        font-weight: bold;
    }
    .his-board .his-title{
        border-top: 2px solid lightgray;
        border-bottom: 2px solid lightgray;
    }
    .his-board .his-content {
        border-bottom: 1px solid lightgray;
    }

    .his-board .title{
        width: 3rem;
        text-align: left;
    }
    .his-board .content{
        width: 10rem;
        text-align: left;
        height: 5px;
    }
    .his-board .time,
    .his-board .writer{
        width: 3rem;
        text-align: center;
    }

</style>
<!--
    var result=3;
    function liked(){
        var tag = document.querySelector(".liked");
        if(result){
            tag.classList.remove("hate");
            tag.classList.add("liked");
        }        
    }
    function hate(){
        var tag = document.querySelector(".liked");
        if(result<0){
            tag.classList.remove("liked");
            tag.classList.add("hate");
        }    
    }
</script>
-->
	
<jsp:include page="/template/header.jsp"></jsp:include>

<article>
    <div align=center>
        <table class="his-board" width=90% border="1"> 
            <tr>
                <td colspan="3">
                    <p>
                       	<%if(request.getParameter("writer")!=null){ %>
								"<%=request.getParameter("writer") %>"
						<% } 
						else{ %>
								"<%=request.getParameter("ip_addr") %>"
						<%} %>
                    </p>
                    <span>의 기여목록</span>
                </td>
            </tr>           
            <tr class="his-title">
                <td class="time">Write Time</td>
                <td class="title">대주제</td>
                <td class="content">내용</td>
            </tr>
            <!-- for문 위치 -->
            <tr class="his-content">
                <td class="time" style="font-size: 13px;">
                    <a href="#">수정시간</a>
                </td>
                <td class="title">
                    대주제
                </td>
                <td class="content">Content<span class="liked" style="font-weight: lighter; font-size: 12px;">(+/- count)</span>
                </td>
            </tr>
        </table>
    </div>
</article>


<div align = "center">

<table border = "1" style = width:90%>
	<tr>
		<th>
		<%if(request.getParameter("writer")!=null){ %>
				"<%=request.getParameter("writer") %>"의 기여목록
		<% } 
			else{ %>
				"<%=request.getParameter("ip_addr") %>"의 기여목록
		<%} %>
		</th>
	</tr>
	<%for(HistoryDto memberHis : list){ %>
	<tr>
		<td>
			project
		</td>
		<td>
		 	<%=memberHis.getBoardtitle() %>
		</td>
		<td>
			최근 수정 시간
		</td>
		<td>
		 	<%=memberHis.getBoardtextudate() %>
		</td>
	
	</tr>
	<tr>
		<td>
		<%=memberHis.getContent() %>
		</td>
	</tr>
	<%} %>

</table>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>