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
	<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
	
	<s:iterator value="list" >
	
		<tr height="50">
		<td><strong>시설이름</strong></td>
		<td rowspan=4><a href='/remedium/facilitiesView.action?no=<s:property value="no" />'><img width="640" height="400" alt="시설사진" src="/remedium/image/facImage/<s:property value='image'/>" ></a></td>
		</tr>
		<tr bgcolor="00afff">
			<td width="20%" align="center"><b><a href='/remedium/facilitiesView.action?no=<s:property value="no" />'><s:property value="name" /></a></b></td>
		</tr>
		<tr height="50"><td><strong>개장시간</strong></td></tr>
		<tr bgcolor="00afff">
			<td width="20%" align="center"><s:property value="time" /></td>
		</tr>
		
	</s:iterator>
	
		<tr align="center">
			<td colspan="2"><s:property value="pagingHtml"  escape="false" /></td>
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


