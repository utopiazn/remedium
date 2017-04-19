<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>스트럿츠2 게시판</title>
<link rel="stylesheet" href="/StrutsBoard/board/css.css" type="text/css">
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>스트럿츠2 게시판</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr> 
	</table>
	 
	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
		<tr align="center" bgcolor="#F3F3F3">
			<td width="50"><strong>아이디</strong></td>
			<td width="50"><strong>이 름</strong></td>
			<td width="80"><strong>생년 월일</strong></td>
			<td width="80"><strong>핸드폰</strong></td>
			<td width="80"><strong>가입일</strong></td>
			<td width="80"><strong>캐 쉬</strong></td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="7"></td>
		</tr>
		
		<s:iterator value="list" status="stat">
			<s:url id="viewURL" action="memberAdminView">
				<s:param name="memberID">
					<s:property value="memberID"/>
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage"/>
				</s:param>
			</s:url>
			<tr bgcolor="#FFFFFF" align="center">
				<td><s:property value="no"/></td>
				<td align="left"> 
				<s:a href="%{viewURL}"><s:property value="memberID"/></s:a></td>
				<td align="center"><s:property value="name"/></td>
				<td align="center"><s:property value="regdate"/></td>
				<td><s:property value="readhit"/></td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>
		</s:iterator>	
		<s:if test="list.size() <= 0">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="5"></td>
			</tr>
		</s:if>
		
		<tr align="center">
			<td colspan="5"><s:property value="pagingHtml" escape="false"/></td>
		</tr>
		<tr align="right">
			<td colspan="8">
			<input type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='WriteForm.action?currentPage=<s:property value="currentPage"/>';">
			</td>
		</tr>
		<tr>
	</table>
	<form>
		<select name="searchNum">
			<option value="0">아이디</option>
			<option value="1">이름</option>
			<option value="2">핸드폰</option>
		</select>
		<s:textfield name="searchKey" theme="simple" value="" cssStyle="wdith:120px" maxlength="20"/>
		<input name="submit" type="submit" value="검색" class="inputb">
	</form>
</body>
</html>