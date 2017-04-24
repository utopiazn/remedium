<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%-- <a href='roomInfoList.action?roomClass=<s:property value="0"/>'></a> --%>
	<table width="800" border="0" cellspacing="0" cellpadding="2">
  		
  		<tr>
  			<td align="center"><h2>객실클래스 리스트</h2></td>
  		</tr>
  		
  		<tr>
  			<td height="20"></td>
  		</tr>
  		
  	</table>
  	
  	
  	<table width="800" border="0" cellspacing="0" cellpadding="2">
  	
  		<tr align="right">
			<td colspan="7" >
				<input type="button" value="추가" class="inputb" onClick="">
			</td>
		</tr>
		
		<tr align="right">
			<td colspan="7" ></td>
		</tr>
		
	     <tr align="center" bgcolor="#C0C0C0">
      		
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
		 		
		 		<td align="left"><s:property value="content"/></td>		
		 		
		 		<td align="center">
		 		
		 			<a href='roomInfoUpdateForm.action?roomClass=<s:property value="0"/>&roomClassNum=<s:property value="room_class"/>'>수정</a>&nbsp;/ 
		 			<a href='roomInfoList.action?roomClass=<s:property value="0"/>'>삭제</a>
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

</body>
</html>