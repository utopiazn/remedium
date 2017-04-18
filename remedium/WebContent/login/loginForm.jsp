<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<SCRIPT type="text/javascript">
		
		function validation() {
			
			var frm = document.forms(0);
			
			if(frm.memberId.value == "") {
				alert("아이디 입력해주세요.");
				return false;
			} 
			
			else if(frm.memberPasswd.value == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			
			return true;
		}
</SCRIPT>  
</head>

<body>
<form action="loginAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
		<table width="600" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center">
				<h2>로 그 인</h2>
			</td>
		</tr>		
	</table>
	<table>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">* </font>아이디</td>
			<td bgcolor="#FFFFFF">
				<s:textfield name="memberId" theme="simple" cssStyle="width:100px" maxlength="20"/>
			</td>
			<td rowspan="3">
				 <input name="submit" type="submit" value="로그인" class="inputb" >
			</td>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">* </font>비밀번호</td>
			<td bgcolor="#FFFFFF">
				<s:password name="memberPasswd"  theme="simple" cssStyle="width:100px" maxlength="20"/>
			</td>
			
		</tr>
	</table>	
		 <a href="joinForm.action"><font size=2>회원 가입</font></a>&nbsp;/
       	 <a href="findIDForm.action"><font size=2>아이디 찾기</font></a>&nbsp;/
       	 <a href="findPwForm.action"><font size=2>비밀번호 찾기</font></a>
</form>
</body>
</html>