<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
	<tr>
			<td align="right"><s:property value="resultClass.no"/>호</td>
	</tr>
	<tr>
			<td align="center"><s:property value="resultClass.name"/></td>
	</tr>
	<tr>
			<td><s:property value="resultClass.room_class"/></td>
	</tr>
	<tr>
			<td align="right"><s:property value="resultClass.room_capacity"/>명</td>
	</tr>
	<tr>
			<td align="right"><s:property value="resultClass.price"/>원</td>
	</tr>
	</table>
	<a href='/remedium/roomDelete.action?no=<s:property value="resultClass.no"/>' >객실삭제</a>
</body>
</html>