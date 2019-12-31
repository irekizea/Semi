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
<script src="https://code.jquery.com/jquery-latest.js"></script>
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
			initialEditType : 'wysiwyg',
			hooks: {
		        'addImageBlobHook': function(blob, callback) {
		            //해야할 것
		            //[1] 서버의 준비된 주소에 신호를 보내서 파일을 업로드해야함
		           	var data = new FormData();//파일 전송을 지원하는 FormData 객체를 생성
		           	data.append("fname", blob);//fname이란 이름으로 이미지(blob)를 첨부
		           	data.append("no", <%=boardtextdto.getNo()%>);
		           	
		           	$.ajax({//서버로 비동기(몰래) 통신을 보낸다
		           		url:"http://localhost:8080/semi/board/fileupload.do",//업로드 서블릿 주소
		           		type:"post",//전송 방식(GET/POST)
		           		data:data,//전송할 데이터
		           		cache:false,//캐시 사용 여부
        				processData:false,//url-encoding 방식을 쓰지 않겠다는 설정(파일이니까 multipart/form-data)
        				contentType:false,//기본 전송타입을 쓰지 않겠다는 설정
        				success:function(result){//성공했다면 실행할 내용
        					//result : 서버에서 회신한 데이터(주소)
        					callback(result);
        				}
		           	});
		        }
		    }
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
		
		//초기 설정
		editor.setValue(document.querySelector(".naver-editor + input").value);
	}
	window.onload = createEditor;
</script>
<!-- <input type="file" name="file" >	 -->
<form action="boardedit.do" method="post">
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
		<p>
		최종 수정시간:<%=boardtextdto.getUdate()%>
		</p>
		</div>
		

		<div class="sub-title">
			<%
				if (login != null) {
			%>
			수정자: <%=session.getAttribute("id")%>
			<%
				} else {
			%>
			수정자: <%=request.getRemoteAddr()%>
			<%
				}
			%>
		</div>
<!-- 		<input type="file" name="file">		 -->
		<input type="text" name="sub_title" required class="sub-title" style="width:100%; height:5%;" value="<%=boardtextdto.getSub_title() %>">			
		<input type="hidden" name="sub_title" value="<%=boardtextdto.getSub_title() %>">
		<div class="naver-editor"></div>
		<input type="hidden" name="text_content" value="<%=boardtextdto.getText_content()%>">
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
	
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>
