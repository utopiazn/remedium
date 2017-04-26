<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<?xml version="1.0" encoding="UTF-8" ?>
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" >
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
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
</head>
<body>



	<s:if test="resultClass == NULL">
		<form action="faqWrite.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>
	
	<s:else>
		<form action="faqModify.action" method="post" enctype="multipart/form-data">
			<s:hidden name="faqId" value="%{resultClass.faqId}" />
	</s:else> 
	
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	
		<tr>
			<td align="center">
				<h2>자주 묻는 질문 쓰기</h2>
			</td>
		</tr>	
		
	
	</table>

 
	
		<table width="1000" border="1" cellspacing="0" cellpadding="0">
      
			
      <tr align="center">
        <td width="100" bgcolor="#F4F4F4">질문 유형 <s:textfield name="type" value="resultClass.type" /> </td>
       
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
	<center>
		<input type="submit" value="작성 완료">
    	<input name="modify" type="button" value="목록" class="inputb" onClick="javascript:location.href='faqList.action'"> 	
	</center>
</form>
</body>
</html>