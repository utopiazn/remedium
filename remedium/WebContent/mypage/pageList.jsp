<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

 <style type="text/css">
table
{
font-family: "돋움",sans-serif; color: #000000; text-align: center; font-weight: bolder;  text-decoration: none;
 }
 </style>
 
</head>
<body>
<br>

<h2><b>예 약 목 록</b></h2>

<table width="100%" border="1" cellspacing="0" cellpadding="3">
<tr valign="middle" bgcolor="#F3F3F3">
<td><strong>회원 ID</strong></td>
<td><strong>예약 번호</strong></td>
<td><strong>객실 번호</strong></td>
<td><strong>입실 날짜</strong></td>
<td><strong>퇴실 날짜</strong></td>
<td><strong>예약 인원</strong></td>
<td><strong>예약금</strong></td>
<td><strong>예약완료 여부</strong></td>
</tr>

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
<input type="button" value="예약확인" onclick="location.href='roomAdminReservation.action?reservationNo=${reservationNo}'">
<input type="submit" value="예약취소">
</form>
</s:if>
</td>
</s:iterator>
<tr align="center">
	<td colspan="8"><s:property value="pagingHtml" escape="false"/></td>
</tr>
</table>

</body>
</html>