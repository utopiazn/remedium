<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ * 문의사항 상세보기</title>
<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>FAQ * 문의사항</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
		
<table width="1000" border="1" cellspacing="0" cellpadding="0">
      
			
      <tr align="center">
        <td width="100" bgcolor="#F4F4F4">질문 유형 </td>
        <td width="150" bgcolor="#FFFFFF">
          &nbsp;<s:property value="resultClass.type" />
        </td>
        <td width="100" bgcolor="#F4F4F4">제 목</td>
        <td  bgcolor="#FFFFFF">
          &nbsp;<s:property value="resultClass.subject" />
        </td>    
      </tr> 
      
      <tr >    
       	<td align="center" height="400"bgcolor="#F4F4F4">내 용 </td>
        <td colspan="3"bgcolor="#FFFFFF">
          &nbsp;<s:property value="resultClass.content" />
        </td>
       </tr>
  </table><br/>
 		 <input name="list" type="button" value="다른 질문" class="inputb" onClick="javascript:location.href='boardList.action'">
		<s:if test ="${ session.userAdmin == '1' }">
    		<input name="modify" type="button" value="글수정" class="inputb" onClick="javascript:location.href='boardModifyForm.action?no=<s:property value="resultClass.no" />&currentPage=<s:property value="currentPage" />'"> 
			<input type="button" value="글삭제" class="inputb" onClick="javascript:button_event('boardDelete.action?no=<s:property value="resultClass.no" />&ref=<s:property value="resultClass.ref" />&re_step=<s:property value="resultClass.re_step" />')">
		</s:if>
  
</body>
</html>