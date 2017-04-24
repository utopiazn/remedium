<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<SCRIPT type="text/javascript">
		function validation() {
		
			var frm = document.forms(0);
			
			if(frm.subject.value == "") {
				alert("제목을 입력해주세요.");
				return false;
			} 
			
			else if(frm.name.value == "") {
				alert("이름을 입력해주세요.");
				return false;
			}
			
			else if(frm.password.value == "") {
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			
			else if(frm.content.value == "") {
				alert("내용을 입력해주세요.");
				return false;			
			} 
			
			return true;
		}
	</SCRIPT>
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>게시판 상세보기</h2></td>
		</tr>
	</table>
	
	<s:if test="resultClass == NULL">
		<form action="boardWrite.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
	</s:if>
	
	<s:else>
		<form action="boardModify.action" method="post" enctype="multipart/form-data">
			<s:hidden name="no" value="%{resultClass.no}" />
			<s:hidden name="no" value="%{resultClass.memberName}" />
			<s:hidden name="currentPage" value="%{currentPage}" />
	</s:else> 
	
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="right" colspan="2"><font color="#FF0000">* </font> 는 필수 입력사항입니다.
			</td>
		</tr>
			<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		<tr>
			<td bgcolor="#F4F4F4"><font color="#FF0000">* </font>작성자</td>
			<td bgcolor="#FFFFFF">
				<s:property value=" ${session.memberName}"/>
			</td>
		</tr>
		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>
		
		<tr>
			<td  bgcolor="#F4F4F4"><font color="#FF0000">* </font>제 목</td>
			<td  bgcolor="#FFFFFF">
				<s:textfield name="subject" theme="simple" value="%{resultClass.subject}" cssStyle="width:372px" maxlength="50"/>
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
			
		<tr>
     		<td align="right" colspan="2">
     		   <input name="submit" type="submit" value="작성완료" class="inputb">
     		    <input name="list" type="button" value="글목록" class="inputb" onClick="javascript:location.href='boardList.action'">
      		</td>
        </tr>	
	</table>
	</form>
</body>
</html>