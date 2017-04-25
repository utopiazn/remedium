<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<script type="text/javascript">		
	
		function checkCash(userinput){
			
			var m = parseInt(userinput.money.value);
			var c = parseInt(userinput.cash.value);
			
			if(m > c){
				alert("현재 충전하신 잔액이 부족합니다.");
		 		return false;
			}
			
			if(m <= c){
				alert("객실 예약을 성공적으로 마쳤습니다.");
		 		return true;
			}
		}
</script>

</head>
<body>
<form action="roomReservation.action" method="post" enctype="multipart/form-data" onsubmit="return checkCash(this);">
	<table width=100% border="1">
			<img height="400" alt="객실사진" src="/remedium/image/roomImage/file_${num }.jpg" >
			<tr>
				<td colspan=2>객실번호 : ${num }호</td><td colspan=2>객실정원 : ${room_capacity }명</td>
			</tr>
			<tr>
				<td>입실날짜</td><td>${firstDate }</td><td>퇴실날짜</td><td>${lastDate }</td>
			</tr>
			<tr>
				<td colspan=2>예약금액</td><td colspan=2>${price }원</td>
			</tr>
			<tr>
				<td colspan=2>충전잔액</td><td colspan=2>${session.cash}원</td>
			</tr>
			
	</table>
<input type="hidden" name="no" value="${num}">
<input type="hidden" name="firstDate" value="${firstDate}">
<input type="hidden" name="lastDate" value="${lastDate}">
<input type="hidden" name="money" value="${price}">
<input type="hidden" name="memberID" value="${session.memberId}">
<input type="hidden" name="people" value="${people}">
<input type="hidden" name="cash" value="${session.cash}">



<input type="submit" value="객실예약">
<input type="button" value="처음으로" onclick="location.href='/remedium/main.action'" />
</form>
</body>


</html>