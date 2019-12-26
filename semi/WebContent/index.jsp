<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>    
    
<%@ page import ="semi.beans.board.BoardDao" %>
<%@ page import ="semi.beans.board.BoardDto" %>
<%
	BoardDao boardDao = new BoardDao();
	List<BoardDto> list =boardDao.getTitleList(); 
%>

	<jsp:include page="/template/header.jsp"></jsp:include>

    <style>
        /* 검색창 */      
    main{
        margin: auto;
        height: auto;
        width: 1000px;
    }
	
    section,
    article {
        padding: 0.5rem;
        margin: auto;
    }  

        
        .box {
            position: relative;
            width: 60%;
            text-align: center;
            margin-top:10%;
        }
        .search {
            position: absolute;
            width: 100%;
        }
        input[type=search]{
            width: 100%;
            border-style: none;
            border-bottom-style: solid;
            border-bottom-color: black;
            padding: 1rem;
            font-size: 20px;
            font-style: oblique;
        }
        input[type=search]:focus {
      		outline: none;
        }
        .topN *{
            text-align: center;
            color: black;
            display: inline-block;
            font-size: 17px;
            font-weight: bold;
            margin: 1rem;
        }
        .topN span {
            background: rgb(209,208,208);
            background: linear-gradient(0deg, rgba(209,208,208,1) 34%, rgba(240,240,240,1) 35%, rgba(246,246,246,1) 39%, rgba(255,255,255,0) 100%);
        }

    </style>

	
    <main>
    <article class="box">
    	<form action="<%=request.getContextPath()%>/board/searchResult.jsp" method="get">
        <input type="search" name="keyword" placeholder="what would you like to sarch?" required>
	        <br><br>
	        <div class="topN">
	        <%for(BoardDto boardDto:list) {%>
	            <a href="<%=request.getContextPath()%>/board/searchResult.jsp?keyword=<%=URLEncoder.encode(boardDto.getTitle(), "UTF-8") %>" >
					<span><%=boardDto.getTitle() %>  </span>
				</a>
	        <%} %>
	        </div>
		</form>
    </article>

<jsp:include page="/template/footer.jsp"></jsp:include>