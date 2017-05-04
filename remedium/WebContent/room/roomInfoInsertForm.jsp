<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>


<?xml version="1.0" encoding="UTF-8" ?>


<html lang="ko">
<head>
	<meta charset="UTF-8">

<style type="text/css">


a{
color: black;
}
.roomInfoInsertFormTitle{
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

<div class="roomInfoInsertFormTitle">
	
	<table width="900" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
  			<td align="center"><h2>객실 소개 클래스 추가</h2>
 			<hr align="center" width="60%" size="1" color="gray">
  			<br/>
  			</td>  			
  		</tr>		
  		
  	</table>
 	
  	
	
	<!--객실 소개 추가 처리  -->
 	<s:form action="roomInfoInsert" method="POST" enctype="multipart/form-data">

		<table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
				
			<tr>				
				<td width="100" bgcolor="#202f58">
					<font color="white">
						*객실 종류:
				  	</font>
				</td>
										
				<td width="50" bgcolor="#FFFFFF" align="left">					
					&nbsp;<s:textfield name="room_class" theme="simple"  cssStyle="width:270px" maxlength="50"/>				
				</td>
			</tr>
				
			<tr bgcolor="#777777">
          		<td height="1" colspan="2"></td>	
        	</tr>
			
			<tr>
				<td width="100" bgcolor="#202f58">
					<font color="white">
						*객실 종류 이름:
					</font>
				</td>
				<td width="50" bgcolor="#FFFFFF" align="left">					
					&nbsp;<s:textfield name="name" theme="simple"  cssStyle="width:270px" maxlength="50"/>				
				</td>
					
			</tr>
			
			<tr bgcolor="#777777">
         			<td height="1" colspan="2"></td>	
       		</tr>
		
			<tr>
				<td width="100" bgcolor="#202f58">
					<font color="white">내용:
					</font>
				</td>
				
				<td width="50" bgcolor="#FFFFFF" align="left"  >			
					 &nbsp;<s:textarea name="content" theme="simple" cssStyle="width:270px;"  rows="5" cols="40"/>			
				</td>
			</tr>			
		
			<tr bgcolor="#777777">
         			<td height="1" colspan="2"></td>	
       		</tr>
		

	
			<tr>		
				
				<td width="100" bgcolor="#202f58">
					<font color="white">이미지1:
					</font>
				</td>
							
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="uploads" theme="simple" />
				</td>
				
			</tr>
			
			<tr bgcolor="#777777">
         			<td height="1" colspan="2"></td>	
       		</tr>
		
		
		
			
			<tr>		
				
				<td width="100" bgcolor="#202f58">
					<font color="white">이미지2:
					</font>
				</td>
							
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="uploads" theme="simple" />
				</td>
				
			</tr>
			
			<tr bgcolor="#777777">
         			<td height="1" colspan="2"></td>	
       		</tr>
		
	
		
			<tr>		
				
				<td width="100" bgcolor="#202f58">
					<font color="white">이미지3:
					</font>
				</td>
							
			
				<td width="50" bgcolor="#FFFFFF" align="left"  >	
					  &nbsp;<s:file  name="uploads" theme="simple" />
				</td>
				
			</tr>
			
			<tr bgcolor="#777777">
         			<td height="1" colspan="2"></td>	
       		</tr>
	
	
			
				<tr>
				
					<td bgcolor="#F4F4F4">
						<s:file label="시설정보" name="image2" />
					</td>
				</tr>
			
		
			</table>
		
			<s:submit  value="저장"/>
			
		
		</s:form> 
		

</div>



	
</body>
</html>