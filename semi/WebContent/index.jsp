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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Alcohol wiki - 어디까지 마셔봤니?</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">
    <style>
      
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

        /* 검색창 */
        
        .box {
            position: relative;
            width: 70%;
            text-align: center;
            margin-top:35%;
        }
        .search {
            position: absolute;
            width: 100%;
        }
        input[type=search]{
            width: 100%;
            border-top: 0;
            border-right: 0;
            border-left: 0;
            border-bottom-style: solid;
            border-bottom-color: black;
            padding: 0.5rem;
            font-size: 40px;
            font-style: oblique;
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
</head>

<body>
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
    </main>
</body>
</html>