<%@page import="semi.beans.HistoryDto"%>
<%@page import="semi.beans.HistoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	HistoryDao dao = new HistoryDao();
    	int check = dao.recentwriter(1);
    %>
        </section>
        <footer>
            푸터
						<!-- 
							하단 홈페이지 정보 작성
							- 회사정보
							- 정책안내
							- 기타 사이트맵
							- 연락처 
						-->						
				<h3>ACOHOL WIKI&copy;</h3><br>
						
						<h5>이하 개발용 상태값 확인</h5>
						<%
							String id = (String)session.getAttribute("id");
							String grade = (String)session.getAttribute("grade");
							
						%>
						<h5><%=check %></h5>
						<h5>id = <%=id%>, grade = <%=grade%></h5>
						<h5>로그인 상태 = <%=id != null%></h5>
        </footer>
    </main>
</body>
</html>