<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<?xml version="1.0" encoding="UTF-8" ?>
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" >

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
</head>
<body>



	<s:if test="resultClass == NULL">
		<form action="faqWrite.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>
	
	<s:else>
		<form action="faqModify.action" method="post" enctype="multipart/form-data">
			<s:hidden name="faqId" value="%{resultClass.faqId}" />
	</s:else> 
	
	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
	
		<tr>
			<td align="center">
				<h2>자주 묻는 질문 쓰기</h2>
			</td>
		</tr>	
		
	
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center" >
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">* </font> 는 필수 입력사항입니다.
			</td>
		</tr>
			<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">* </font>질문유형</td>
			<td bgcolor="#FFFFFF" >
				<s:textfield name="type" theme="simple" value="%{resultClass.type}" cssStyle="width:470px" maxlength="50"/>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td  bgcolor="#F4F4F4"><font color="#FF0000">* </font>제 목</td>
			<td  bgcolor="#FFFFFF">
				<s:textfield name="subject" theme="simple" value="%{resultClass.subject}" cssStyle="width:470px" maxlength="50"/>
			</td>
		</tr>
		
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">* </font>내 용</td>
			<td bgcolor="#FFFFFF">
				<s:textarea name="content" theme="simple" value="%{resultClass.content}" cols="56" rows="10"/>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
        	<td height="10" colspan="2"></td>
        </tr>
			
	</table>
	<center>
		<input type="submit" value="작성 완료">
    	<input name="modify" type="button" value="목록" class="inputb" onClick="javascript:location.href='faqList.action'"> 	
	</center>
</form>
</body>
</html>