<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>EVENT</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  			<td align="center"><h2>EVENT＊PROMOTION</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	      <tr align="center" bgcolor="#F3F3F3">
      		<td width="50"><strong>번호</strong></td>
		<td width="350"><strong>이벤트</strong></td>
        		<td width="120"><strong>이벤트 시작</strong></td>
				<td width="120"><strong>이벤트 종료</strong></td>
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
			
	      <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	  </tr>
    	  
    	  <tr align="right">
    	  	<td colspan="5">
    	  	<input type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='eventInsertForm.action'">
    	  	</td>
    	  </tr>
	</table><br/>
	
	
</body>
</html>