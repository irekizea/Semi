<%@page import="semi.beans.reply.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.reply.ReplyDao"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="semi.beans.ba_board.BA_BoardDto"%>
<%@page import="semi.beans.ba_board.BA_BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//[1] 번호를 받고 [2] 조회수 증가시킨 뒤 게시글을 불러오고 [3] 출력
	int board_no = Integer.parseInt(request.getParameter("board_no"));
	BA_BoardDao bdao = new BA_BoardDao();
	BA_BoardDto bdto = bdao.get(board_no);
	

// 	본인글인지 여부와 관리자인지 여부를 미리 계산 -> 논리값 2개
	String userId = (String)session.getAttribute("id");
	String grade = (String)session.getAttribute("grade");
	
	boolean isMine = userId.equals(bdto.getWriter());//사용자ID == 작성자ID
	boolean isAdmin = grade.equals("관리자");//사용자권한==관리자
	

	Set<Integer> memory = (Set<Integer>)session.getAttribute("memory");

	if(memory == null){
		memory = new HashSet<>();
	}

	boolean isFirst = memory.add(board_no);
	System.out.println(memory);
	
	//[3] 처리를 마치고 저장소를 다시 세션에 저장한다
	session.setAttribute("memory", memory);
	

	
	int reply_no = Integer.parseInt(request.getParameter("reply_no"));
	ReplyDao rdao = new ReplyDao();
	List<ReplyDto> list = rdao.getList(reply_no);
			
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
	



<jsp:include page="/template/footer.jsp"></jsp:include>