<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의사항</title>
</head>
<body>
<table width="800" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>문의사항</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  
	<table width="800" border="0" cellspacing="0" cellpadding="2">
	      <tr align="center" bgcolor="#C0C0C0">
      		<td width="50"><strong>번호</strong></td>
		<td width="450"><strong>제목</strong></td>
        		<td width="80"><strong>날짜</strong></td>
		<td width="50"><strong>조회</strong></td>
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>

	      <s:iterator value="list" status="stat">

		<s:url id="viewURL" action="viewAction" >
			<s:param name="no">
				<s:property value="no" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
			
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td><s:property value="no" /></td>
        		<td align="left"> &nbsp;<s:a href="%{viewURL}"><s:property value="subject" /></s:a></td>
        		<td align="center"><s:property value="name" /></td>
		<td align="center"><s:property value="regdate" /></td>
        		<td><s:property value="readhit" /></td>
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
	</table>
</body>
</html>