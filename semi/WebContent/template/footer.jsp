<%@page import="semi.beans.board.HistoryDao"%>
<%@page import="semi.beans.board.HistoryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
  color: #566473;
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
  border-bottom-color: #566473;
  border-right-color: #566473;
}
.button.type1.type1::before {
  top: 0;
  left: 0;
  border-bottom-color: transparent;
  border-right-color: transparent;
  border-top-color: #566473;
  border-left-color: #566473;
}
.button.type1.type1:hover:after, .button.type1.type1:hover:before {
  width: 100%;
  height: 100%;
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
						<h3>ACOHOL WIKI&copy;</h3><br>
						<form action="<%=request.getContextPath()%>/operationPolicy/OP.jsp">
							  <button class="button type1">
  								운영 방침
  							</button>
						</form>
						<br>
								<h5>이하 개발용 상태값 확인</h5>
								<%
									String id = (String)session.getAttribute("id");
									String grade = (String)session.getAttribute("grade");
								%>
								<h5>id = <%=id%>, grade = <%=grade%></h5>
								<h5>로그인 상태 = <%=id != null%></h5>
							
				 </div>		 
		    </article>
        </footer>
</body>
</html>