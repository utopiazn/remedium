<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QnA</title>
<style type="text/css">
a{
color: black;
}
.event{
margin : 20px; 
line-height: 2.5em;
color: black;
text-align: center;
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
.bottom{
  padding-left: 46%;
  padding-top: 3%;
}
.top{
	background-color:#202f58;
	color: white;
}

</style>
</head>
<body>
<div class="event">
<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center">
  		<tr>
  			<td align="center" ><h2>QnA</h2>
  			<hr align="center" width="60%" size="1" color="gray">
  			<br/>
  			</td>
  			
  		</tr>
  	</table>
  	
  
	<table width="1000" border="0" cellspacing="0" cellpadding="0" align="center">

	    <tr class="top" align="center" bgcolor="#A2D5FF">
      		<td width="50"><strong>번 호</strong></td>
			<td width="100"><strong>제 목</strong></td>
			<td width="50"><strong>작성자</strong></td>
        	<td width="50"><strong>날 짜</strong></td>
        	<td width="50"><strong>답변 상태</strong></td>
			
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
      	      </tr>
	      <s:iterator value="list" status="stat">
			<s:url id="viewURL" action="boardView">
				<s:param name="no"> 
					<s:property value="no"/>
				</s:param>
				<s:param name="ref"> 
					<s:property value="ref"/>
				</s:param>
				<s:param name="currentPage">
					<s:property value="currentPage"/>
				</s:param>
			</s:url>
			<tr bgcolor="#FFFFFF" align="center">
				<td><s:property value="no"/>
		
				</td>
				<td align="left"> 
				<s:if test="re_step != 0">
					<c:forEach var = "i" begin = "${re_step}" end = "0">&nbsp;</c:forEach>→
				</s:if>	
				<s:a href="%{viewURL}"><s:property value="subject"/></s:a></td>
				<td align="center">
				<s:a href="%{viewURL}"><s:property value="Name"/></s:a></td>
				<td align="center"><s:property value="regdate"/></td>
				<td align="center"><%-- <s:property value="type"/> --%>
					<s:if test='type.equals("0")'>
						미답변
					</s:if>
					<s:else>
						답변완료
					</s:else>	
					
				</td>
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
		
		<tr align="center">
			<td colspan="7" ><s:property value="pagingHtml" escape="false"/></td>
		</tr>
		<tr align="right">
			<td colspan="7" >
			<s:if test="${session.memberId != null}">
				<input class="button" type="button" value="글쓰기" onClick="javascript:location.href='boardWriteForm.action'">
			</s:if>
			</td>
		</tr>
		
	</table>
	</div>
	<table align="center">
	<form action="boardList.action" class="bottom">
		<select name="searchNum" >
			<option value="0">제 목</option>
			<option value="1">작성자</option>
		</select>
		<s:textfield name="searchKey" theme="simple" value="" cssStyle="wdith:120px" maxlength="20"/>
		<input class="button" name="submit" type="submit" value="검색" class="inputb">
	</form>
	</table>
	
</body>
</html>