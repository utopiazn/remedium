<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>


<html lang="ko">

<head>
	<meta charset="UTF-8">
	<!-- <title>Remedium Hotel[당신만을 위한 오리엔탈 프리미엄 에디션]</title> -->
	<title><tiles:getAsString name="title" /></title>
	<link href="css/main.css" rel="stylesheet" style="text/css">
</head>

<body>

	<div class="header2">
		<tiles:insertAttribute name="header" />
	</div>

	<div class="main">
	
		<div class="lefter4">
			<tiles:insertAttribute name="lefter" />	
		</div>
		
		<div class="right4">
			<tiles:insertAttribute name="body" />
		</div>
	
	</div>

	<div class="footer2">
		<tiles:insertAttribute name="footer" />
	</div>
	
	
	
	
	

	<%--  <table width="100%" height="100%" cellpadding="0" cellspacing="0">
		
		<tr>		
			<!-- 헤더 정보--> 			
			<td colspan="2" width="100%" height="30%" align="center">
				<tiles:insertAttribute name="header" />
			</td>
		</tr>
		 
		<tr>
			
			<!-- 오른쪽 메뉴 -->
			<td valign="top"  width="20%" height="800" align="left">  
				 <tiles:insertAttribute name="lefter" /> 
			</td>
			
			<!-- 오른쪽 메뉴에 따른 정보 -->
			<td valign="top" width="80%" height="800" align="center"> 				
			 	<tiles:insertAttribute name="body" />
			</td>
		</tr>
		
		<tr>
			<!-- footer -->
			<td  bgcolor="#C0C0C0" colspan="2" width="100%" height="20%" align="center">
				<tiles:insertAttribute name="footer" /> 
			</td>
		</tr>
	</table>  --%>

 


</body>
</html>