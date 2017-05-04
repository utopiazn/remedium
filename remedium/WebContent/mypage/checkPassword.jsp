<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="css/form.css" rel="stylesheet" style="text/css">
<link href="css/board.css" rel="stylesheet" style="text/css">
<script type="text/javascript">
function pwd(userinput) {
	
	var p = userinput.password.value;
	var o = userinput.orgpasswd.value
	
	
	if(p != o ){
	alert("비밀번호가 일치하지 않습니다");

	return false;
 }
	else{
	alert("탈퇴가 완료되었습니다.");		
	return true;
	}
}

</script>
</head>
<body>
<div class="pwch">

<h2>비밀번호 확인</h2>

<form action="loginDelete.action" method="post" onsubmit="return pwd(this);" enctype="multipart/form-data">
<s:hidden name="no" value="%{no}"/>
<s:hidden name="currentPage" value="%{currentPage}"/>
<s:hidden name="orgpasswd" value="%{resultClass.memberPassword}"/>
<s:hidden name="memberID" value="%{resultClass.memberID}"></s:hidden>
<table width="250" border="0" cellspacing="0" cellpadding="0">

<tr>
<td height="1" colspan="2"></td>
</tr>

<tr>
<td width="150" bgcolor="#F4F4F4" >비밀번호 입력</td>


<td width="150" bgcolor="#FFFFFF" align="center"><s:textfield name="password" theme="simple" cssStyle="width:100px" maxlength="20"/>
</td>
</tr>


<tr>
<td height="1" colspan="2"><br><input class="button" name="submit" type="submit" value="확인" class="inputb"/></td>
</tr>
</table>
</form>
</div>
</body>
</html>