<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type="text/css">
.s{
width:95%; background-size: cover; padding-top:10px; padding-bottom:5px; magin:5px;
}

.c1{
width:95%;padding-top:10px; padding-bottom:5px; text-align:left;
}
.c2{
width:95%;padding-top:10px; padding-bottom:5px;
}
</style>
</head>
<body>
	<div class="s">
	<h3>편의시설 추가</h3>
	</div>
	
<s:if test="%{resultClass.no != null}">
<form action="facilitiesModifyAction.action" method="post" enctype="multipart/form-data">
</s:if>
<s:else>
<form action="facilitiesInsert.action" method="post" enctype="multipart/form-data">
</s:else>
	<div class="c1">
		<center>
		<table border=0>
		<tr>
		<td>번호 :</td>
		<td><s:textfield name="no" theme="simple" value="%{resultClass.no}"/></td>
		</tr>
		<tr>
		<td>시설이름 :</td>
		<td><s:textfield name="name" theme="simple" value="%{resultClass.name}"/></td>
		</tr>
		<tr>
		<td>정보 :</td>
		<td>
		<s:textarea name="content" cols="50" rows="5" theme="simple" value="%{resultClass.content}"></s:textarea>
		<%-- <s:textfield name="content" theme="simple" value="%{resultClass.content}"/>--%>
		</td> 
		</tr>
		<tr>
		<td>운영시간 :</td>
		<td><s:textfield name="time" theme="simple" value="%{resultClass.time}"/></td>
		</tr>
		<tr>
		<td>이미지 :</td>
		<td><s:file name="upload" theme="simple"/>
		<s:if test="%{resultClass.image!=null}"><br/>
		<small>사진이 등록되어있습니다. ${resultClass.image}</small>
		<s:hidden name="image" value="%{resultClass.image}"/>
		</s:if>
		</td>
		</tr>
		<tr>
		<td colspan="2"><br>
		<s:if test="%{resultClass.no != null}">
		<input type="submit" value="시설수정">
		</s:if>
		<s:else>
		<input type="submit" value="시설추가">
		</s:else>
		</td>
		</tr>
		</table>
	</div>
	
</form>

</body>
</html>