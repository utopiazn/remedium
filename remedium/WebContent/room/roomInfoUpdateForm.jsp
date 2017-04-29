<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>

	<br/>
	<table width="450" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center">
				<h2>객실 소개 클래스 수정</h2>
			</td>
		</tr>	
	</table>	
		
	<br/><br/>

	<table width="450" border="0" cellspacing="0" cellpadding="2">
	
		
		
		 <s:form action="roomInfoUpdate" method="POST" enctype="multipart/form-data">
		 	<s:hidden name="room_class_Old" value="${resultClass.room_class}"/>
			<s:hidden name="image_01" value="${image_01}"/>
			<s:hidden name="image_02" value="${image_02}"/>
			<s:hidden name="image_03" value="${image_03}"/>
			<s:hidden name="image_04" value="${image_04}"/>	
			<s:hidden name="image_05" value="${image_05}"/>
			<s:hidden name="image_06" value="${resultClass.image2}"/>
	
		<tr>			
			<td bgcolor="#F4F4F4" >
			
				<table width="480" border="0" cellspacing="0" cellpadding="0">
					
				
					<tr>
						<td width="100" >
							<font color="#FF0000"></font>객실 종류:
						</td>
						
						<td width="50" >
							 <input type="text" name="room_class" value='<s:property value="resultClass.room_class"/>'  size="20" >			
						</td>
					</tr>
					
					<tr>
						<td>
							<font color="#FF0000"></font>객실 종류 이름:
						</td>
						
						<td width="50" bgcolor="#F4F4F4">
							 <input type="text" name="name"  value='<s:property value="resultClass.name"/>'  size="20" >			
						</td>
					</tr>
			
					<tr>
						<td width="100" bgcolor="#F4F4F4">
							<font color="#FF0000"></font>내용:
						</td>
						
						<td width="50" bgcolor="#F4F4F4">
						   <s:textarea name="content" theme="simple" value="%{resultClass.content}" cols="50" rows="10" />
    			
						</td>
					</tr>				
				
				</table>
				
				<table width="480" border="0" cellspacing="0" cellpadding="0">
				
				 	<s:if test='%{!image_01.equals("")}'>
						<tr>
							<td  colspan="2" align="center">								
								 	사진이 등록되어있습니다. ${image_01}						
							</td>						
						</tr>
					</s:if>	
					
					<tr>		
																
						<td width="120" bgcolor="#F4F4F4">													
							 <s:file label="이미지1" name="uploads"/>
						</td>						
					</tr>
					
					<s:if test='%{!image_02.equals("")}'>
						<tr>
							<td  colspan="2" align="center">								
								 	사진이 등록되어있습니다.. ${image_02}						
							</td>						
						</tr>
					</s:if>					
					
					<tr>	
						<td bgcolor="#F4F4F4">
							 <s:file label="이미지2" name="uploads" />							
 						</td>						
					</tr>
					
					<s:if test='%{!image_03.equals("")}'>
						<tr>
							<td  colspan="2" align="center">						
								 	사진이 등록되어있습니다.. ${image_03}						
							</td>						
						</tr>
					</s:if>				
				
					<tr>											
						<td bgcolor="#F4F4F4">
							<s:file label="이미지3" name="uploads" />
						</td>						
					</tr>
				
				
					<s:if test='%{!image_04.equals("")}'>
						<tr>
							<td  colspan="2" align="center">						
								 	사진이 등록되어있습니다.. ${image_04}						
							</td>						
						</tr>
					</s:if>	
					
					<tr>					
						<td bgcolor="#F4F4F4">
							 <s:file label="이미지4" name="uploads" />							
						</td>						
					</tr>				
					
					<s:if test='%{!image_05.equals("")}'>
						<tr>
							<td  colspan="2" align="center">			
								 	사진이 등록되어있습니다.. ${image_05}						
							</td>						
						</tr>
					</s:if>	
									
					<tr>							
						<td bgcolor="#F4F4F4">
							<s:file label="이미지5" name="uploads" />								
						</td>						
					</tr>
					
					
					<s:if test='%{!resultClass.image2.equals("")}'>
						<tr>
							<td  colspan="2" align="center">			
								 	사진이 등록되어있습니다.. ${resultClass.image2}						
							</td>						
						</tr>
					</s:if>				
		
				
					<tr>					
						<td bgcolor="#F4F4F4">
							<s:file label="시설정보" name="image2" />
							
						</td>
					</tr>				
						
				</table>
			<s:submit value="수정"/>
		
		</s:form>
			</td>		
	
		</tr>
		
	</table>	

	
</body>
</html>