<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>

<form action="roomReservation.action" method="post" enctype="multipart/form-data">
	<table>
			<tr>
				<td>객실번호</td><td> <input type="text" name="no" value="%{num }"></td>
			</tr>
			<tr>
				<td>객실정원</td><td> <input type="text" name="room_capacity" value="%{room_capacity }"></td>
			</tr>
			<tr>
				<td>입실날짜</td><td> <input type="text" name="firstDate" value="%{firstDate }"></td>
			</tr>
			<tr>
				<td>퇴실날짜</td><td> <input type="text" name="lastDate" value="%{lastDate }"></td>
			</tr>
			
	</table>


<input type="button" value="객실예약완료" onclick="location.href='/remedium/roomReservation.action'" />
</form>
</body>
</html>