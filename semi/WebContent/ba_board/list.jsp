
<%@page import="semi.beans.ba_board.BA_BoardDto"%>
<%@page import="semi.beans.ba_board.BA_BoardDao"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int pagesize = 10;
int navsize = 10;

int pno;
try{
	pno = Integer.parseInt(request.getParameter("pno"));
} catch(Exception e){
	pno = 1;
}

int finish = pno * pagesize;
int start = finish - (pagesize - 1);


BA_BoardDao dao = new BA_BoardDao();
List<BA_BoardDto> list = dao.getList(start,finish);

int count=dao.getCount();
String grade = (String)session.getAttribute("grade");
boolean isAdmin = grade.equals("관리자");
%>
<style>
    /* ba_board List.jsp style */
    .his-board{
        border-collapse: collapse;
    }
    .his-board * {
        padding: 10px;
        text-align: center;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    .his-board > thead  {
        font-weight: bold;
    }
    .his-board .his-title{
        border-top: 2px solid lightgray;
        border-bottom: 2px solid lightgray;
    }
    .his-board .his-content {
        border-bottom: 1px solid lightgray;
    }

    .his-board .title{
        width: 3rem;
        text-align: left;
    }
    .his-board .content{
        width: 10rem;
        text-align: left;
    }
    .his-board .time,
    .his-board .writer{
        width: 3rem;
        text-align: center;
    }
    .botton{
        border: 0;
        outline: 0;
        width: 4rem;
        background-color: white;
        color: black;
    }
    .botton:hover{
        background-color: black;
        color: white;
    }
    .div-botton .w-botton{
        border: 0;
        outline: 0;
        width: 4rem;
        background-color: black;
        color: white;
        margin-right: 3rem;
    }
</style>

<jsp:include page="/template/header.jsp"></jsp:include>

<div class="row-empty"></div>
<div align="center">
<<<<<<< HEAD
        <table class="his-board" border="0" width="90%">
            <colgroup>
                <col width="10%">
                <col width="30%">
                <col width="15">
                <col width="25">
                <col width="5%">
                <col width="5%">
                <col width="10%">
            </colgroup>
            <thead>
                <tr class="his-title">
                    <th>No</th>
                    <th>TITLE</th>
                    <th>Writer</th>
                    <th>Date</th>
                    <%if(isAdmin) {%>
                        <th>좋아요</th>
                        <th>싫어요</th>
                        <th>등록 여부</th>
                    <%} %>
                </tr>
            </thead>
            
            <tbody>
            <%for(BA_BoardDto dto : list) {%>
                <tr class="his-content">
                    <td><%=dto.getBoard_no()%></td>
                    <td class="content">
                        <a href="content.jsp?no=<%=dto.getBoard_no()%>">
                            <%=dto.getTitle()%>
                        </a>
                    </td>
                    <td class="writer"><%=dto.getWriter()%></td>
                    <%if(dto.getUdate() != null){%>
                    	<td class="time"><%=dto.getUdate()%>	</td>
                    <%} else{%>
                    	<td><%=dto.getWdate()%></td>
                    <%} %>
                    <%if(isAdmin) {%>	
                    	<td><%=dto.getUp()%></td>
                    	<td><%=dto.getDown()%></td>						
                    <td>
                    	<%if(dto.getRegist()>0) {%>
							<h5>등록 완료</h5>
						<%} else {%>
							<a href="regist.do?no=<%=dto.getBoard_no()%>"><input type="button"  class="botton"value="등록"></a>
							<a href="delete.do?no=<%=dto.getBoard_no()%>"><input type="button" class="botton" value="미등록"></a>					
						<%} %>
					 <%} %>	                
                    </td>
                </tr>
            <%} %>	
            </tbody>
        </table>
        <div class="row-empty"></div>
        <div align="right" class="div-botton">
            <a href="write.jsp">
                <input type="button" class="w-botton" value="글쓰기">
            </a>
        </div>
        	<!-- 네비게이터(navigator) -->
=======
	<table border="1" width="90%">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일시</th>
				<%if(isAdmin) {%>
					<th>좋아요</th>
					<th>싫어요</th>
					<th>등록 여부</th>
				<%} %>
			</tr>
		</thead>
		
		<tbody>
		<%for(BA_BoardDto dto : list) {%>
			<tr>
				<td><%=dto.getBoard_no()%></td>
				<td>
					<a href="content.jsp?no=<%=dto.getBoard_no()%>">
						<%=dto.getTitle()%>
					</a>
				</td>
				<td><%=dto.getWriter()%></td>
				
				<%if(dto.getUdate() != null){%>
					<td><%=dto.getUdate()%></td>
				<%} else{%>
					<td><%=dto.getWdate()%></td>
				<%} %>
				<td><%=dto.getUp()%></td>
				<td><%=dto.getDown()%></td>						
				<td>
				<%if(dto.getRegist()>0) {%>
					<h5>등록 완료</h5>
				<%} else {%>
					<a href="regist.do?no=<%=dto.getBoard_no()%>"><input type="button" value="등록"></a>
					<a href="delete.do?no=<%=dto.getBoard_no()%>"><input type="button" value="미등록"></a>
					
				<%} %>	
				</td>
			</tr>
		<%} %>	
		
		</tbody>
	</table>
	
	<!-- 네비게이터(navigator) -->
>>>>>>> branch 'gf' of https://github.com/irekizea/Semi
	<jsp:include page="/template/navigator.jsp">
		<jsp:param name="pno" value="<%=pno%>"/>
		<jsp:param name="count" value="<%=count%>"/>
		<jsp:param name="navsize" value="<%=navsize%>"/>
		<jsp:param name="pagesize" value="<%=pagesize%>"/>
	</jsp:include>
	
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>