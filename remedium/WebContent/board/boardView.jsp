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
<style type="text/css">
a{
color: black;
}
.event{
margin : 20px; 
line-height: 2em;
color: black;
text-align: center;
}

.button{
    border: 3px solid #202f58;
    background-color : #202f58;
    display: inline-block;
    cursor: pointer;
    font-size: 13px;
    text-decoration: none;
    color: white;
 
}  
.top{
	background-color:#202f58;
	color: white;
}
</style>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
</head>
<body>
<div class="event">
	<table width="700" border="0" cellspacing="0" cellpadding="2" align="center">
	<tr>
  			<td align="center" ><h2>게시글 보기</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			<br/>
  			</td>
  			
  	</tr>
	</table>

 
	
		<table width="700" border="1" cellspacing="3" cellpadding="3" align="center">	
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 글번호</font></td>
			
				<td align="left" width="100" bgcolor="#FFFFFF">
				&nbsp; <s:property value="%{resultClass.no}"/> 
				</td>
				
				<td width="100" bgcolor="#202f58"><font color="white">* 작성자</font></td>

				<td align="left" width="100" bgcolor="#FFFFFF">
				&nbsp; <s:property value="%{resultClass.name}"/> 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 제 목</font></td>
				<td colspan="3" align="left" width="500" bgcolor="#FFFFFF">
				&nbsp; <s:property value="%{resultClass.subject}"/>					 
				</td>
			</tr>		
		
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 내 용</font>
				</td>
			
				<td colspan="3" align="left" height="300" width="500" bgcolor="#FFFFFF">
				&nbsp;	<s:property value="%{resultClass.content}" />				
				</td>
			</tr>
		
		</table><br/>
		
		<center>
		<input name="list" type="button" value="글목록" class="button" onClick="javascript:location.href='boardList.action'">
		<s:if test ="resultClass.Name == '${session.memberName }' || '${ session.userAdmin == '1' }'" >
    		<input name="modify" type="button" value="글수정" class="button" onClick="javascript:location.href='boardModifyForm.action?no=<s:property value="resultClass.no" />&currentPage=<s:property value="currentPage" />'"> 
			<input type="button" value="글삭제" class="button" onClick="javascript:button_event('boardDelete.action?no=<s:property value="resultClass.no" />&ref=<s:property value="resultClass.ref" />&re_step=<s:property value="resultClass.re_step" />')">
		</s:if>
		<s:if test="${ session.userAdmin == '1' }">
				<input type="button" value="답변" class="button" onClick="javascript:location.href='boardReplyForm.action?no=<s:property value="resultClass.no" />&currentPage=<s:property value="currentPage" />'"> 
		</s:if>
		</center>
</div>
</body>
</html>