<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>

	${resultClass.room_class}<br>
	${resultClass.image}<br>
	${resultClass.content}<br>
	${resultClass.name}<br>
	${resultClass.image2}<br>


	<table width="450" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center">
				<h2>객실 소개 클래스 수정</h2>
			</td>
		</tr>	
		
		 <s:form action="roomInfoUpdate" method="POST" enctype="multipart/form-data">
	
	
		<tr>			
			<td bgcolor="#F4F4F4" >
			
				<table width="480" border="0" cellspacing="0" cellpadding="0">
				
				
					<tr>
						<td width="100" >
							<font color="#FF0000"></font>객실 종류:
						</td>
						
						<td width="50" >
							 <input type="text" name="room_class" size="20" >			
						</td>
					</tr>
					
					<tr>
						<td>
							<font color="#FF0000"></font>객실 종류 이름:
						</td>
						
						<td width="50" bgcolor="#F4F4F4">
							 <input type="text" name="name" size="20" >			
						</td>
					</tr>
			
					<tr>
						<td width="100" bgcolor="#F4F4F4">
							<font color="#FF0000"></font>내용:
						</td>
						
						<td width="50" bgcolor="#F4F4F4">
							 <textarea name="content" rows="5" cols="40"></textarea>			
						</td>
					</tr>				
				
				</table>
				
				<table width="480" border="0" cellspacing="0" cellpadding="0">
				
					<tr>										
						<td width="120" bgcolor="#F4F4F4">
							 <s:file label="이미지1" name="uploads" />
						</td>						
					</tr>
					
					<tr>	
						<td bgcolor="#F4F4F4">
							 <s:file label="이미지2" name="uploads" />
						</td>						
					</tr>
				
				
					<tr>					
						
						<td bgcolor="#F4F4F4">
							<s:file label="이미지3" name="uploads" />
						</td>
						
					</tr>
				
				
				
					<tr>					
						
						<td bgcolor="#F4F4F4">
							 <s:file label="이미지4" name="uploads" />
						</td>
						
					</tr>
				
				
					<tr>					
						
						<td bgcolor="#F4F4F4">
								<s:file label="이미지5" name="uploads" />
						</td>
						
					</tr>
				
		
				
					<tr>
					
						<td bgcolor="#F4F4F4">
							<s:file label="시설정보" name="image2" value='sdfdsdf'/>
						</td>
					</tr>
				
					
						
				</table>
			<s:submit value="저장"/>
		
		</s:form>
			</td>		
	
		</tr>
		
	</table>	

	
</body>
</html>