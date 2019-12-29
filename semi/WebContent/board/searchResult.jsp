
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
			height : '200px',
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
	
	function createMultiViewer(){
		//전체 naver-viewer를 불러온다.
		var list = document.querySelectorAll(".naver-viewer");
		for(var i=0; i < list.length; i++){
			//하나씩 초기화 진행
	        var options = {
	            //el(element) : 에디터가 될 영역
	            el:list[i],
	            
	            viewer:true,
	            //height : 생성될 에디터의 높이
	            height:'auto',
	            
	        };
	        //editor 생성 코드
	        var editor = tui.Editor.factory(options);
	        
	        //list[i] 의 뒤에 있는 input의 값을 불러와 설정
	        var input = list[i].nextElementSibling;
	        var text = input.value;
	        editor.setValue(text);
		}
	}
    //body가 없는 경우에는 다음과 같이 작성
    // - 예약 실행(callback)
    // window 실행시 자동으로 editor 생성
	window.onload = function(){
		createEditor();
// 		createViewer();
		createMultiViewer();
    };

  		
</script>

<style>
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
	
		/* a태그 하이퍼링크 표시 제어 */
    a:link { color: black; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
	
		/* 공백 설정 */
	.empty{
		margin:2rem 0;
	}
	
	
		/* 목차 설정 */
	.sindex {
		margin-top:50px;
		margin-bottom:10%;
		background-color:	#f5f5f5;
		width: 150px;
		padding: 10px;
		border-radius: 10%;
	}
   .sindex>a {
		font-size: 0.8rem;
	}
	.sindex>a:hover {
		color: black; text-decoration: underline;
	}
	
	/* 상세글 style */
	.title {
	    font-size: 2rem;
    }	
	
    #etime{
      color: gray;
    }
        
    .udate {
		font-size: 13px;		        	
		float: right;
	}
	.udate::after {
		content: "";
		display: block;
		clear: both;
	}
	
	
    	/* '편집'버튼 설정 */    
	.btn {
		margin: 30px auto;
		padding: 0;
		
		overflow: hidden;
		border-width: 0;
		outline: none;
		border-radius: 2px;
		box-shadow: 0 1px 4px rgba(0, 0, 0, .6);
		  
		background-color: black;
		color: #ecf0f1;
		  
		transition: background-color .3s;
	}
		
	.btn:hover, .btn:focus {
		background-color: dimgray;
	}
		
	.btn > * {
		position: relative;
	}
			
	.btn span {
		display: block;
		padding: 8px 14px;
	}
		
	.btn:before {
		content: "";
		top: 50%;
		left: 50%;
		  
		display: block;
		width: 0;
		padding-top: 0;
		    
		border-radius: 100%;
		  
		background-color: rgba(236, 240, 241, .3);
		  
		-webkit-transform: translate(-50%, -50%);
		-moz-transform: translate(-50%, -50%);
		-ms-transform: translate(-50%, -50%);
		-o-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
	}
		
	.btn:active:before {
		width: 120%;
		padding-top: 120%;
		  
		transition: width .2s ease-out, padding-top .2s ease-out;
	}
		
		/* Styles, not important */
		*, *:before, *:after {
		  box-sizing: border-box;
		}
    
	/* 토론(댓글) style */
	.re-table {
		margin: 0px;
		width: 100%;
		border-radius: 2px;
	}
	.reply-list {
 		background-color: #f5f5f5;
		padding: 10px;
		border-bottom: 1px solid darkgray;
	}
	.reply-list div {
  		border-bottom: 1px dotted darkgray;
	}
	.reply-list #wdate {
		float: right;
	}
	.reply-list #wdate::after {
		content: "";
		display: block;
		clear: both;
	}        
	.re-table textarea[name=content]{
 		width:100%;
		height: 70px;
 		resize: none;
	}       
        
</style>

<%
	String keyword = request.getParameter("keyword"); 
	
	BoardDao boardDao = new BoardDao();
	BoardDto boardDto = boardDao.getSearch(keyword);   
	boardDao.searchCount(keyword); 
	
	BoardTextDao boardTextDao = new BoardTextDao();
	List<BoardTextDto> getList =boardTextDao.getList(keyword);	
// 	BoardTextDto boardtextdto = boardTextDao.get(boardno)
	
	String ip = request.getRemoteAddr();	//전송자 ip
	String writer = (String)request.getSession().getAttribute("id");
	
	BoardReplyDao boardReplyDao = new BoardReplyDao();
	List<BoardReplyDto> replyList = boardReplyDao.replyList(keyword);	
	
	// 승인된 후 첫글인지, 사용자가 수정한 글인지 판단
	boolean check = boardDao.check(keyword);
	// 파일 다운로드 파일정보 불러오기(List)
	BA_FileDao fdao = new BA_FileDao();
	List<BA_FileDto> flist=fdao.getList(keyword);
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/semi_common.css">

<jsp:include page="/template/header.jsp"></jsp:include>

<!-- 검색결과 페이지 -->
<% if(boardDto.getTitle()!=null){ %>

<article class="w-80">
	<div class="empty"></div>
	<div class="empty"></div>
	
	<div>					<!-- 대주제(검색어) -->
		<span class="title"><%=boardDto.getTitle() %></span>
		<span class="udate" id="etime">	<!-- '대주제'에 대한 수정내역 -->
			<a href="<%=request.getContextPath()%>/board/history.jsp?keyword=<%=keyword%>">
				HISTORY
			</a>
		</span><br>
	<span class="udate" id="etime">최근 수정 시간 : <%=boardDto.getUdate() %></span>
	</div>
	
	<div class="empty"></div>
	
	<!-- 승인된 글에 첨부파일이 있을 경우 출력-->
<%-- 	<%if(flist.size() > 0){ %> --%>
<!-- 		<div> -->
<%-- 			<%for(BA_FileDto fdto : flist){ %> --%>
<%-- 				<img src="filedown.do?no=<%=fdto.getNo()%>" class="img"> --%>
<%-- 			<%} %> --%>
<!-- 			<br> -->
<!-- 		</div> -->
<%-- 	<%} %> --%>
	
	<div class="empty"></div>
	
		<!-- 목차 영역 -->
 	 <div id = "list" class="sindex">
 		<%for(BoardTextDto boardTextDto:getList){ %>
			<%if(boardTextDto.getRn()==1){%>
				<a href ="#s-<%=boardTextDto.getRn()%>"><%=boardTextDto.getRn() %>:최초글</a><br>
			<%}else {%>
	
		 	 	<a href ="#s-<%=boardTextDto.getRn()%>"><%=boardTextDto.getRn() %>:<%=boardTextDto.getSub_title() %></a><br>
	
			<%} %>
		<%} %>
	</div>

	<!-- 상세글 영역 -->
<div align="center">

<table>	
	<%for(BoardTextDto boardTextDto:getList){ %>
		<%if(boardTextDto.getSub_title()==null) {%>
			<tr>
				<td class="" colspan="3"><%=boardTextDto.getRn() %>: 최초작성글이므로 목차가 설정되어있지 않습니다.
					<a href="boardedit.jsp?no=<%=boardTextDto.getNo()%>&boardno=<%=boardDto.getNo()%>&keyword=<%=boardDto.getTitle()%>">
						<button class="btn" type="button"><span>편집</span></button>
					</a>
				</td>
			</tr>
		<%}else{ %>
			<tr>
				<td class="" colspan="3"> <a id="s-<%=boardTextDto.getRn()+1 %>" href= "#list"><%=boardTextDto.getRn() %>
					</a>:<%=boardTextDto.getSub_title() %><a href="boardedit.jsp?no=<%=boardTextDto.getNo()%>&boardno=<%=boardDto.getNo()%>&keyword=<%=boardDto.getTitle()%>">
						<button class="btn" type="button"><span>편집</span></button>
					</a>
				</td>
			</tr>		
		<%} %>

		<tr>
			<td colspan="4" class="text">
				<div class="naver-viewer"></div>
				<input type="hidden" value="<%=boardTextDto.getText_content() %>">
			</td>
		</tr>
	
	<%} %>

	<tr>
		<td colspan = "4">
			<label for="show">[목차 추가]</label>
			<input type="checkbox" id="show" class="checkbox'">
			<div class="checked-show">
				<form action="textInsert.do" method="post"  enctype="multipart/form-data">
						<input type="hidden" name="keyword" value=<%=keyword %>>
						<input type="hidden" name="board_no" value="<%=boardDto.getNo()%>">
						<input type="text" name="sub_title" required class="sub-title" style="width:100%; height:5%;">				
						<input type="file" name="file" >								
						<div class="naver-editor"></div><input type="hidden" name="text_content">
							<span>
								문서 편집을 저장하면 기여한 내용을 CC-BY-NC-SA 2.0 KR으로 배포하고
								기여한 문서에 대한 하이퍼링크나 URL을 이용하여 저작자 표시를 하는 것으로
								충분하다는 데 동의하는 것입니다. 이 동의는 철회할 수 없습니다.
							</span>
							<input type="checkbox">
						<div align="right" style="margin: 2px 0px" class="checked-show">
							<input type="submit" class="btn" value="등록완료">							
						</div>
				</form>
						<%boardDao.editCheck(keyword); %>
								<%if(writer==null) {%>
									<p> 
										[알림] 비로그인 상태로 편집합니다. 편집 내역에 IP "<%=ip %>"가 영구히 기록됩니다.
									</p>
								<%} %> 
			</div>
		</td>
	
	</tr>

</table>

<label for="reply"><p align="left">[토론 보기]</p></label>
<input type="checkbox" id="reply" class="checkbox">
	
<table border="0" class="checked-show re-table">
	<%for(BoardReplyDto boardReplyDto: replyList){ %>
		<tr>
        	<td class="reply-list">
            <%if(boardReplyDto.getWriter()!=null){ %>
	            <div>
					<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?writer=<%=boardReplyDto.getWriter() %>">
		                <span id="writer"><%=boardReplyDto.getWriter() %></span>
		            </a>
		     <%} 
			else {%>
					<a href="<%=request.getContextPath()%>/board/memberHistory.jsp?ip_addr=<%=boardReplyDto.getIp_addr() %>">
						<span id="writer"><%=boardReplyDto.getIp_addr() %></span>
					</a>
				<%} %>
		                <span id="wdate"><%=boardReplyDto.getWdate() %></span>
	            </div>
            	<p>
               		<%=boardReplyDto.getContent() %>
            	</p>							
        	</td>
		</tr>
	<%} %>
	
	<!-- 토론(댓글) 입력창 -->
	<form action="replyInsert.do" method="post">                               
		<tr>
			<td>  
        	    <input type="hidden" name="board_title" value="<%=boardDto.getTitle()%>">	   
	            <textarea name="content" onkeyup="textLimit(this, 1000);" required></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <%if(writer==null) { %>
                    <P>[알림] 비로그인 상태로 토론에 참여합니다. 토론 내역에 IP "<%=ip %>"가 영구히 기록됩니다.</P>
                <%} %>
				<p>토론은 사용자에 의한 임의삭제가 불가능하므로 신중하게 작성하여 주시길 바랍니다.</p>            
			</td>
        </tr>
        <tr>
            <td align="right">
                <div><input type="submit" class="btn" value="등록"></div>
            </td>
        </tr>
	</form>
</table>


<!-- 검색결과가 없다면 -->
<% }else {%>
<table>	
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