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
		<td width="20%"><strong>시설이름</strong></td>
		<td width="50%"><strong>시설정보</strong></td>
		<td width="30%"><strong>개장시간</strong></td>
	</tr>
	
	
	<s:iterator value="list" >
		
		<tr bgcolor="#FFFFFF"  align="center">
			<td align="left"><b><a href='/remedium/facilitiesView.action?no=<s:property value="no" />'><s:property value="name" /></a></b></td>
			<td align="left"><s:property value="content" /></td>
			<td align="center"><s:property value="time" /></td>
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


