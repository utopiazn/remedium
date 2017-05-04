<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@ page import = "java.util.HashMap" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 리스트</title>
<link href="css/board.css" rel="stylesheet" style="text/css">
<style type="text/css">
a{
color: black;
}
.event{
margin : 5% auto; 
line-height: 2em; 
color: black;

} 

.button{
    border: 3px solid #202f58;
    background-color : #202f58;
    display: inline-block;
    cursor: pointer;
    font-size: 13px;
    text-decoration: none;
    color: white;
 
}  
.top{
	background-color:#202f58;
	color: white;
}


</style>
</head>
<body>
<div class="event">
	<table align="center" width="900" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center"><h2>회원 리스트</h2>
			<hr align="center" width="50%" size="1" color="gray">
			</td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr> 
	</table>
	 
	<table align="center" width="900" border="0" cellspacing="0" cellpadding="0">
		<tr align="center" bgcolor="#202f58" class="top">
			<td width="80"><strong>가입일</strong></td>
			<td width="50"><strong>아이디</strong></td>
			<td width="50"><strong>이 름</strong></td>
			<td width="60"><strong>생년 월일</strong></td>
			<td width="50"><strong>핸드폰</strong></td>
			<td width="50"><strong>캐 쉬</strong></td>
			<td width="50"><strong>권한여부</strong></td>
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
			<s:if test="%{userAdmin == 1}">
			<tr bgcolor="#DCDCDC" align="center">
			</s:if>
			<s:else>
			<tr bgcolor="#FFFFFF" align="center">
			</s:else>
				<td><s:property value="regdate"/></td>
				<td align="center"> 
				<s:a href="%{viewURL}"><s:property value="memberID"/></s:a></td>
				<td align="center">
				<s:a href="%{viewURL}"><s:property value="memberName"/></s:a></td>
				<td align="center"><s:property value="birthday"/></td>
				<td align="center"><s:property value="phone"/></td>
				<td align="center"><s:property value="cash"/></td>
				<s:if test="%{userAdmin == 1}">
				<td align="center">관계자</td>
				</s:if>
				<s:else>
				<td align="center">고객</td>
				</s:else>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="7"></td>
			</tr>
		</s:iterator>	
		<s:if test="list.size() <= 0">
			<tr bgcolor="#FFFFFF" align="center">
				<td colspan="7">등록된 게시글이 없습니다.</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="7"></td>
			</tr> 
		</s:if>
		
		<tr >
			<td colspan="7" align="center"><s:property value="pagingHtml" escape="false"/></td>
		</tr>
		<tr>
	</table>
	
	<center>
	<form action="memberAdminList.action">
		<select name="searchNum">
			<option value="0">아이디</option>
			<option value="1">이름</option>
			<option value="2">핸드폰</option>
		</select>
		<s:textfield name="searchKey" theme="simple" value="" cssStyle="wdith:120px" maxlength="20"/>
		<input class="button" name="submit" type="submit" value="검색" class="inputb">
		</form>
	</center>
	</div>
</body>
</html>