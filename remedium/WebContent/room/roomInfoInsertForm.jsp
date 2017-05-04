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
			<td bgcolor="#F4F4F4" >
			

				<table width="480" border="0" cellspacing="0" cellpadding="0" align="center">
				
				<tr>
				
					  <td width="200" bgcolor="#202f58">
					  	<font color="white">* 객실 종류:
					  	</font>
					  </td>
					
					
					<td align="left" width="500" bgcolor="#FFFFFF">
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
						<s:file label="시설정보" name="image2" />
					</td>
				</tr>
			
		
			</table>
		
			<s:submit  value="저장"/>
			
		
		</s:form> 
		</td>
	<tr>	
	</table>


</div>



	
</body>
</html>