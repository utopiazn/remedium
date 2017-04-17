<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
 
 <table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><b>임시 리스트 표입니다.</b></td>
		</tr>
	</table>
	
	<table width="600" border="1" cellspacing="0" cellpadding="2">
		<tr align="center">
			<td width="50"><font color=blue><strong>방번호</strong></font></td>
			<td width="350"><font color=blue><strong>이름</strong></font></td>
		</tr>

	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="2" align="center">등록된 게시물이 없습니다</td>
		</tr>
	</s:if>
	<s:else>
		<s:iterator></s:iterator>
		<tr>
			
		
		
	</s:else>
	
	

	</table>
 

</body>
</html>