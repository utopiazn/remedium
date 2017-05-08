<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<style type="text/css">


a{
color: black;
}
.roomInfoUpdateFormTitle{
margin : 20px; 
line-height: 2.5em;
color: black;
text-align: center;
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

.textarea_td{
	padding-top: 10px;
}

</style>

</head>
<body>




<div class="roomInfoUpdateFormTitle">
	
	<table width="900" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
  			<td align="center"><h2>객실 소개 클래스 수정</h2>
 			<hr align="center" width="60%" size="1" color="gray">
  			<br/>
  			</td>  			
  		</tr>		
  		
  	</table>
 	
  	
  	
  	 <s:form action="roomInfoUpdate" method="POST" enctype="multipart/form-data">
		 	
	 	<s:hidden name="room_class_Old" value="${resultClass.room_class}"/>
		<s:hidden name="image_01" value="${image_01}"/>
		<s:hidden name="image_02" value="${image_02}"/>
		<s:hidden name="image_03" value="${image_03}"/>
		<s:hidden name="image_04" value="${image_04}"/>	
		<s:hidden name="image_05" value="${image_05}"/>
		<s:hidden name="image_06" value="${resultClass.image2}"/>


		<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center">
		
		
			<tr bgcolor="#777777">
          		<td height="1" colspan="4"></td>	
        	</tr>		
			
			<tr>				
				<td width="150" bgcolor="#202f58">
					<font color="white">
						*객실 종류:
				  	</font>
				</td>
										
				<td width="50" bgcolor="#FFFFFF" align="left">					
					&nbsp;<s:textfield name="room_class" value="${resultClass.room_class}" theme="simple"  cssStyle="width:270px" maxlength="50"/>				
					
				</td>
				
				<td width="150" bgcolor="#202f58">
					<font color="white">
						*객실 종류 이름:
					</font>
				</td>
				<td width="50" bgcolor="#FFFFFF" align="left" >					
					&nbsp;<s:textfield name="name" theme="simple" value="${resultClass.name}"  cssStyle="width:270px" maxlength="200"/>				
				</td>				
				
			</tr>	
				
			<tr bgcolor="#777777">
          		<td height="1" colspan="4"></td>	
        	</tr>
				
			
			<tr>
				<td width="150" bgcolor="#202f58">
					<font color="white">내용:
					</font>
				</td>
				
				<td class="textarea_td" width="50" bgcolor="#FFFFFF" align="left" colspan="3" >			
					 &nbsp;<s:textarea name="content"  value="${resultClass.content}" theme="simple" cssStyle="width:600px;"  rows="10" />			
				</td>
			</tr>			
		
			<tr bgcolor="#777777">
         		<td height="1" colspan="4"></td>	
       		</tr>
       		
       			
       		<tr>		
				
				<td width="150" bgcolor="#202f58">
					<font color="white">이미지1:
					</font>
				</td>						
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="uploads" theme="simple" />
					  
					  <s:if test='%{!image_01.equals("")}'>
					  
					  	<br/>&nbsp;
					  	<font size="2">
					  	사진이 등록되어있습니다.${image_01}	
					  	</font>
					  </s:if>
					  
				</td>
				
				<td width="150" bgcolor="#202f58">
					<font color="white">이미지2:
					</font>
				</td>
							
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="uploads" theme="simple" />
					  
					  <s:if test='%{!image_02.equals("")}'>
					  
					  	<br/>&nbsp;
					  	<font size="2">
					  	사진이 등록되어있습니다.${image_02}	
					  	</font>
					  </s:if>
					  
				</td>
				
			</tr>
			
       			
			

			<tr bgcolor="#777777">
         		<td height="1" colspan="4"></td>	
       		</tr>
       		
       			
       		<tr>		
				
				<td width="150" bgcolor="#202f58">
					<font color="white">이미지3:
					</font>
				</td>
							
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="uploads" theme="simple" />
					  
					  <s:if test='%{!image_03.equals("")}'>
					  
					  	<br/>&nbsp;
					  	<font size="2">
					  	사진이 등록되어있습니다.${image_03}	
					  	</font>
					  </s:if>
					  
				</td>
				
				<td width="150" bgcolor="#202f58">
					<font color="white">이미지4:
					</font>
				</td>
							
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="uploads" theme="simple" />
					  
					  <s:if test='%{!image_04.equals("")}'>
					  
					  	<br/>&nbsp;
					  	<font size="2">
					  	사진이 등록되어있습니다.${image_04}	
					  	</font>
					  </s:if>
					  
				</td>
				
			</tr>
			
			<tr bgcolor="#777777">
         			<td height="1" colspan="4"></td>	
       		</tr>
       		
       			
       		<tr>		
				
				
				
			</tr>
			
			<tr bgcolor="#777777">
         			<td height="1" colspan="2"></td>	
       		</tr>
       		
       			
       		<tr>					
				<td width="150" bgcolor="#202f58">
					<font color="white">이미지5:
					</font>
				</td>
							
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="uploads" theme="simple" />
					  
					  <s:if test='%{!image_05.equals("")}'>
					  
					  	<br/>&nbsp;
					  	<font size="2">
					  	사진이 등록되어있습니다.${image_05}	
					  	</font>
					  </s:if>
					  
				</td>
				
				<td width="150" bgcolor="#202f58">
					<font color="white">시설정보:
					</font>
				</td>
							
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="image2" theme="simple" />
					  
					  <s:if test='%{!resultClass.image2.equals("")}'>
					  
					  	<br/>&nbsp;
					  	<font size="2">
					  		사진이 등록되어있습니다.${resultClass.image2}	
					  	</font>
					  </s:if>
					  
				</td>
				
			</tr>
			
			
			<tr bgcolor="#777777">
         			<td height="1" colspan="4"></td>	
       		</tr>
       		
       		
			
			<tr>
				<td align="center" colspan="4">
	          		<input class="button" type="submit" value="작성완료" >
	            	<input class="button" name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='roomInfoList.action?roomClass=0'">
	          	</td>
			</tr>
			
			
					
		
		</table>
		
		
		</s:form>
		
</div>
	
</body>
</html>