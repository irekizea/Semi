<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- naver toast ui를 사용하기 위한 준비 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/css/codemirror.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/css/github.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/css/tui-color-picker.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/dist/tui-editor.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/lib/toast/dist/tui-editor-contents.min.css">
<script src="<%=request.getContextPath()%>/lib/toast/dist/tui-editor-Editor-full.min.js"></script>

<!-- 에디터 스크립트 초기화. 재구현 필요. -->

<style>
/* /* 실제 input 또는 textarea 숨김처리 */	 */
/*      .naver-editor + textarea {  */
/*  		display: none;  */
/*  	} */

/* ba_board Write.jsp style */
    .his-board{
        border-collapse: collapse;
    }
    .his-board * {
        margin: 0.5rem 0;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .his-board .w-title{
        background-color: whitesmoke;
        width: 5rem;
        height: auto;        
    }

    input {
        outline: none;
    }
    input[type=text],
    input[type=file]{
        margin: 0 1rem;
        padding: 0 1rem;
        
        height: 2rem;
        width: 100%;
    }
    .his-board .ok{
        border: whitesmoke;       
    }
     .his-board .cancle {
        border: black;       
    }
</style>

<jsp:include page="/template/header.jsp"></jsp:include>

<div class="row-empty"></div>
<div class="row-empty"></div>
    <div align="center">
    
	<form action="write.do" method="post"  enctype="multipart/form-data">
	<table class="his-board" border="0" width="80%">

				<tr>
				<th class="w-title">제목</th>
					<td>
						<input type="text" name="title" required placeholder="게시글 제목을 입력하세요"
									style="width: 100%; height: 1rem;">
					</td>
				
				</tr>
				
				<tr>
					<td colspan="2" style="border: 0.5px solid black; height:500px">
						<textarea name="content" rows="15" cols="100" required
										style="resize: vertical;"></textarea>
					</td>
				</tr>
			
				<tr>
					<th class="w-title">첨부파일</th>
						<td>
<!-- 						<input type="text" name="id" placeholder="임시 아이디 입력공간"> -->
							<input type="file" name="file" accept="jpg,png,gif">
						</td>
				</tr>
			<tr>
				<th colspan="2">
					<input type="submit" class="ok" value="확인" style="width:100%; height: 3rem;">
				</th>
			</tr>
			<tr>
                <th colspan="2">
                	<input type="submit" class="cancle" value="취소" style="width:100%; height: 2rem;">
                </th>
            </tr>
		</table><br>
	
	</form>
    </div>
    <span style="margin:0 4rem;">[알림] 글 작성 후 수정은 불가능하며, 추가만 가능하다는 점 유의해주십시오.</span>

<jsp:include page="/template/footer.jsp"></jsp:include>