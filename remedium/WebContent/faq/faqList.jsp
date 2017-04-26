<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ</title>
</head>
<body>
<table width="800" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>FAQ</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  
	<table width="800" border="0" cellspacing="0" cellpadding="2">
	      <tr align="center" bgcolor="#F3F3F3">
      		<td width="50"><strong>질문유형</strong></td>
		<td width="450"><strong>제목</strong></td>
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>

	      <s:iterator value="list" status="stat">

		<s:url id="viewURL" action="faqView" >
			<s:param name="faqId">
				<s:property value="faqId" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
			
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td style="border-bottom: 1px solid #666;"><s:property value="type" /></td>
        		<td style="border-bottom: 1px solid #666;" align="left"> &nbsp;<s:a href="%{viewURL}">Q. <s:property value="subject" /></s:a></td>
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
    	  	<s:if test ="${ session.userAdmin == '1' }">
    	  	<td colspan="5"><input type="button" value="추 가" class="inputb" onClick="javascript:location.href='faqWriteForm.action'"> 
    	  	</td>
    	  	</s:if>
    	  </tr>
	</table> 
			
</body>
</html>