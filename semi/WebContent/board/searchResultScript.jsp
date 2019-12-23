<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <script>
	 <!-- 댓글(토론) 입력 글자수 제한 스크립트-->
	 function textLimit(reply, maxByte) {				// textLimit(입력문자열 이름, max크기)
		 
	     var strValue = reply.value;						//입력문자열 값의 변수
	     var strLen = strValue.length;					//입력문자열 값 길이의 변수
	     
	     var totalByte = 0;									// 문자크기(영문/한글)를 구하기 위한 변수값 초기화
	     var len = 0;											// 입력문자열의 길이제한을 위한 변수
	     
	     var oneChar = "";									// 글자 1개 크기를 추출할 비어있는 변수
	     var reply2 = "";										// 최대허용 문자열을 담을 비어있는 변수
	
	     for (var i = 0; i < strLen; i++) {				//입력문자열 길이만큼 i 증가
	         oneChar = strValue.charAt(i);				//입력문자열의 i 하나씩 oneChar
	         if (escape(oneChar).length > 4) {
	             totalByte += 2;								//totalByte +2 ? 한글
	         } else {
	             totalByte++;									//totalByte +1 ? 영문
	         }
	         
	         // 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
	         if (totalByte <= maxByte) {					// 위에서 구한 total값이 max값과 같게 되면
	             len = i + 1;									// 입력문자길이(i)에 +1 한다.
	         }
	     }
	
	     // 넘어가는 글자는 자른다.
	     if (totalByte > maxByte) {						// 위에서 구한 max가 total보다 크면
	         alert("토론은"+maxByte + "자를 초과 입력 할 수 없습니다.");
	         reply2 = strValue.substr(0, len);			// 최대허용문자열(reply2) = 입력문자열의 0 ~ 문자길이+1(len)
	         reply.value = reply2;
	         textLimit(reply, 4000);	
	     }
	 }
	 
 </script>

</head>
<body>

</body>
</html>