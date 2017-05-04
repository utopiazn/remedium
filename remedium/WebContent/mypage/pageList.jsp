<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

 <style type="text/css">
a{
color: black;
}
.content{
margin : 5% auto; 
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
		<td align="center"><h2>객실 예약 리스트</h2>
		<hr align="center" width="60%" size="1" color="gray">
		<br/>
		</td>
	</tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr class="top" align="center">
<td><strong>회원 ID</strong></td>
<td><strong>예약 번호</strong></td>
<td><strong>객실 번호</strong></td>
<td><strong>입실 날짜</strong></td>
<td><strong>퇴실 날짜</strong></td>
<td><strong>예약 인원</strong></td>
<td><strong>예약금</strong></td>
<td><strong>예약완료 여부</strong></td>
</tr>
<s:if test="reslist.size() <= 0">
	<tr>
		<td colspan="8" align="center">예약된 객실이 없습니다</td>
	</tr>
	<tr bgcolor="#777777">
		<td height="1" colspan="8"></td>
	</tr>
</s:if>
<s:else>
<s:iterator value="reslist">
<tr>
<td><s:property value="memberID"/></td>
<td><s:property value="reservationNo"/></td>
<td><s:property value="no"/></td>
<td><s:property value="firstDate"/></td>
<td><s:property value="lastDate"/></td>
<td><s:property value="people"/></td>
<td><s:property value="money"/></td>
<td>
<s:if test='%{reservationCheck.equals("n")}'>
[예약대기중]
</s:if>
<s:elseif test='%{reservationCheck.equals("y")}'>
[예약완료]
</s:elseif>
<s:if test='${session.userAdmin=="1"}'><br>
<form action="roomAdminReservationCancel.action" method="post" encType="multipart/form-data">
<s:hidden name="reservationNo" value="%{reservationNo}" />
<s:hidden name="money" value="%{money}" />
<s:hidden name="memberID" value="%{memberID}" />
<s:if test='%{reservationCheck.equals("n")}'>
<input class="button" type="button" value="예약확인" onclick="location.href='roomAdminReservation.action?reservationNo=${reservationNo}'">
</s:if>
<input class="button" type="submit" value="예약취소">
</form>
</s:if>
</td>
</tr>
<tr bgcolor="#777777">
	<td height="1" colspan="8"></td>
</tr>
</s:iterator>
</s:else>
<tr align="center">
	<td colspan="8"><s:property value="pagingHtml" escape="false"/></td>
</tr>
</table>
</div>
</body>
</html>