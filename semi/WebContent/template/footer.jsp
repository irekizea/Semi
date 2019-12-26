<%@page import="semi.beans.board.HistoryDao"%>
<%@page import="semi.beans.board.HistoryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
        </section>
        
       <style>
.footer {
    width: 100%;
    background-color: black;
    left: 0px;
}
.footer>.foodiv>* {
	color:white;
	font-size: 10;
	text-align: center
}      
@import url("https://fonts.googleapis.com/css?family=Raleway");
* {
  box-sizing: border-box;
  
}
.button {
  position: relative;
  padding: 1em 1.5em;
  border: none;
  background-color: transparent;
  cursor: pointer;
  outline: none;
  font-size: 10px;
  margin: 1em 0.8em;
}
.button.type1 {
  color: white;
}
.button.type1.type1::after, .button.type1.type1::before {
  content: "";
  display: block;
  position: absolute;
  width: 20%;
  height: 20%;
  border: 2px solid;
  transition: all 0.6s ease;
  border-radius: 2px;
}
.button.type1.type1::after {
  bottom: 0;
  right: 0;
  border-top-color: transparent;
  border-left-color: transparent;
  border-bottom-color: white;
  border-right-color: white;
}
.button.type1.type1::before {
  top: 0;
  left: 0;
  border-bottom-color: transparent;
  border-right-color: transparent;
  border-top-color: white;
  border-left-color: white;
}
.button.type1.type1:hover:after, .button.type1.type1:hover:before {
  width: 100%;
  height: 100%;
}
.footer > .foodiv h3{
    color: white;
}
.footer > .foodiv button{
    color: white;
} 
          
        </section>
        
       <style>
        .footer {
            width: 100%;
        }

        .footer>.foodiv>* {
            color:dimgray;
            font-size: 10;
            text-align: center
        }
        
          
      @import url("https://fonts.googleapis.com/css?family=Raleway");
* {
  box-sizing: border-box;
  
}
.footer{
    background-color: black;
    position: absolute;
    bottom: 0px;
    left: 0px;
    
} 
.button {
  position: relative;
  padding: 1em 1.5em;
  border: none;
  background-color: transparent;
  cursor: pointer;
  outline: none;
  font-size: 10px;
  margin: 1em 0.8em;
}
.button.type1 {
  color: white;
}
.button.type1.type1::after, .button.type1.type1::before {
  content: "";
  display: block;
  position: absolute;
  width: 20%;
  height: 20%;
  border: 2px solid;
  transition: all 0.6s ease;
  border-radius: 2px;
}
.button.type1.type1::after {
  bottom: 0;
  right: 0;
  border-top-color: transparent;
  border-left-color: transparent;
  border-bottom-color: white;
  border-right-color: white;
}
.button.type1.type1::before {
  top: 0;
  left: 0;
  border-bottom-color: transparent;
  border-right-color: transparent;
  border-top-color: white;
  border-left-color: white;
}
.button.type1.type1:hover:after, .button.type1.type1:hover:before {
  width: 100%;
  height: 100%;
}
.footer > .foodiv h3{
    color: white;
}
    </style>
        <footer>
								<!-- 
									하단 홈페이지 정보 작성
									- 회사정보
									- 정책안내
									- 기타 사이트맵
									- 연락처 

								-->						
			<article class="footer">
		        <div class="foodiv">
						<h3>ACOHOL WIKI&copy;</h3>
						<form action="<%=request.getContextPath()%>/operationPolicy/OP.jsp">
							  <button class="button type1">
  								운영 방침
  								</button>
						</form>	
				 </div>		 

		    </article>
        </footer>
</body>
</html>