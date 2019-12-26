
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="semi.beans.board.BoardReplyDto"%>
<%@page import="semi.beans.board.BoardReplyDao"%>
<%@page import="semi.beans.board.BoardTextDto"%>
<%@page import="semi.beans.board.BoardTextDao"%>
<%@page import="semi.beans.board.BoardDto"%>
<%@page import="semi.beans.board.BoardDao"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.net.InetAddress" %>
<%@ page import = "semi.beans.board.BoardDao" %>
<%@ page import = "semi.beans.board.BoardDto" %>
<%@ page import = "semi.beans.board.BoardTextDao" %>
<%@ page import = "semi.beans.board.BoardTextDto" %>
<%@page import="semi.beans.ba_board.BA_FileDao"%>
<%@page import="semi.beans.ba_board.BA_FileDto"%>

<!-- naver toast ui를 사용하기 위한 준비 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/css/codemirror.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/css/github.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/css/tui-color-picker.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/dist/tui-editor.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/dist/tui-editor-contents.min.css">
<script src="<%=request.getContextPath()%>/lib/toast/dist/tui-editor-Editor-full.min.js"></script>

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
			var input = document.querySelector(".naver-editor + textarea");
			input.value = text;
		});
	}
	// editor로 쓰여진 글을 불러오기 위한 viewer 생성
	function createViewer(){
        //editor 옵션
        var options = {
            //el(element) : 에디터가 될 영역
            el:document.querySelector(".naver-viewer"),
            
            viewer:true,
            //height : 생성될 에디터의 높이
            height:'auto',
            
        };
        //editor 생성 코드
        var editor = tui.Editor.factory(options);
        var input = document.querySelector(".naver-viewer + input");
        var text = input.value;
        editor.setValue(text);
    }
    //body가 없는 경우에는 다음과 같이 작성
    // - 예약 실행(callback)
    // window 실행시 자동으로 editor 생성
	window.onload = createEditor;

  		
</script>
<style>
		/*title style*/
        .titlee {
            margin-left: 5%;
            font-size: 2rem;
        }

	/* 실제 input 또는 textarea 숨김처리 */
	.naver-editor + textarea {
		display: none;
	}
	
	/* 목록추가, 댓글(토론), 문서배포 checkbox 숨김 */
	label + input[type=checkbox]{
		display: none;
	}
	input[type=checkbox] +.checked-show {
		display: none;
	}
	input[type=checkbox]:checked +.checked-show {
		display: block;
	}
</style>
<%
	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(keyword);   
	boardDao.searchCount(keyword); 
	
	BoardTextDao boardTextDao = new BoardTextDao();
	List<BoardTextDto> getList =boardTextDao.getList(keyword);	
	
	String ip = request.getRemoteAddr();	//전송자 ip
	String writer = (String)request.getSession().getAttribute("id");
	
	BoardReplyDao boardReplyDao = new BoardReplyDao();
	List<BoardReplyDto> replyList = boardReplyDao.replyList(keyword);	
	
	// 승인된 후 첫글인지, 사용자가 수정한 글인지 판단
	boolean editCheck= boardDto.getEditCheck();
	
	// 파일 다운로드 파일정보 불러오기(List)
	BA_FileDao fdao = new BA_FileDao();
	List<BA_FileDto> flist=fdao.getList(keyword);
	                                                                                                                       
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/board.css">
<jsp:include page="/template/header.jsp"></jsp:include>
<% if(boardDto.getTitle()!=null){ %>
<article>
<div class="titlee"><%=boardDto.getTitle() %></div>
<div align = "right">최근 수정 시간 : <%=boardDto.getUdate() %></div>
<div align="center">



<form action="textInsert.do" method="post"  enctype="multipart/form-data">
<table class="w-90">
	<%for(BoardTextDto boardTextDto:getList){ %>
	<tr>
		<td>
			<%= boardTextDto.getSub_title()%>
		</td>
	</tr>
	<%} %>



<%if(!editCheck){ %>

<%for(BA_FileDto boardFileDto : flist) {%>

	<tr>
		<td colspan="4">			
			<!-- 파일 미리보기 -->
			
			  	<img src="filedown.do?keyword=<%=boardFileDto.getTitle_key() %>" class="img">

		</td>
	</tr>
		<%} %>
	<%for(BoardTextDto boardTextDto:getList){ %>



	<tr>

		<td>
		<!-- for(BoardTextDto boardTextDto:getList){
				<a id="indexlist" href="#s-boardTextDto.getRn()">boardTextDto.getRn() boardTextDto.getSubTitle()</a><br>
		} -->
		
		</td>
	</tr>
	<tr>
		<td class="sub-title" colspan="3"><!-- <a id ="s-1" href ="#indexlist">1</a> -->개요</td>
		<td>
			<a href="boardedit.jsp?boardno=<%=boardDto.getNo()%>&keyword=<%=boardDto.getTitle()%>">
				<input type="button" value="편집">
			</a>
		</td>
	</tr>
	<tr>
		<td width="100%" align = "right">최근 수정자 : <%=boardDto.getWriter() %></td>
	</tr>
	<tr>
		<td colspan = "4">
			  <%= boardDto.getContent()%>


			  <%= boardTextDto.getText_content()%>

		</td>
	</tr>
	<%} %>


<%} else{%>	
	<%for(BoardTextDto boardTextDto:getList){ %>

	<tr>

		<td class="sub-title" colspan="2"><!-- <a id ="s-boardTextDto.getRn()" href ="#indexlist">boardTextDto.getRn()</a> --><%=boardTextDto.getSub_title() %></td>

		<td>
			<a href="boardedit.jsp?boardno=<%=boardDto.getNo()%>&keyword=<%=boardDto.getTitle()%>">
				<input type="button" value="편집">
			</a>
		</td>
	</tr>
	
	<tr>
		<td colspan="4"><%=boardTextDto.getText_content() %></td>
	</tr>	
	<%} %>
	
<%} %>
	<tr>
	
		<td colspan = "4">
			<label for="show">[목차 추가]</label>
			<input type="checkbox" id="show" class="checkbox'">
			<div class="checked-show">
				
						<input type="hidden" name="keyword" value=<%=keyword %>>
						<input type="hidden" name="board_no" value="<%=boardDto.getNo()%>">
						<input type="text" name="sub_title" value="목차[소제목]" required class="sub-title" style="width:100%; height:5%;">
								
						<input type="file" name="file" >
								
						<div class="naver-editor"></div>
							<textarea name="text_content" rows="4" required style="resize:vertical; width:100%" class="text">
							</textarea>
							<span>
								문서 편집을 저장하면 기여한 내용을 CC-BY-NC-SA 2.0 KR으로 배포하고
								기여한 문서에 대한 하이퍼링크나 URL을 이용하여 저작자 표시를 하는 것으로
								충분하다는 데 동의하는 것입니다. 이 동의는 철회할 수 없습니다.
							</span>
							<input type="checkbox">
						<p align="right" style="margin: 5px 0px" class="checked-show">
							<input type="submit" value="등록완료">
						</p>
				
								<%if(writer==null) {%>
									<p> 
										[알림] 비로그인 상태로 편집합니다. 편집 내역에 IP "<%=ip %>"가 영구히 기록됩니다.
									</p>
								<%} %> 
			</div>
		</td>
	
	</tr>
</table>
</form>




</form>


<label for="reply"><p align="left" class="w-80">[토론 보기]</p></label>
<input type="checkbox" id="reply" class="checkbox">
<form action="replyInsert.do" method="post">  
<table class="checked-show w-90">
	<%for(BoardReplyDto boardReplyDto: replyList){ %>	
	<tr>
		<td>
		<%if(boardReplyDto.getWriter()!=null){ %>
			<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?writer=<%=boardReplyDto.getWriter() %>">
										<%=boardReplyDto.getWriter() %>
			</a>									
		<%} 
			else {%>
				<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?ip_addr=<%=boardReplyDto.getIp_addr() %>">
					<%=boardReplyDto.getIp_addr() %>
				</a>
			<%} %>
		</td>
		
		<td colspan ="2">
		</td>
	
		<td>
			<%=boardReplyDto.getWdate() %>
		</td>
	</tr>
	
	<tr>
		<td colspan = "4">
			<%=boardReplyDto.getContent() %>
		</td>
	</tr>

	<%} %>
	
	<tr>
			<td clospan="4">
                             
	       
	            		<input type="hidden" name="board_title" value="<%=boardDto.getTitle()%>">	   
	            		<textarea name="content" onkeyup="textLimit(this, 1000);" required></textarea>
	            		
		            	<%if(writer==null) { %>
							[알림] 비로그인 상태로 토론에 참여합니다. 토론 내역에 IP "<%=ip %>"가 영구히 기록됩니다.
						<%} %>
		
			</td>
	
		</tr>
	
		<tr>
			<td>
				토론은 사용자에 의한 임의삭제가 불가능하므로 신중하게 작성하여 주시길 바랍니다.
			<input type="submit" value="등록">
		
			</td>
		</tr>
</table>
</form>
<!-- 검색결과가 없다면 -->
<table>	
<% }else {%>
	<tr>
		<td >
		"<%=keyword %>"에 대한 검색결과가 없습니다. <br>
		</td>
		<td colspan="3">
			<%if(writer==null){ %>
								로그인 후 " <%=keyword %> "에 대한 <a href="<%=request.getContextPath()%>/member/login.jsp">새 글 제안하기</a>
			<%}else{%>
				 " <%=keyword %> "에 대한 <a href="<%=request.getContextPath()%>/ba_board/write.jsp">새 글 제안하기</a>
			<%} %>
		</td>
	
	</tr>
<%} %>

</table>
</div>
</article>



<jsp:include page="/template/footer.jsp"></jsp:include>
