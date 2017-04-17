<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
 
 <table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center"><b>호텔 객실 리스트</b></td>
		</tr>
	</table>
	
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr align="center">
			<td><strong>객실번호</strong></td>
			<td><strong>객실이름</strong></td>
			<td><strong>객실테마</strong></td>
			<td><strong>정원</strong></td>
			<td><strong>예약금</strong></td>
		</tr>

	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="5" align="center">등록된 객실이 없습니다</td>
		</tr>
	</s:if>
	<s:else>
		<s:iterator value="list">
		<tr>
			<td align="right"><s:property value="no"/>호</td>
			<td align="center"><s:property value="name"/></td>
			<td><s:property value="room_class"/></td>
			<td align="right"><s:property value="room_capacity"/>명</td>
			<td align="right"><s:property value="price"/>원</td>
		</tr>
		</s:iterator>
	</s:else>
	</table>
</body>
</html>