<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>EVENT</title>
<link href="css/board.css" rel="stylesheet" style="text/css">
<style type="text/css">
a{
color: black;
}
.event{
margin : 5% auto; 
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
</head>
<body>
<div class="event">

<table width="900" border="0" cellspacing="0" cellpadding="0" align="center" >
  		<tr>
  		<br>
  		<br> 
  			<td align="center"><h2>EVENT＊PROMOTION</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  		
  			<br>
  			
  			</td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	

	<table width="900"  border="0" cellspacing="0" cellpadding="0" align="center">
	    <tr align="center" class="top">
      	<td width="50"><strong>NO</strong></td>
		<td width="350"><strong>이벤트</strong></td>
        <td width="140"><strong>이벤트 시작</strong></td>
		<td width="140"><strong>이벤트 종료</strong></td>
		<td width="130"><strong>수정 / 삭제</strong></td>
      	</tr>
  
       <tr bgcolor="#777777">
       <td height="1" colspan="5"></td>
      </tr>
      	    
     

	      <s:iterator value="list" >

			<s:url id="viewURL" action="eventView" >
				<s:param name="no">
					<s:property value="no" />
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage" />
				</s:param>
			</s:url>
				
	     	      <tr bgcolor="#FFFFFF"  align="center">
	        		<td><s:property value="no" /></td>
	        		<td align="center"> &nbsp;<s:a href="%{viewURL}"><s:property value="name" /></s:a></td>
	        		<td align="center"><s:property value="firstdate" /></td>
					<td align="center"><s:property value="lastdate" /></td>
	        	    <td align="center">
		 		
		 			<a href='eventModifyForm.action?no=<s:property value="no"/>'>수정</a>&nbsp;/ 
		 			<a href='eventDelete.action?no=<s:property value="no"/>'>삭제</a>
		 		</td>		
	      	      </tr>
	      	      <tr bgcolor="#777777">
	        		<td height="1" colspan="5"></td>
	      	      </tr>
      
	      </s:iterator>
	

	      <s:if test="list.size() <= 0">
				
	      <tr bgcolor="#777777">
      		<td height="1" colspan="5"></td>
    	      </tr>
    		
	      </s:if>
	      
	  
			<br/>
	      <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	  </tr>
    	  
    	  <tr align="right">
    	  	<td colspan="5">
    	  	<input class="button" type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='eventInsertForm.action'">
    	  	</td>
    	  </tr>
   
	</table>

	<br/>
	
</div>
</body>
</html>