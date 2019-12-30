<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/codemirror.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/github.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/css/tui-color-picker.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/dist/tui-editor.min.css">
    <link rel="stylesheet" type="text/css" href="../lib/toast/dist/tui-editor-contents.min.css">

    <!-- naver toast ui editor를 쓰기 위해 필요한 준비물 -->
    <script src="../lib/toast/dist/tui-editor-Editor-full.min.js"></script>

    <script>
        //naver toast ui를 만들기 위한 코드
        function createEditor(){
            //editor 옵션
            var options = {
                //el(element) : 에디터가 될 영역
                el:document.querySelector(".naver-editor"),
                //previewStyle : 표시되는 방식(horizontal, vertical)
                previewStyle:'vertical',
                //height : 생성될 에디터의 높이
                height:'300px',
                //initialEditType : 생성될 에디터의 초기화면 형태(markdown, wysiwyg)
                initialEditType:'wysiwyg'
            };
            //editor 생성 코드
            var editor = tui.Editor.factory(options);
            //editor에 이벤트를 설정해서 입력하면 자동으로 input에 복사되게 구현
            //- input이라는 상황이 발생하면 오른쪽 function을 실행하라
            //- oninput이랑 동일한데 자바스크립트로만 구현
            editor.on("change", function(){
                //editor의 입력값을 가져와서 input에 설정
                var text = editor.getValue();
                var input = document.querySelector(".naver-editor + textarea");
                input.value = text;
            });
        }
        //body가 없는 경우에는 다음과 같이 작성
        // - 예약 실행(callback)
        window.onload = createEditor;
    </script>

<style>

	body{
	margin:0px;
	background: #f5f5f5;
	}
		
/* 실제 input 또는 textarea 숨김처리 */
     .naver-editor + textarea { 
 		display: none; 
 	}

/* ba_board Write.jsp style */
	* {
		box-sizing: border-box;
	}
    .his-board{
        border-collapse: collapse;
    }
    .his-board * {
        margin: 0.5rem 0;
    }
    .his-board .w-title{
        background-color: whitesmoke;
        width: 5rem;
        height: auto;        
    }

    input {
        outline: none;
    }
    input[type=text]{
        padding: 0 1rem;
        height: 2rem;
        width: 100;
    }
    .his-board .ok{
        border: whitesmoke;
        width:100%;
        height: 3rem;       
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
									style="width: 100%; height: 2rem;">
					</td>
				</tr>
				
				<tr>
					<td colspan="2" style="border: 0.5px solid black;">
					<div class="naver-editor"></div>  
						<textarea name="content" rows="15" cols="100" required
										style="resize: vertical;"></textarea>
					</td>
				</tr>
				
				<tr>
					<th class="w-title">첨부파일</th>
						<td>
							<input type="file" name="file" accept="jpg,png,gif">
						</td>
				</tr>
			<tr>
				<th colspan="2">
					<input type="submit" class="ok" value="등록">
				</th>
			</tr>
			<tr>
				<td colspan="2">
					[알림] 글 작성 후 수정은 불가능하며, 추가만 가능하다는 점 유의해주십시오.
				</td>
			</tr>
		</table><br>
		
		</form>
    </div>


<jsp:include page="/template/footer.jsp"></jsp:include>