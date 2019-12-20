
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>



<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/capture.png') repeat-x; text-align:center;">
      <td width="5"><img src="img/1.png" width="5" height="30" /></td>
      <td>댓글/토론</td>
      <td width="5"><img src="img/2.png" width="5" height="30" /></td>
     </tr>
    </table>
   <table>

     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="contents" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록">
       <input type=button value="취소">
      <td>&nbsp;</td>
     </tr>
    </table>
    


<jsp:include page="/template/footer.jsp"></jsp:include>