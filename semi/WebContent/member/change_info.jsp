<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <jsp:include page="/template/header.jsp"></jsp:include>
    
    <div align="center">
    
    	<h2>회원 정보 수정</h2>
    	
    	<form action="change_info.do" method="post">
    		
    		<table border="0">
    		<tr>
    		<th>이메일</th>
    		<td>
    		<input type="email" name="email" placeholder="이메일">
    		</td>
    		</tr>
    		
    		
    					<tr>
				<th colspan="2">
					<input type="submit" value="수정하기">
				</th>
			</tr>
    		</table>
    	
    	</form>
       
    </div>
  
    <jsp:include page="/template/footer.jsp"></jsp:include>