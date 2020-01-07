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

	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
    <script type="text/javascript">

        function open_chk(){

            var check_form = document.querySelector(".check_form");
                // form의 select option 값이 null 일 때
            if(check_form.check_year.value==""){
                alert("연도를 입력해주세요");
            }
            else if(check_form.check_month.value==""){
                alert("월을 입력해주세요");
            }
            else if(check_form.check_date.value==""){
                alert("일을 입력해주세요");
            }
            else{
                var year= 2020; // 현재년도
                var age = year - check_form.check_year.value;
                if(age<19){     // 19 보다 작을 때
                    $(".start_check1").css("display", "none");
                    $(".start_check2").css("display", "block");
                    $(".back").on("click", function(){      // check_start2의 확인을 누르면
                        $(".start_check1").css("display", "block");
                        $(".start_check2").css("display", "none");
                    });
                }
                else{
                    var start_modal = document.querySelector(".start_modal");
                    start_modal.style.display="none";
                }
            }            
        }

    </script>

    <style>
    
   	html {
    background: url("<%=request.getContextPath()%>/image/back.jpg") no-repeat center center fixed; 
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
	a:link { color: white; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    
    /* 첫화면 modal 스타일*/

        /* a태그 버튼 스타일 */
        .start,
        .back {
            border-color: white;
            padding: 5px;
            font-size: 15px;
        }
        
        /* modal content 스타일 */
               
        .start_modal {
			top:0;
			left:0;
			right:0;
			bottom:0;
            position: fixed;
            z-index: 50;
            background-color:rgba(0, 0, 0, 0.9);
        }

        .start_info {
            text-align: center;
            padding: 1rem;
            margin: 0;
            color: gray;
            font-size: 20px;
        }
        .start_info > span {
            color: white;
            text-decoration: underline;
        }
        .start_check1,
        .start_check2 {
            border: 0;
            margin: 20%;
            text-align: center;
        }
        .check_year,
        .check_month,
        .check_date {
            width: 5rem;
            height: 2rem;
            margin: 5px;
        }
     
    </style>
    
   <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/semi_common.css"> 

<%-- 	<img src="<%=request.getContextPath()%>/image/back.jpg" id="bg" alt="술마시고 있는 사람들"> --%>
	
<jsp:include page="/template/header.jsp"></jsp:include>
	<article class="start_modal">
  
<!-- 		<div>	   -->
<!--         	<a href="javascript:;" onclick="javascript:close_tap();" class="close">&times;</a> -->
<!--         </div>     -->
		<div class="start_content">
        <div class="start_check1">
            <p class="start_info">
                Alcohole wiki는 <span>만 19세 이상</span>만 이용가능합니다.
            </p>
            <form action="#" class="check_form" name="check_form">
                <select class="check_year" name="check_year">
                    <option value="">연도</option>
                    <option value="2020">2020</option><option value="2019">2019</option>
                    <option value="2018">2018</option><option value="2017">2017</option>
                    <option value="2016">2016</option><option value="2015">2015</option>
                    <option value="2014">2014</option><option value="2013">2013</option>
                    <option value="2012">2012</option><option value="2011">2011</option>
                    <option value="2010">2010</option><option value="2009">2009</option>
                    <option value="2008">2008</option><option value="2007">2007</option>
                    <option value="2006">2006</option><option value="2005">2005</option>
                    <option value="2004">2004</option><option value="2003">2003</option>
                    <option value="2002">2002</option><option value="2001">2001</option>
                    <option value="2000">2000</option><option value="1999">1999</option>
                    <option value="1998">1998</option><option value="1997">1997</option>
                    <option value="1996">1996</option><option value="1995">1995</option>
                    <option value="1994">1994</option><option value="1993">1993</option>
                    <option value="1992">1992</option><option value="1991">1991</option>
                    <option value="1990">1990</option><option value="1989">1989</option>
                    <option value="1988">1988</option><option value="1987">1987</option>
                    <option value="1986">1986</option><option value="1985">1985</option>
                    <option value="1984">1984</option><option value="1983">1983</option>
                    <option value="1982">1982</option><option value="1981">1981</option>
                    <option value="1980">1980</option><option value="1979">1979</option>
                    <option value="1978">1978</option><option value="1977">1977</option>
                    <option value="1976">1976</option><option value="1975">1975</option>
                    <option value="1974">1974</option><option value="1973">1973</option>
                    <option value="1972">1972</option><option value="1971">1971</option>
                    <option value="1970">1970</option><option value="1969">1969</option>
                    <option value="1968">1968</option><option value="1967">1967</option>
                    <option value="1966">1966</option><option value="1965">1965</option>
                    <option value="1964">1964</option><option value="1963">1963</option>
                    <option value="1962">1962</option><option value="1961">1961</option>
                    <option value="1960">1960</option><option value="1959">1959</option>
                    <option value="1958">1958</option><option value="1957">1957</option>
                    <option value="1956">1956</option><option value="1955">1955</option>
                    <option value="1954">1954</option><option value="1953">1953</option>
                    <option value="1952">1952</option><option value="1951">1951</option>
                    <option value="1950">1950</option><option value="1949">1949</option>
                    <option value="1948">1948</option><option value="1947">1947</option>
                    <option value="1946">1946</option><option value="1945">1945</option>
                    <option value="1944">1944</option><option value="1943">1943</option>
                    <option value="1942">1942</option><option value="1941">1941</option>
                    <option value="1940">1940</option><option value="1939">1939</option>
                    <option value="1938">1938</option><option value="1937">1937</option>
                    <option value="1936">1936</option><option value="1935">1935</option>
                    <option value="1934">1934</option><option value="1933">1933</option>
                    <option value="1932">1932</option><option value="1931">1931</option>
                    <option value="1930">1930</option>
                </select>
                <select class="check_month" name="check_month">
                    <option value="">월</option>
                    <option value="1">1</option><option value="2">2</option>
                    <option value="3">3</option><option value="4">4</option>
                    <option value="5">5</option><option value="6">6</option>
                    <option value="7">7</option><option value="8">8</option>
                    <option value="9">9</option><option value="10">10</option>
                    <option value="11">11</option><option value="12">12</option>
                </select>
                <select class="check_date" name="check_date">
                    <option value="">일</option>
                    <option value="1">1</option><option value="2">2</option>
                    <option value="3">3</option><option value="4">4</option>
                    <option value="5">5</option><option value="6">6</option>
                    <option value="7">7</option><option value="8">8</option>
                    <option value="9">9</option><option value="10">10</option>
                    <option value="11">11</option><option value="12">12</option>
                    <option value="13">13</option><option value="14">14</option>
                    <option value="15">15</option><option value="16">16</option>
                    <option value="17">17</option><option value="18">18</option>
                    <option value="19">19</option><option value="20">20</option>
                    <option value="21">21</option><option value="22">22</option>
                    <option value="23">23</option><option value="24">24</option>
                    <option value="25">25</option><option value="26">26</option>
                    <option value="27">27</option><option value="28">28</option>
                    <option value="29">29</option><option value="30">30</option>
                    <option value="31">31</option>
                </select>
                <a href="javascript:;" onclick="javascript:open_chk();" class="start">
                   	 시작하기
                </a>
            </form>
        </div>
        <!-- 19세 미만일 때 -->
        <div class="start_check2" style="display: none; text-align: center;">
            <span class="start_info">
                Alcohole wiki는 <span>만 19세 이상</span>만 이용가능합니다.
            </span>
            <a href="javascript:;" onclick="javascript:open_chk();" class="back">
                	확인
            </a>
        </div>
        </div>
	</article>
	    
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
	   
<jsp:include page="/template/footer.jsp" ></jsp:include>
			
 