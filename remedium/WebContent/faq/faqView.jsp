<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<style type="text/css">
a{
color: black;
}
.event{
margin : 20px; 
line-height: 2em;
color: black;
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
<meta charset="UTF-8">
<title>FAQ 상세보기</title>
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
<div class="event">
<table width="850" border="0" cellspacing="0" cellpadding="2" align="center">
  	<tr>
  			<td align="center" ><h2>게시글 보기</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			<br/>
  			</td>
  			
  	</tr>
  	</table>
		
<table width="850" border="1" cellspacing="0" cellpadding="0" align="center">
      
			
 
        <td width="80" bgcolor="#202f58"><font color="white"> 질문 유형</font> </td>
        <td align="left" width="40" bgcolor="#FFFFFF">
          &nbsp;<s:property value="resultClass.type" />
        </td>
        <td width="30" bgcolor="#202f58"><font color="white"> 제 목</font></td>
        <td align="left" width="150" bgcolor="#FFFFFF">
          &nbsp;<s:property value="resultClass.subject" />
        </td>    
      </tr> 
      
      <tr >    
       	<td width="80" height="300" bgcolor="#202f58"><font color="white"> 내 용 </font></td>
        <td colspan="3" bgcolor="#FFFFFF" class="td" align="left" style="vertical-align: top;">
          &nbsp;A. <s:property value="resultClass.content" />
        </td>
       </tr>
  </table><br/>
 		 <input name="list" type="button" value="다른 질문" class="button" onClick="javascript:location.href='faqList.action'">
		<s:if test ="${ session.userAdmin == '1' }">
    		<input name="modify" type="button" value="글수정" class="button" onClick="javascript:location.href='faqModifyForm.action?faqId=<s:property value="resultClass.faqId" />'"> 
			<input type="button" value="글삭제" class="button" onClick="javascript:button_event('faqDelete.action?faqId=<s:property value="resultClass.faqId" />')">
		</s:if>
  </div>
</body>
</html>