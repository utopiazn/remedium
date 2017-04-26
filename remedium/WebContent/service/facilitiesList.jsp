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
		
	
	<tr><td>
	<table width="600" border="1" cellspacing="0" cellpadding="2" align="center">
	<tr align="center" bgcolor="#F3F3F3">
		<td width="350"><strong>시설이름</strong></td>
		<td width="80"><strong>개장시간</strong></td>
	</tr>
	
	
	<s:iterator value="list" >
		
		<tr bgcolor="#FFFFFF"  align="center">
			<td align="left"><s:property value="name" /></td>
			<td align="center"><s:property value="regdate" /></td>
		</tr>
	
	</s:iterator>
	
		<tr align="center">
			<td colspan="3"><s:property value="pagingHtml"  escape="false" /></td>
		</tr>
	</table>
	</td></tr>
	<tr><td align="right">
	<s:if test="${session.userAdmin == 1 }">
	
	<input type="button" value="시설추가"onClick="location.href='facilitiesInsertForm.action'">
	</s:if>
	</td></tr>
	</table>
</body>
</html>


