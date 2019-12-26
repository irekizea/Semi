<%@page import="semi.beans.board.HistoryDto"%>
<%@page import="semi.beans.board.HistoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="semi.beans.board.HistoryDto"%>
<%@page import="semi.beans.board.HistoryDao"%>
<%@page import="semi.beans.board.BoardTextDto"%>
<%@page import="java.util.List"%>
<%@page import="semi.beans.board.BoardTextDao"%>
<%@page import="semi.beans.board.BoardDto"%>
<%@page import="semi.beans.board.BoardDao"%>
<%@page import="semi.beans.board.BoardTextDto"%>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(request.getParameter("keyword"));
	BoardTextDao boardtextdao = new BoardTextDao();
	
	String keyword = request.getParameter("keyword");
	List<BoardTextDto> getList = boardtextdao.getList(keyword);
	String login = (String) session.getAttribute("id");
	BoardTextDto boardtextdto =  boardtextdao.get(no);
%>
<style>
	/* 문서배포 동의 checkbox 숨김 */
	input[type=checkbox] +.checked-show {
		display: none;
	}
	input[type=checkbox]:checked +.checked-show {
		display: block;
	}
</style>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/semi_common.css">
<link rel="stylesheet" type="text/css" 
	href="<%=request.getContextPath() %>/css/board.css">
<jsp:include page="/template/header.jsp"></jsp:include>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/lib/toast/css/codemirror.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/lib/toast/css/github.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/lib/toast/css/tui-color-picker.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/lib/toast/dist/tui-editor.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/lib/toast/dist/tui-editor-contents.min.css">
<script
	src="<%=request.getContextPath()%>/lib/toast/dist/tui-editor-Editor-full.min.js"></script>
<script>
	//naver toast ui를 만들기 위한 코드
	function createEditor() {
		
		//editor 옵션
		var options = {
			//el(element) : 에디터가 될 영역
			el : document.querySelector(".naver-editor"),
			//previewStyle : 표시되는 방식(horizontal, vertical)
			previewStyle : 'vertical',
			//height : 생성될 에디터의 높이
			width: '100%',
			height : '300px',
			//initialEditType : 생성될 에디터의 초기화면 형태(markdown, wysiwyg)
			initialEditType : 'wysiwyg'
		};
		//editor 생성 코드
		
		var editor = tui.Editor.factory(options);
		
		//editor에 이벤트를 설정해서 입력하면 자동으로 input에 복사되게 구현
		//- input이라는 상황이 발생하면 오른쪽 function을 실행하라
		//- oninput이랑 동일한데 자바스크립트로만 구현
		editor.on("change", function() {
			//editor의 입력값을 가져와서 input에 설정
			var text = editor.getValue();
			var input = document.querySelector(".naver-editor + input");
			input.value = text;
		});
	}
	window.onload = createEditor;
</script>
<!-- <input type="file" name="file" >	 -->
<form action="boardedit.do" method="post" >
	<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
	 <input type="hidden" name="boardtitle" value="<%=boardDto.getTitle()%>">
	<input type="hidden" name="boardtextudate" value="<%=boardDto.getUdate()%>">
	<input type="hidden" name="no" value="<%=request.getParameter("no")%>"> 
	<input type="hidden" name="board_no" value="<%=boardtextdto.getBoard_no()%>">
<!-- 	<input type="file" name="file" >	 -->
	<%
		if (login != null) {
	%>
	<input type="hidden" name="writer"
		value="<%=session.getAttribute("id")%>">
	<%
		} else {
	%>
	<input type="hidden" name="ip_addr"
		value="<%=request.getRemoteAddr()%>">
	<%
		}
	%>

	<article class="board">

		<div class="title">
			<%=boardDto.getTitle()%>
		</div>
			<br><br><br>
			
	<div>	
			최종 수정시간:<%=boardtextdto.getUdate()%>
			<%System.out.println(boardtextdto.getUdate()); %>
		<div class="sub-title">
			<%
				if (login != null) {
			%>
			수정자:
			<%=session.getAttribute("id")%>
			<%
				} else {
			%>
			수정자:
			<%=request.getRemoteAddr()%>
			<%
				}
			%>
		</div>
	</div>
		<div class="text">
			<br>
			<div class="naver-editor"><%=boardtextdto.getText_content()%></div>
			
		</div>
		<span>
			문서 편집을 저장하면 기여한 내용을 CC-BY-NC-SA 2.0 KR으로 배포하고
			기여한 문서에 대한 하이퍼링크나 URL을 이용하여 저작자 표시를 하는 것으로
			충분하다는 데 동의하는 것입니다. 이 동의는 철회할 수 없습니다.
		</span>
		<input type="checkbox">
		<div align="left" class="checked-show">
			<input type="submit" value="편집완료">
		</div>
	</article>
	<!-- 
        이 div 태그가 에디터로 변함 
        - 주의 : 입력창이 아니기 때문에 전송이 안됨
        - 전송하려면 submit 상황에서 추가 코드 필요
    -->
	<!--    body가 없는 경우에는 다음과 같이 작성 -->
	<!--    - 예약 실행(callback) -->
<!-- 	        window.onload = createEditor; -->
	<div class="naver-editor"></div>
	<input type="hidden" name="text_content">
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>
