<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type="text/css">
a{
color: black;
}
.content{
margin-top: 20px; 
line-height: 2em;
color: black;
}

.button{
    border: 3px solid #202f58;
    background-color : #202f58;
    display: inline-block;
    cursor: pointer;
    font-size: 13px;
    text-decoration: none;
    color: white;
}
.bottom{
  padding-left: 46%;
  padding-top: 3%;
}
.top{
	background-color:#202f58;
	color: white;
}

</style>
</head>
<body>
 <div class="content">
 <table width="900" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center"><h2>호텔 객실 리스트</h2>
			<hr align="center" width="60%" size="1" color="gray">
			<br/>
			</td>
		</tr>
	</table>
	<table width="100%"><tr><td>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr class="top" align="center">
			<td><strong>객실번호</strong></td>
			<td><strong>객실이름</strong></td>
			<td><strong>객실테마</strong></td>
			<td><strong>객실구성</strong></td>
			<td><strong>정원</strong></td>
			<td><strong>예약금</strong></td>
		</tr>

	<s:if test="list.size() <= 0">
		<tr>
			<td colspan="6" align="center">예약가능한 객실이 없습니다</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="6"></td>
		</tr>
	</s:if>
	<s:else>
		<s:iterator value="list">
		<tr>
			<td align="center"><a href="/remedium/roomView.action?num=<s:property value="no"/>&firstDate=<s:property value="firstDate"/>&lastDate=<s:property value="lastDate"/>&people=<s:property value="people"/>"><s:property value="no"/>호</a></td>
			<td align="center"><a href="/remedium/roomView.action?num=<s:property value="no"/>&firstDate=<s:property value="firstDate"/>&lastDate=<s:property value="lastDate"/>&people=<s:property value="people"/>"><s:property value="name"/></a></td>
			<td align="center"><s:property value="class_name"/></td>
			<td align="left"><s:property value="construction"/></td>
			<td align="center">
			<s:if test="%{room_capacity == 0}">
			단체(5~10명 수용가능)
			</s:if>
			
			<s:else>
			<s:property value="room_capacity"/>명<br>
			</s:else></td>
			
			<td align="right">1일  <s:property value="price"/>원</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="6"></td>
		</tr>
		</s:iterator>
	</s:else>
	</table></td></tr>
	
	<tr align="center">
			<td><s:property value="pagingHtml" escape="false"/></td>
	</tr>
	
	<s:if test="${ session.userAdmin != '1' }">
	<tr><td align="center">
	<strong><b>${ firstDate } ~ ${ lastDate }
	<br> 예약가능 리스트</b></strong>
	</td></tr>
	</s:if>
	
	<s:if test="${ session.userAdmin == '1' }">
	<tr><td align="right">
	<input class="button" type="button" value="객실추가" onclick="location.href='/remedium/roomInsertForm.action'"/>
	</td></tr>
	</s:if>
	</table>
</div>
</body>
</html>