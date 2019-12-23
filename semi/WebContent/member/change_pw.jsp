<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <jsp:include page="/template/header.jsp"></jsp:include>
   
   <div align="center">
   
   <form action="change_pw.do" method="post">
   
   <h1> 신규 비밀번호 입력</h1>
  
  <input type ="password" name="pw" required>
  
  <input type = "submit" value="완료">
  
   
   </form>
  
   </div>
  
   <jsp:include page="/template/footer.jsp"></jsp:include>