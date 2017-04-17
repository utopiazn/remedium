<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<?xml version="1.0" encoding="UTF-8" ?>
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table width="600" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center">
				<h2>회원 가입</h2>
			</td>
		</tr>	
		
		<tr>
			<td align="right">
				<font color="#FF0000">*</font>는 필수 입력 사항입니다.
			</td>
		</tr>
	
	</table>

	<form action="joinForm.action" method="post">
	
		<table width="600" border="0" cellspacing="0" cellpadding="0">
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000"></font>아이디
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="memberID" theme="simple" value="%{resultClass.memberID}" cssStyle="width:270px" maxlength="50"/>
					<input type="button" value="중복 체크">
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000"></font>비밀번호
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="memberPassword" theme="simple" value="%{resultClass.memberPassword}" cssStyle="width:270px" maxlength="50"/>					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000"></font>비밀번호 확인
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="memberPassword2" theme="simple" value="%{resultClass.memberPassword2}" cssStyle="width:270px" maxlength="50"/>					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000"></font>이름
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="memberName" theme="simple" value="%{resultClass.memberName}" cssStyle="width:270px" maxlength="50"/>					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000"></font>성별
				</td>
				
			
			
				<td width="50" bgcolor="#FFFFFF">
									
					
				
				</td>
			</tr>
			
		
		</table>	
		
		<br/>
		<input type="submit" value="가입">	
	</form>
	
	
	<br/><br/><br/>
	
	
<!-- 
	
	private String gender; // 회원 성별
	private String birthday; // 회원 생년월일
	private String phone; // 회원 핸드폰번호
	private String email; // 회원 이메일
	private Date regdate; // 회원 가입일
	private Date deldate; // 회원 탈퇴일
	private String userAdmin; // 관리자 여부
	private String zipcode; // 회원 우편번호
	private String addr1; // 회원 주소
	private String addr2; // 회원 상세주소
	private int cash; // 회원 캐쉬 
	private int userCheck; // 회원 사용여부 --> 
</body>
</html>