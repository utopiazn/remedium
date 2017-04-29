<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<table   border="0" cellspacing="0" cellpadding="0" >
		<tr height="50%" >
		
			<td align="center">
			<p><h3>
				${resultClass.name}
			</h3></p>
			
			</td >
		
		</tr>
	</table>
	
	/remedium/image/roomClassImage/${image_01}
	
	
	<a href='/remedium/facilitiesView.action?no=2'><img width="640" height="400" alt="시설사진" src="/remedium/image/roomClassImage/${image_01}" ></a>
	

	<img height="100" alt="호텔로고" src="/remedium/image/roomClassImage/${image_01}" >
	<img height="100" alt="호텔로고" src="/remedium/image/roomClassImage/${image_02}" >
	<img height="100" alt="호텔로고" src="/remedium/image/roomClassImage/${image_03}" >
	<img height="100" alt="호텔로고" src="/remedium/image/roomClassImage/${image_04}" >
	<img height="100" alt="호텔로고" src="/remedium/image/roomClassImage/${image_05}" >

</body>
</html>