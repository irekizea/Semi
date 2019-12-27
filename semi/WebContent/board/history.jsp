<%@page import="java.util.List"%>
<%@page import="semi.beans.board.HistoryDao"%>
<%@page import="semi.beans.board.HistoryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String keyword = request.getParameter("keyword");
	HistoryDto dto = new HistoryDto();
	HistoryDao dao = new HistoryDao();
	List<HistoryDto> list = dao.hList(keyword);
	
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">    
<style>
    /* history style */
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
    .his-board .no {
        width: 4rem;
        text-align: center;        
    }
    .his-board .content {
        width: 10rem;
        text-align: left;
    }
    .his-board .time,
    .his-board .writer{
        width: 4rem;
        text-align: center;
    }

    /* 좋아요, 싫어요 -> javaScript 구현 */
    .liked {
        color: blue;
    }
    .hate {
        color: red;
    }

</style>

<!--
<script>
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
        <table class="his-board" width=90% border="0" style="table-layout: fixed"> 
        	<colgroup>
                <col width="10%">
                <col width="50%">
                <col width="20%">
                <col width="20%">
            </colgroup>
            <tr>
                <td colspan="4"><p>HISTORY</p></td>
            </tr>           
            <tr class="his-title">
                <td class="no">No</td>
                <td class="sub">Content</td>
                <td class="time">Update Time</td>
                <td class="writer">Writer</td>
            </tr>
            <% for(HistoryDto hdto : list){ %>
            <tr class="his-content">
                <td class="no" style="font-size: 13px;">글번호</td>			<!-- history 글번호. no 또는 rownum -->
                <td class="content">
                	<a href="#">
                		<%=hdto.getContent() %>
                	</a>
                	<span class="liked" style="font-weight: lighter; font-size: 12px;">(+/- count)</span>
                </td>
                <td class="time" style="font-size: 13px;">
                    <%=hdto.getBoardtextudate() %>								<!-- 수정시간 -->
                </td>
                <td class="writer" style="font-size: 13px;">						<!-- 작성자 id, ip -->
                    <%if(hdto.getWriter()!=null){ %>
                			<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?writer=<%=hdto.getWriter() %>">
                				<%=hdto.getWriter() %>
                			</a>
					<%} else {%>
							<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?ip_addr=<%=hdto.getIp_addr() %>">
                				<%=hdto.getIp_addr() %>
                			</a>
					<%} %>
                </td>
            </tr>
    	 <%} %>
        </table>
    </div>
</article>


<jsp:include page="/template/footer.jsp"></jsp:include>