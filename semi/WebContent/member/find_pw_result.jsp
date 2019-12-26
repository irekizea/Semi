<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String pw = request.getParameter( "pw");
%>
     <style>
        * {
            box-sizing: border-box; 
            
        }
      
        body{
         background-color: #f5f5f5;
        }
	
        .login-wrap {
            width: 460px;
            /* 내용물 가운데 정렬 */
            text-align: center;

            /* div 자신을 가운데 정렬 */
            margin-left: auto;
            margin-right: auto;
            
        }

        .login-wrap input[type=submit] {
            color: white;
            background-color: #000000;
            cursor: pointer;
        }

        /*        로고를 글자로 할 경우의 스타일*/
        .login-wrap>.logo {
            font-size: 3rem;
            font-weight: 900;
            color: #000000;
        }
        a{ 
        color: gray;
        text-decoration: none;
        }
          hr{
            width: 460px;
        }
      
    </style>
    

<jsp:include page="/template/header.jsp"></jsp:include>

<%if(pw != null){ %>  
	<!-- 검색 성공시 -->
	<h2>당신의 비밀번호는 <%=pw%> 입니다</h2>
	<h3><a href="login.jsp">로그인 하러가기</a></h3>
<%}else{ %>
	<!-- 검색 실패시 -->
	<h2>입력하신 정보에 해당하는 회원이 없습니다</h2>
	<h3><a href="find_pw.jsp">다시 입력하기</a></h3>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>
