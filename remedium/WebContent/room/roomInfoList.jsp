<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">


a{
color: black;
}
.roomInfoListTitle{
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

<%-- <a href='roomInfoList.action?roomClass=<s:property value="0"/>'></a> --%>

<div class="roomInfoListTitle">

	<table width="900" border="0" cellspacing="0" cellpadding="0" align="center">
  		
  		<tr>
  			<td align="center"><h2>객실클래스 리스트</h2>
 			<hr align="center" width="60%" size="1" color="gray">
  			<br/>
  			</td>  			
  		</tr>		
  		
  	</table>
 	
  	
  	<table width="800" border="0" cellspacing="0" cellpadding="0" align="center">
  	
  		<tr align="right">
			<td colspan="7" >
				<button class="button" type="button" onclick="location.href='roomInfoInsertForm.action?roomClass=0'">추가</button>				
			</td>
		</tr>
		
		<tr align="right">
			<td colspan="7" ></td>
		</tr>
		
	     <tr class="top" align="center" bgcolor="#A2D5FF">
      		
      		<td width="100"><strong>객실 종류</strong></td>
			
			<td width="200"><strong>객실 종류 이름</strong></td>
        	
        	<td width="300"><strong>내용</strong></td>
		
			<td width="200"><strong>수정/삭제</strong></td> 	
		
		
		</tr>
      	
      	<tr bgcolor="#777777">        	
        	<td height="1" colspan="4"></td>
		</tr>
		
		
		<s:iterator value="list">
		
			<tr  height="10%">
				 		
				<td align="center"><s:property value="room_class"/></td>		
				 		
		 		<td align="left"><s:property value="name"/></td>		
		 		
		 		<td align="left" ><s:property value="content"/></td>		
		 		
		 		<td align="center">
		 		
		 			<a href='roomInfoUpdateForm.action?roomClass=0&roomClassNum=<s:property value="room_class"/>'>수정</a>&nbsp;/ 
		 			<a href='roomInfoDelete.action?roomClass=0&roomClassNum=<s:property value="room_class"/>'>삭제</a>
		 		</td>		
					
			</tr>	
			
			<tr bgcolor="#777777">
        		<td height="1" colspan="4"></td>
      	    </tr>	
			
		</s:iterator>
		
		<s:if test="list.size() <= 0">
			
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="7">등록된 게시글이 없습니다.</td>
			</tr>
			
			<tr bgcolor="#777777">
				<td height="1" colspan="4"></td>
			</tr>
			 
		</s:if>
		
		<tr align="center">
			<td colspan="4" ><s:property value="pagingHtml" escape="false"/></td>
		</tr>
		
		

		
	</table>  	
</div> 
</body>
</html>