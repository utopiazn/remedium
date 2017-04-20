<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>

<form action="roomReservation.action" method="post" enctype="multipart/form-data">
	<table border="1">
			<tr>
				<td>객실번호</td><td>${num }</td>
			</tr>
			<tr>
				<td>객실정원</td><td>${room_capacity }</td>
			</tr>
			<tr>
				<td>입실날짜</td><td>${firstDate }</td>
			</tr>
			<tr>
				<td>퇴실날짜</td><td>${lastDate }</td>
			</tr>
			
	</table>


<input type="button" value="객실예약완료" onclick="location.href='/remedium/roomReservation.action'" />
</form>
</body>
</html>