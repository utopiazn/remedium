<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 찾기</title>
<style type="text/css">
.id
{
text-align: center; 
margin: 1% auto; 
width: 41%;
}
</style>
<link href="css/board.css" rel="stylesheet" style="text/css">
</head>
<SCRIPT type="text/javascript">
	function validation() {

		var frm = document.forms(0);

		if (frm.memberName.value == "") {
			alert("이름을 입력해 주세요.");
			return false;
		}

		else if (frm.birthday.value == "") {
			alert("생년 월일을 입력해 주세요.");
			return false;
		}

		return true;
	}
</SCRIPT>

<body>

<div class="id">
<br/><br/><br/>
	<table width="600" border="0" cellspacing="0" cellpadding="2">

		<tr>
			<td align="center">
				<h2>아이디 찾기</h2>
			</td>
		</tr>
	</table>
	<form action="findIDAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
		<center>
		<table width="300">
		
			<tr>
				<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 이 름</td>
				<td bgcolor="#FFFFFF"><s:textfield name="memberName" theme="simple" cssStyle="width:170px" maxlength="20"/></td>
			</tr>
			
			<tr>
				<td bgcolor="#F4F4F4"><font color="#FF0000">*</font> 생년 월일</td>
				<td bgcolor="#FFFFFF"><s:textfield name="birthday" theme="simple" cssStyle="width:170px" maxlength="20" /></td>
			</tr>
		</table> 
		</center>
		<br/>
		<input class="button" name="submit" type="submit" value="찾기" class="inputb" style="width: 130px;">&nbsp;
		<button class="button" type="button" onclick="location.href='main.action' " style="width: 130px;">취소</button>
	</form>
	</div>
</body>
</html>