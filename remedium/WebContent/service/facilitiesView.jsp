<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<link href="css/main.css" rel="stylesheet" style="text/css">
<style type="text/css">
.s{
width:95%; background-size: cover; padding-top:10px; padding-bottom:5px; margin:5px; text-align:center;
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
width:95%; float:left; clear: left; margin:5px; text-align:center;
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

</style>
</head>
<body>

<div class="s">
<h1><b><s:property value="resultClass.name" /></b></h1>
</div>

<div class="h3">
<img width="600" height="500" alt="시설사진" src="/remedium/image/facImage/<s:property value='resultClass.image'/>" >
</div>
	
<div class="h3">
<s:property value="resultClass.content" /><br/>
운영시간 : <s:property value="resultClass.time" /><br/>
</div>
	
<div class="h3">
<input class="button" type="button" value="시설정보수정"onClick="location.href='facilitiesModifyForm.action?no=<s:property value="resultClass.no" />'">  
<input class="button" type="button" value="시설삭제"onClick="location.href='facilitiesDelete.action?no=<s:property value="resultClass.no" />&image=<s:property value="resultClass.image" />'">
<input class="button" type="button" value="시설목록"onClick="location.href='facilitiesList.action'">
</div>








<%--	
<img height="400" alt="시설사진" src="/remedium/image/facImage/<s:property value='resultClass.image'/>" >
<s:property value="resultClass.no" /><br/>  
<s:property value="resultClass.name" /><br/>  
<s:property value="resultClass.content" /><br/>
<s:property value="resultClass.time" /><br/>

<input type="button" value="시설정보수정"onClick="location.href='facilitiesModifyForm.action?no=<s:property value="resultClass.no" />'">  
<input type="button" value="시설삭제"onClick="location.href='facilitiesDelete.action?no=<s:property value="resultClass.no" />&image=<s:property value="resultClass.image" />'">
<input type="button" value="시설목록"onClick="location.href='facilitiesList.action'">
--%>
</body>
</html>