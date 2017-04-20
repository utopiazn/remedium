<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<?xml version="1.0" encoding="UTF-8" ?>
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
</head>
<body>

	
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center">
				<h2>회원 상세 보기</h2>
			</td>
		</tr>	
		
	
	</table>


	<!-- 로그인폼으로 이동 -->
		<table width="600" border="1" cellspacing="3" cellpadding="3">	
			<tr>
				<td width="50" bgcolor="#F4F4F4" >
					<font color="#FF0000">* </font>아이디
				</td>
			
				<td  bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.memberID}"/> 
				</td>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>가입일
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.regdate}"/>					 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>비밀 번호
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan=>
					<s:property value="%{resultClass.memberPassword}"/>					 
				</td>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>탈퇴일
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.deldate}"/>					 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>이 름
				</td>
			
				<td width="50" bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.memberName}"/>					
				</td>
					<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>보유 Cash
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.cash}"/>					 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>성 별
				</td>
				<td width="50" bgcolor="#FFFFFF">
					<s:property value="%{resultClass.gender}"/>					
				</td>
					<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>사용 여부
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.userCheck}"/>					 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>생년 월일
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan="3">
					<s:property value="%{resultClass.birthday}" />				
				</td>
			</tr>
			
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>전화 번호
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan="3">
					<s:property  value="%{resultClass.phone}" /> 			
				</td>
			</tr>
			
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>이메일
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan="3">
					<s:property value="%{resultClass.email}"/> 					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>우편 번호
				</td>
				<td width="50" bgcolor="#FFFFFF" colspan="3">
				<s:property value="%{resultClass.zipcode}" /> 	
				</td>
			</tr> 
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">* </font>주 소
				</td>
				<td width="200"bgcolor="#FFFFFF">
				<s:property value="%{resultClass.addr1}" /> 
				</td>
				<td colspan="2">
				<s:property value="%{resultClass.addr2}" /> 
				</td>
			</tr>
		
		</table>
		<input name="list" type="button" value="회원 목록" class="inputb" onClick="javascript:location.href='memberAdminList.action'">
    	<input name="modify" type="button" value="회원 수정" class="inputb" onClick="javascript:location.href='memberAdminModifyForm.action?memberID=<s:property value="resultClass.memberID" />&currentPage=<s:property value="currentPage" />'"> 
		<input name="delete" type="button" value="회원 삭제" class="inputb" onClick="javascript:location.href='ReplyForm.action?memberID=<s:property value="resultClass.memberID" />','delete')">

</body>
</html>