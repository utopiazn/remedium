<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<link href="css/main.css" rel="stylesheet" style="text/css">
<style type="text/css">

.line3{
width:80%; float:left; clear: left; margin:5px; text-align:center;
margin-left: 10%;
}
.line2{
width:80%; float:left; clear: left; margin:5px; text-align:right;
margin-left: 10%;
}
.content{ margin-top: 20px;  
line-height: 2em;
color: black;
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

<div class="content">
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="center"><h2>${resultClass.name}</h2>
		<hr align="center" width="60%" size="1" color="gray">
		<br/>
		</td>
	</tr>
</table>
</div>
	
<div class="line2">
<s:if test="${ session.userAdmin == '1' }">
<input class="button" type="button" value="시설정보수정"onClick="location.href='facilitiesModifyForm.action?no=<s:property value="resultClass.no" />'">  
<input class="button" type="button" value="시설삭제"onClick="location.href='facilitiesDelete.action?no=<s:property value="resultClass.no" />&image=<s:property value="resultClass.image" />'">
</s:if>
<input class="button" type="button" value="시설목록"onClick="location.href='facilitiesList.action'">
</div>

<div class="line3">
<img width="100%" height="500" alt="시설사진" src="/remedium/image/facImage/<s:property value='resultClass.image'/>" >
</div>
	
<div class="line3">
<s:property value="resultClass.content" /><br/>
운영시간 : <s:property value="resultClass.time" /><br/>
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