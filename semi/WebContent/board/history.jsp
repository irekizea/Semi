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

<style>
    /* history style */
    .history-title{
        font-weight: bold;
        font-size: xx-large;
    }
    .history-board {
        border-collapse: collapse;
    }
    .history-board .board-style {
    	padding: 1rem 0;
        border-bottom: 1px dotted gray;
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


<article class="w-90">

    <p class="history-title"><%=keyword %></p>

    <div align=left>
        <table class="history-board" border="0" width = 80%>            
            <tr>
                <td>수정시간(버전)</td>
                <td>좋아요/싫어요</td>
                <td>작성자</td>
            </tr>
            
            <tr class=row-empty></tr>
            
           	<% for(HistoryDto hdto : list){ %>
            <tr  class="board-style">
                <td><a href="#"><%=hdto.getBoardtextudate() %></a></td>
                <td class="liked">(+/- count) </td>
                <td>
                        <%if(hdto.getWriter()!=null){ %>
                			<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?writer=<%=hdto.getWriter() %>">
                				<%=hdto.getWriter() %>
                			</a>
						<%} else {%>
							<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?writer=<%=hdto.getIp_addr() %>">
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