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
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center"><h2>호텔 객실 예약</h2>
			<hr align="center" width="60%" size="1" color="gray">
			<br/>
			</td>
		</tr>
	</table>
<form action="roomReservation.action" method="post" enctype="multipart/form-data" onsubmit="return checkCash(this);">
	<table width="600" border="0" align="center">
			<img height="400" alt="객실사진" src="/remedium/image/roomClassImage/${image}" >
			<tr class="top">
				<td colspan=2>객실번호 : ${num }호</td>
				<td>객실정원 : ${room_capacity}명</td>
				<td>예약인원 : ${session.people}명</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="4"></td>
			</tr>
			<tr class="top">
				<td>입실날짜</td><td>${firstDate }</td>
				<td>퇴실날짜</td><td>${lastDate }</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="4"></td>
			</tr>	
			<tr class="top">
				<td colspan=2>예약금액</td><td colspan=2>${price }원</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="4"></td>
			</tr>
			<tr class="top">
				<td colspan=2>충전잔액</td><td colspan=2>${session.cash}원</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="4"></td>
			</tr>
			
	</table>
	<br>
<input type="hidden" name="no" value="${num}">
<input type="hidden" name="firstDate" value="${firstDate}">
<input type="hidden" name="lastDate" value="${lastDate}">
<input type="hidden" name="money" value="${price}">
<input type="hidden" name="memberID" value="${session.memberId}">
<input type="hidden" name="people" value="${session.people}">
<input type="hidden" name="cash" value="${session.cash}">



<input class="button" type="submit" value="객실예약">
<input class="button" type="button" value="처음으로" onclick="location.href='/remedium/main.action'" />
</form>
</div>
</body>
</html>