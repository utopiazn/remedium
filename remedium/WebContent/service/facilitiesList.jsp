<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<link href="css/main.css" rel="stylesheet" style="text/css">
<style type="text/css">
.subject{
margin-top: 40px; 
line-height: 2em;
color: black;
}
.content{
padding-top:5px; padding-bottom:5px;
		display: block;
	 	font-weight: bold;
	 	text-decoration: none;
	 	margin: 5px;
	 	padding: 10px;
	 	font-family: '돋음', sans-serif;
	 	font-size: 14px;
	 	color: #ffffff;
	 	text-shadow: 0 1px 1px #000;	 	
	 	
	 	background: #202f58;	 	 
	 	background: linear-gradient(#1a1a1a 0%,#202f58 100%); 
}

.line1{
width:25%; float:left; background-size: cover;
}
.line2{
width:70%; float:left; margin:5px;
}
.line3{
width:95%; float:left; clear: left; text-align: right; margin: 5px; 
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
 
.content b a{
color: white;
}

</style>


</head>
<body>
	<div class="subject">
	<h2 align="center" >편의시설</h2>
	<hr align="center" width="40%" size="1" color="gray">
	</div>
	<div class="line3">
	<s:if test="${session.userAdmin == 1 }">	
	<input class="button" type="button" value="시설추가"onClick="location.href='facilitiesInsertForm.action'">
	
	</s:if>
	</div>
	<s:iterator value="list" >
		<div class="line1">
		<div class="content"><strong>시설이름</strong></div>
		<div class="content">
			<b><a href='/remedium/facilitiesView.action?no=<s:property value="no" />'><s:property value="name" /></a></b>
		</div>
		<div class="content"><strong>운영시간</strong></div>
		<div class="content"><s:property value="time" /></div>
		</div>
		
		<div class="line2">
		<div><a href='/remedium/facilitiesView.action?no=<s:property value="no" />'><img width="100%" height="600" alt="시설사진" src="/remedium/image/facImage/<s:property value='image'/>" ></a></div>
		</div>
		<div class="line3">&nbsp;</div>
	</s:iterator>
	

	
	
	
	
	
	<%-- <table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
		<tr>
			<td align="center"><h2>편의 시설</h2></td>
		</tr>
		
	
	<tr><td>
	<table width="800" border="1" cellspacing="0" cellpadding="0" align="center">
	
	<s:iterator value="list" >
	
		<tr height="50">
		<td><strong>시설이름</strong></td>
		<td rowspan=4><a href='/remedium/facilitiesView.action?no=<s:property value="no" />'><img width="640" height="400" alt="시설사진" src="/remedium/image/facImage/<s:property value='image'/>" ></a></td>
		</tr>
		<tr bgcolor="00afff">
			<td width="20%" align="center"><b><a href='/remedium/facilitiesView.action?no=<s:property value="no" />'><s:property value="name" /></a></b></td>
		</tr>
		<tr height="50"><td><strong>개장시간</strong></td></tr>
		<tr bgcolor="00afff">
			<td width="20%" align="center"><s:property value="time" /></td>
		</tr>
		
	</s:iterator>
	
		<tr align="center">
			<td colspan="2"><s:property value="pagingHtml"  escape="false" /></td>
		</tr>
	</table>
	</td></tr>
	<tr><td align="right">
	<s:if test="${session.userAdmin == 1 }">
	
	<input type="button" value="시설추가"onClick="location.href='facilitiesInsertForm.action'">
	</s:if>
	</td></tr>
	</table> --%>
</body>
</html>


