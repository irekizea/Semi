<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>헤더</h1>

	<form action="write.do" method="post">
	<table border="1">

				<tr>
					<th>첨부파일</th>
						<td>
							<input type="file" name="file" accept="jpg,png,gif">
						</td>
				</tr>
				
				
				<tr>
				<th>제목</th>
					<td>
						<input type="text" name="title" required placeholder="게시글 제목을 입력하세요">
					</td>
				
				</tr>
				
			<tr>
				<th>내용</th>
				<td>
				<textarea name="content" rows="15" cols="100" required
				style="resize: vertical;"></textarea>
				</td>
			</tr>
			
			<tr>
				<th colspan="2">
					<input type="submit" value="확인">
				</th>
			</tr>
		</table><br>
	
	</form>
	<h5>※글 작성 후 수정은 불가능하며, 추가만 가능하다는 점 유의해주십시오.※</h5>

<h1>푸터</h1>