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
	<table width="100%"><tr><td>
	<table width="100%" border="1" cellspacing="0" cellpadding="0">
		<tr align="center">
			<td><strong>객실번호</strong></td>
			<td><strong>객실이름</strong></td>
			<td><strong>객실테마</strong></td>
			<td><strong>객실구성</strong></td>
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
			<td align="right"><a href="/remedium/roomView.action?num=<s:property value="no"/>&firstDate=<s:property value="firstDate"/>&lastDate=<s:property value="lastDate"/>"><s:property value="no"/>호</a></td>
			<td align="center"><a href="/remedium/roomView.action?num=<s:property value="no"/>&firstDate=<s:property value="firstDate"/>&lastDate=<s:property value="lastDate"/>"><s:property value="name"/></a></td>
			<td align="center">
			<s:if test="%{room_class==1}">
			기본 방
			</s:if>
			<s:elseif test="%{room_class==2}">
			좋은 방
			</s:elseif>
			<s:elseif test="%{room_class==3}">
			독방...?
			</s:elseif>
			<s:elseif test="%{room_class==4}">
			사막ㅠㅠ
			</s:elseif>
			<s:elseif test="%{room_class==5}">
			툰드라 ㄷㄷ
			</s:elseif>
			<s:else>여기가 그유명한 지옥이라네요!</s:else>
			</td>
			<td align="left"><s:property value="construction"/></td>
			<td align="right">
			<s:if test="%{room_capacity == 0}">
			단체(5~20명 수용가능)
			</s:if>
			
			<s:else>
			<s:property value="room_capacity"/>명<br>
			</s:else></td>
			
			<td align="right"><s:property value="price"/>원</td>
		</tr>
		</s:iterator>
	</s:else>
	</table></td></tr>
	<tr><td align="center">
	<strong><b>${ firstDate } ~ ${ lastDate }
	<br> 예약가능 리스트</b></strong>
	</td></tr>
	<s:if test="${ session.userAdmin == '1' }">
	<tr><td align="right">
	<input type="button" value="객실추가" onclick="location.href='/remedium/roomInsertForm.action'"/>
	</td></tr>
	</s:if>
	</table>
</body>
</html>