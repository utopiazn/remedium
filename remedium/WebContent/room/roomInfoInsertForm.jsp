<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
<!-- 
room_class	객실 종류
name	객실 종류 이름
image	사진경로(메인)
content	내용
image2	시설정보 
-->



<%-- 	${resultClass.room_class}<br>
	${resultClass.image}<br>
	${resultClass.content}<br>
	${resultClass.name}<br>
 --%>


	<table width="600" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center">
				<h2>객실 소개 클래스 추가</h2>
			</td>
		</tr>	

		<!--  -->
		<form  action="roomInfoInsert.action"  method="post" enctype="multipart/form-data" onsubmit="">
					
			
			<input type="hidden" name ="roomClass" value="0">		


			<table width="600" border="0" cellspacing="0" cellpadding="0">
				
				<tr>
					<td width="40" bgcolor="#F4F4F4">
						<font color="#FF0000">*</font>객실 종류:
					</td>
					
					<td width="50" bgcolor="#FFFFFF">
						 <input type="text" name="room_class" size="20" >			
					</td>
				</tr>
			
				<tr>
					<td width="40" bgcolor="#F4F4F4">
						<font color="#FF0000">*</font>객실 종류 이름:
					</td>
					
					<td width="50" bgcolor="#FFFFFF">
						 <input type="text" name="name" size="20" >			
					</td>
				</tr>
			
			
			
			
			
			
			</table>
		
			
		
		
		
			<input type="submit" value="저장">
			
		
		</form>
	</table>



	<form action="roomInfoInsertForm.action?">
	
		<input type="hidden" name ="roomClass" value="0">
		
	
	</form>




	
</body>
</html>