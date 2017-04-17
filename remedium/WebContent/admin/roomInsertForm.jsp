<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="roomInsert.action" method="post">
		<table>
			<tr>
			<td>객실번호 <input type="text" name="no"><br>
				객실이름 <input type="text" name="name"><br>
				객실크기 <input type="text" name="room_size"><br>
				객실정원 <input type="text" name="room_capacity"><br>
				객실구성 <input type="text" name="construction"><br>
				객실소개 <textarea name="room_comment"></textarea><br>
				객실사진은 아직 안돼<br>
				객실요금 <input type="text" name="price"><br>
				객실종류 <select name="room_class">
						<option value="0">개구린방</option>
						<option value="1">좋은방</option>
					  </select><br>
				<input type="submit" name="추가">
			</td>
			</tr>
		</table>
	</form>
</body>
</html>