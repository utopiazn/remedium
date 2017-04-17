<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>


<html lang="ko">
<head>
	<meta charset="UTF-8">
	<!-- <title>Remedium Hotel[당신만을 위한 오리엔탈 프리미엄 에디션]</title> -->
	<title><tiles:getAsString name="title" /></title>
</head>
<body>

	<table border=1 width="100%" height="100%" cellpadding="0" cellspacing="0">
		
		<tr>
		
			<!-- 헤더 정보--> 			
			<td colspan="2" width="100%" height="30%" align="center">
				<tiles:insertAttribute name="header" />
			</td>
		</tr>
		
		<tr>
			
			<!-- 오른쫀 메뉴 -->
			<td valign="top"  width="25%" height="50%" align="center">  
				 <tiles:insertAttribute name="lefter" /> 
			</td>
			
			<!-- 오른쪽 메뉴에 따른 정보 -->
			<td valign="top" width="75%" height="50%" align="center"> 
				내용
			 <tiles:insertAttribute name="body" />
			</td>
		</tr>
		
		<tr>
			<!-- footer -->
			<td colspan="2" width="100%" height="20%" align="center">
				<tiles:insertAttribute name="footer" /> 
			</td>
		</tr>
	</table>



</body>
</html>