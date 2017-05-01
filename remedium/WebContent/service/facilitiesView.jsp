<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<link href="css/main.css" rel="stylesheet" style="text/css">
<style type="text/css">
.s{
width:100%; background-size: cover; padding-top:5px; padding-bottom:5px; border:1px solid black;  margin:5px;
}
.c{
padding-top:5px; padding-bottom:5px; border:1px solid black; margin:5px;
}

.h1{
width:25%; float:left; background-size: cover; background-color: #E2FFAF;
}
.h2{
width:95%; float:left; margin:5px; border:1px solid black;
}
.h3{
width:95%; float:left; clear: left;
}
</style>
</head>
<div class="s">
<center>
<h2><b><s:property value="resultClass.name" /></b></h2>
</center>
</div>
	<div class="h2">
	<img width="700" height="600" alt="시설사진" src="/remedium/image/facImage/<s:property value='resultClass.image'/>" >
	</div>
	
	<div class="h2">
<s:property value="resultClass.content" /><br/>
개장시간 : <s:property value="resultClass.time" /><br/>
	</div>
<div class="h3">
	<input type="button" value="시설정보수정"onClick="location.href='facilitiesModifyForm.action?no=<s:property value="resultClass.no" />'">  
<input type="button" value="시설삭제"onClick="location.href='facilitiesDelete.action?no=<s:property value="resultClass.no" />&image=<s:property value="resultClass.image" />'">
<input type="button" value="시설목록"onClick="location.href='facilitiesList.action'">
 
	</div>











<%-- <body>
<img height="400" alt="시설사진" src="/remedium/image/facImage/<s:property value='resultClass.image'/>" >
<s:property value="resultClass.no" /><br/>  
<s:property value="resultClass.name" /><br/>  
<s:property value="resultClass.content" /><br/>
<s:property value="resultClass.time" /><br/>

<input type="button" value="시설정보수정"onClick="location.href='facilitiesModifyForm.action?no=<s:property value="resultClass.no" />'">  
<input type="button" value="시설삭제"onClick="location.href='facilitiesDelete.action?no=<s:property value="resultClass.no" />&image=<s:property value="resultClass.image" />'">
<input type="button" value="시설목록"onClick="location.href='facilitiesList.action'">
 
</body> --%>
</html>