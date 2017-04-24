<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  			<td align="center"><h2>편의 시설</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	      <tr align="center" bgcolor="#F3F3F3">
      		<td width="50"><strong>번호</strong></td>
		<td width="350"><strong>제목</strong></td>
        		<td width="80"><strong>날짜</strong></td>
		<td width="50"><strong>조회</strong></td>
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="4"></td>
      	      </tr>

	      <s:iterator value="list" >

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
        		<td align="left"> &nbsp;<s:a href="%{viewURL}"><s:property value="name" /></s:a></td>
        		<td align="center"><s:property value="name" /></td>
		<td align="center"><s:property value="regdate" /></td>
        		<td><s:property value="readhit" /></td>
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="4"></td>
      	      </tr>
      
	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
				
	      <tr bgcolor="#777777">
      		<td height="1" colspan="4"></td>
    	      </tr>
    		
	      </s:if>
			
	      <tr align="center">
    		<td colspan="4"><s:property value="pagingHtml"  escape="false" /></td>
    	      </tr>
	</table>
</body>
</html>


