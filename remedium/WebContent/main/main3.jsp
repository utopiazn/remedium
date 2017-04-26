<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>


<html lang="ko">
<head>
	<meta charset="UTF-8">
	<!-- <title>Remedium Hotel[당신만을 위한 오리엔탈 프리미엄 에디션]</title> -->
	<title><tiles:getAsString name="title" /></title>
	<link href="css/main.css" rel="stylesheet" style="text/css">
<style type="text/css">
body{
background-attachment: fixed; background-size: cover; background-image: url("/remedium/image/hotelbg.jpg");
}
</style>

</head>
<body>

<!-- <img alt="메인이미지" src="/remedium/image/hotelbg.jpg" width="100%" height="100%">-->
<div class="header">
<tiles:insertAttribute name="header" />
</div>

<div class="right">
<tiles:insertAttribute name="body" />
</div>

<div class="footer">
<tiles:insertAttribute name="footer" />
</div>


</body>
<%-- </head>
<body>
				<table  width="100%" cellpadding="0" cellspacing="0" >
					
					<tr>
					<!-- 헤더 정보--> 			
					<td colspan="2" width="100%" align="center">
					<tiles:insertAttribute name="header" />
					</td>
					</tr>
					 
					<tr>
					<!--메뉴에 따른 정보 -->
					<td height="1200" width="100%" valign="top" align="center">					
					<tiles:insertAttribute name="body" />
					</td>					
					</tr>
					
					<tr>
					<!-- footer -->
					<td  bgcolor="#C0C0C0" colspan="2" width="100%" align="center">
					<tiles:insertAttribute name="footer" /> 
					</td>
					</tr>
				</table>
				 --%>

</html>