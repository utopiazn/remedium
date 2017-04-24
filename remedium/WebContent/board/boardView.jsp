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

	
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	
		<tr>
			<td align="center">
				<h2>글 상세 보기</h2>
			</td>
		</tr>	
		
	
	</table>

 
	
		<table width="600" border="1" cellspacing="3" cellpadding="3" align="center">	
			<tr>
				<td width="50" bgcolor="#F4F4F4" >
					<font color="#FF0000">* </font>글번호 
				</td>
			
				<td  bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.no}"/> 
				</td>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>작성자
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.Name}"/>					 
				</td>
			</tr>
			
			<tr >
				<td width="100" bgcolor="#F4F4F4" >
					<font color="#FF0000">* </font>제 목 
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan="3" >
					<s:property value="%{resultClass.subject}"/>					 
				</td>
			</tr>		
		
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>내 용
				</td>
			
				<td width="50" height="300" bgcolor="#FFFFFF" colspan="3">
					<s:property value="%{resultClass.content}" />				
				</td>
			</tr>
		
		</table><br/>
		<center>
		
		<input name="list" type="button" value="글목록" class="inputb" onClick="javascript:location.href='boardList.action'">
		<s:if test ="resultClass.Name == '${session.memberName }' || '${ session.userAdmin == '1' }'" >
    		<input name="modify" type="button" value="글수정" class="inputb" onClick="javascript:location.href='boardModifyForm.action?no=<s:property value="resultClass.no" />&currentPage=<s:property value="currentPage" />'"> 
			<input type="button" value="글삭제" class="inputb" onClick="javascript:button_event('boardDelete.action?no=<s:property value="resultClass.no" />')">
		</s:if>
		<s:if test="${ session.userAdmin == '1' }">
				<input type="button" value="답변" class="inputb" onClick="javascript:location.href='boardReplyForm.action?no=<s:property value="resultClass.no" />&currentPage=<s:property value="currentPage" />'"> 
		</s:if>
		</center>
</body>
</html>