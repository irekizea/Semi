
<%@page import="semi.beans.board.HistoryDao"%>
<%@page import="semi.beans.board.HistoryDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String context=request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=context%>/css/semi_common.css"> 
</section>
	<footer class="footer">				
	     <div class="footer col-3">
			
			<!-- 푸터 왼쪽부분 -->
	     	<div class="foodter left">
	         	<span id="en">
	            	Alkolwiki is a website made for studying KH21 based on tree wiki.
	            </span><br><br>
	            <span id="en">About Us</span><br>
	            <span>
	            	상호:(주)KH정보교육원
	           	</span><br>
	            <span>
	            	주소: 서울특별시 영등포구 선유동2로 57(양평동4가)
	            </span><br>
	            <span>
					조원:서종민,이영락,최선,조승은,김용범,이다혜
	            </span><br><br>
	               
	            <a href="#" id="en">이용약관</a><br>
	            <a href="#" id="en">개인정보취급방침</a>
	           </div>
	           
	           <!-- 푸터 가운데부분 -->     
	           <div class="foodter center"> 
	               <span id="en">
	                   Alkolwiki
	               </span><br> 
	               <span>
	                   Seonyudong 2-ro, Yeongdeungpo-gu, Seoul, Korea
	               </span><br>
	               <span>
	                   Tel:010-0000-0000
	               </span><br>
	               <span>
	                   kh21@iei.or.kr
	               </span><br>
				</div>
				
				<!-- 푸터 오른쪽부분 -->
				<div class="foodter right"> 
	               <span id="en">
	                   FOLLOW US
	               </span><br> 
	               <a href="https://www.instagram.com/alcohole_wiki/">
	               		<img src="<%=context%>/image/11.png" alt="알콜위키 인스타그램 페이지">
	               	</a>
	               	<a href="https://www.facebook.com/">
	               		<img src="<%=context%>/image/22.png" alt="알콜위키 페이스북 페이지">
	               	</a>
	               <img src="<%=context%>/image/33.png" alt="알콜위키 메신저 페이지">
	           </div>
	         
	       </div>
		</footer>
	</main>
</body>
</html>