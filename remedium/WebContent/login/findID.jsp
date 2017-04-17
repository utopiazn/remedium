<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="findIDAction.action" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 이  름</td>
			<td bgcolor="#FFFFFF">
				<s:textfield name="memberName" theme="simple" cssStyle="width:100px" maxlength="20"/>
			</td>
		</tr>
		<tr bgcolor="#777777"> 
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 생년 월일</td>
			<td bgcolor="#FFFFFF">
				<s:textfield name="birthday" theme="simple" cssStyle="width:100px" maxlength="20"/>
			</td>
		</tr>
	</table>
	<input name="submit" type="submit" value="찾기" class="inputb" >	
	<button type="button" onclick="location.href='main2.action' ">취소</button> 
</form>
</body>
</html>