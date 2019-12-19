<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<style>
        body {
            margin: 0;
        }

        .navmenu {
            width: 100%;
            overflow: auto;
        }

        .navmenu ul {
            margin: 0;
            padding: 0;
            list-style: none;
            line-height: 60px
        }

        .navmenu li {

            float: right;
        }

        .navmenu ul li a {
            margin-right: 10px;
            text-decoration: none;
            width: 60px;
            display: block;
            text-align: center;
            font-size: 13px;
            letter-spacing: 0.5px;
            color: #142b47;
        }
        
        .navmenu li a:hover{
            color:burlywood;
            opacity:0.5;
            font-size: 13px;
        }
        .search-form{
            margin-top:15px;
            margin-left:20px;
            float : left;
            
        }
        
        .navsearch {
            padding:7px;
            font-size:13px;
            border-radius: 0 4px 4px 0;
        }
        button{
            float:right;
            border-radius:0 5px 5px 0;
            cursor:pointer;
            position : relative;
            padding:5px;
            background-color: #fff;
        }
    </style>
    


  <nav class="navmenu">
  <%if(request.getParameter("keyword")!=null){ %>
        <ul>
            <li><a href="#">역사</a> </li>
            <li><a href="#">토론</a> </li>
            <li><a href="#">편집</a> </li>
            <li><a href="#">좋아요</a> </li>

        </ul>
	<%} %>
        <form class="search-form" action="<%=request.getContextPath()%>/board/searchResult.jsp">
            <input name = "keyword" class = "navsearch" type="text" placeholder="search">
            <button>검색</button>


        </form>


    </nav>