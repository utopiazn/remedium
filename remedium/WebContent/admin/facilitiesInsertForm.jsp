<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 편의시설 글쓰기 폼</title>
</head>
<body>

<s:if test="%{resultClass.no != null}">
<form action="facilitiesModifyAction.action" method="post" enctype="multipart/form-data">
</s:if>
<s:else>
<form action="facilitiesInsert.action" method="post" enctype="multipart/form-data">
</s:else>
	<table>
	<tr>
	<td>번호</td>
	<td><s:textfield name="no" theme="simple" value="%{resultClass.no}"/></td>
	</tr>
	<tr>
	<td>시설이름</td>
	<td><s:textfield name="name" theme="simple" value="%{resultClass.name}"/></td>
	</tr>
	<tr>
	<td>정보</td>
	<td><s:textfield name="content" theme="simple" value="%{resultClass.content}"/></td>
	</tr>
	<tr>
	<td>개장시간</td>
	<td><s:textfield name="time" theme="simple" value="%{resultClass.time}"/></td>
	</tr>
	<!-- <tr>
	<td>이미지</td>
	<td><s:textfield name="image" theme="simple" value="%{resultClass.image}"/></td>
	</tr> -->
	</table>
	<s:if test="%{resultClass.no != null}">
	<input type="submit" value="시설수정">
	</s:if>
	<s:else>
	<input type="submit" value="시설추가">
	</s:else>
</form>
</body>
</html>