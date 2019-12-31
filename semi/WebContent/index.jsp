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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/semi_common.css"> 
<jsp:include page="/template/header.jsp"></jsp:include>

    <style>
    html{
    background: url(<%=request.getContextPath()%>/image/back.jpg) no-repeat center center fixed; 
  	-webkit-background-size: cover;
  	-moz-background-size: cover;
  	-o-background-size: cover;
  	background-size: cover;
    }
    
    body{
    margin:0px;
    }     
    article {
         padding: 0.5rem; 
         margin: auto; 
    } 
    section{
    magin:0px;
    } 
    
        /* 검색창 */ 
        .box {
        	font-family:NotosanB;
        	height:500px;
            position: relative;
            width: 60%;
            text-align: center;
            margin-top:15%;
        }
        .search {
            position: absolute;
            width: 100%;
        }
        .box input[type=text]{
        	background-color:transparent;
        	font-family:NotosanBlack;
        	color: white;
  			font-size:35px;
            width: 100%;
            border-style: none;
            border-bottom-style: solid;
            border-bottom-color: white;
            padding: 1rem;
            font-size: 20px;
            font-style: oblique;
        }
        .box input::placeholder {
  		color: white;
  		font-size:35px;
		}
		
        .box input[type=text]:focus {
      		outline: none;
        }
        
        .topN *{
            text-align: center;
            display: inline-block;
            font-size: 17px;
            font-weight: bold;
        }
        .topN span:nth-child(1) {
        	font-size: 10px;
        	color: gray;
        	
        }
		.topN span:nth-child(2) {
			font-size:20px;
            color: white;
			border-bottom: 20px solid #808285;
	        width: auto;
	        line-height: -0px;
	        text-align: center;
	        margin-left: 0.5rem;
            margin-right: 1rem;
            margin-top: 1rem;
            margin-bottom: 1rem;
         } 
         
 		/* a태그 하이퍼링크 표시 제어 */        
	a:link { color: black; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    
    </style>
    
<%-- 	<img src="<%=request.getContextPath()%>/image/back.jpg" id="bg" alt="술마시고 있는 사람들"> --%>
    <article class="box">
    
    	<form action="<%=request.getContextPath()%>/board/searchResult.jsp" method="get">
        <input type="text" name="keyword" placeholder="what would you like to sarch?" required>
	        <br><br>
	        <div style="text-align:left; color:#6E6E6E;">인기 검색어: </div>
	        <div class="topN">
	        <%for(BoardDto boardDto:list) {%>
	            <a href="<%=request.getContextPath()%>/board/searchResult.jsp?keyword=<%=URLEncoder.encode(boardDto.getTitle(), "UTF-8") %>" >
	            	<span><%=boardDto.getRn()%>.</span>
	            	<span><%=boardDto.getTitle() %></span>
				</a>
	        <%} %>
	        </div>
		</form>
    </article>
 
<jsp:include page="/template/footer.jsp"></jsp:include>