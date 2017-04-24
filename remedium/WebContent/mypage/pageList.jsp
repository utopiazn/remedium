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

<table width="70%" border="0" cellspacing="5" cellpadding="0">
<tr valign="middle" bgcolor="#F3F3F3">
<td width="150"><strong>예약 번호</strong></td>
<td width="150"><strong>객실 번호</strong></td>
<td width="150"><strong>입실 날짜</strong></td>
<td width="150"><strong>퇴실 날짜</strong></td>
<td width="150"><strong>예약금</strong></td>
<td width="150"><strong>회원 ID</strong></td>
<td width="150"><strong>예약 인원</strong></td>
</tr>

<s:iterator value="reslist">
<tr>
<td><s:property value="reservationNo"/></td>
<td><s:property value="no"/></td>
<td><s:property value="firstDate"/></td>
<td><s:property value="lastDate"/></td>
<td><s:property value="money"/></td>
<td><s:property value="memberID"/></td>
<td><s:property value="people"/></td>
</s:iterator>

</table>

</body>
</html>