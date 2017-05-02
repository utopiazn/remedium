<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ * 문의사항 상세보기</title>
	<script type="text/javascript">
	  
	function button_event(url){
		var del = confirm("이 글을 정말로 삭제 하시겠습니까??");
		
		if(del == true){
			alert("삭제하였습니다.");			
			document.location.href=url;
		}
		else{
			alert("취소하셧습니다.");
			return
		}
		
	}
	</script>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  		<br>
  		<br>
  			<td align="center"><h2>FAQ * 문의사항</h2>
  		<br>
  		<br>
  			</td>
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
          &nbsp;A. <s:property value="resultClass.content" />
        </td>
       </tr>
  </table><br/>
 		 <input name="list" type="button" value="다른 질문" class="inputb" onClick="javascript:location.href='faqList.action'">
		<s:if test ="${ session.userAdmin == '1' }">
    		<input name="modify" type="button" value="글수정" class="inputb" onClick="javascript:location.href='faqModifyForm.action?faqId=<s:property value="resultClass.faqId" />'"> 
			<input type="button" value="글삭제" class="inputb" onClick="javascript:button_event('faqDelete.action?faqId=<s:property value="resultClass.faqId" />')">
		</s:if>
  
</body>
</html>