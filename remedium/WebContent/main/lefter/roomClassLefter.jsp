<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
		 
	 <s:if test="list.size() <= 0">
				
		객실 클래스 정보가 없습니다
					
	</s:if>	 
	 <s:else>
	 <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
		<tr height="50%"><td >
		 	
		 	
		 	<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
				<s:iterator value="list">
					<tr  height="10%">
				 		
				 		
				 		
				 		<td align="center">
				 			  <a href='roomInfoView.action?roomClass=<s:property value="room_class"/>'><font size=2><b><s:property value="name"/></b></font></a>
				 			
				 		<td>	
				 
					
					</tr>	
				</s:iterator>
			</table>
				
	</td></tr>
		<tr height="50%">
			<td ></td>
		</tr>
	</table>			
	</s:else>

</body>
</html>