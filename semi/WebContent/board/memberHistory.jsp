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
	HistoryDao historyDao = new HistoryDao();
	HistoryDto historyDto = new HistoryDto();
	String writer=request.getParameter("writer");
	String ip_addr=request.getParameter("ip_addr");
	
	int pagesize = 10;
	int navsize = 10;
	int count= historyDao.getCount(writer, ip_addr);
	
	int pno; //페이지 번호
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
	}
	catch(Exception e){
		pno = 1;
	}
	
	int finish = count-(pno-1) * pagesize;
	int start = finish - (pagesize - 1);
	
	List<HistoryDto> list = historyDao.memberHis(writer, ip_addr, start, finish);	
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">
<style>
	body {
		background: #f5f5f5;
	}
	
    /* memberHistory style */
    .his-board{
        border-collapse: collapse;
    }
    .his-board * {
        padding: 10px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
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
    }
    .his-board .time,
    .his-board .writer{
        width: 3rem;
        text-align: center;
    }
    
   		/* a태그 하이퍼링크 표시 제어 */
        
    	/* a태그 하이퍼링크 표시 제어 */
    .his-board a:link { color: black; text-decoration: none;}
    .his-board a:visited { color: black; text-decoration: none;}
    .his-board a:hover { text-decoration: underline;}
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
        <table class="his-board" width=90% border="0" style="table-layout: fixed;"> 
            <colgroup>
                <col width="20%">
                <col width="50%">
                <col width="25%">
            </colgroup>
            <tr>
                <td colspan="3">
                    <span>
                       	<%if(request.getParameter("writer")!=null){ %>
								" <%=request.getParameter("writer") %> "
						<% } 
						else{ %>
								" <%=request.getParameter("ip_addr") %> "
						<%} %>
                    </span>
                    <span>의 기여목록</span>
                </td>
            </tr>     
            <tr class="row-empty"></tr>      
            <tr class="his-title">
                <td class="time">Write Time</td>
                <td class="content">Content</td>
                <td class="title">TITLE</td>
            </tr>
            <%for(HistoryDto memberHis : list){ %>
            <tr class="his-content">
                <td class="time" style="font-size: 13px;">
                    <%=memberHis.getBoardtextudate() %>
                </td>
                <td class="content">
                        <%=memberHis.getContent() %>
                    <span class="liked" style="font-weight: lighter; font-size: 12px;"></span>
                </td>
                <td class="title">
                    <%=memberHis.getBoardtitle() %>
                </td>
            </tr>
            <%} %>
        </table>
    </div>
    
    <!-- 내비게이터 -->
    <div align=center>
    <jsp:include page="/template/boardNavi.jsp">
		<jsp:param name="pno" value="<%=pno%>"/>
		<jsp:param name="count" value="<%=count%>"/>
		<jsp:param name="navsize" value="<%=navsize%>"/>
		<jsp:param name="pageSize" value="<%=pagesize%>"/>
	</jsp:include>
    </div>
    
</article>

<jsp:include page="/template/footer.jsp"></jsp:include>