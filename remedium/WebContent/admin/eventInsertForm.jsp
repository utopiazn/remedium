<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 글쓰기 폼</title>
<SCRIPT type="text/javascript">
		function validation() {
		
			var frm = document.forms(0);
			
			if(frm.subject.value == "") {
				alert("이벤트 종류를 입력해주세요.");
				return false;
			} 
			
			else if(frm.content.value == "") {
				alert("이벤트 시작일을 입력해주세요.");
				return false;			
			} 
			
			else if(frm.content.value == "") {
				alert("이벤트 종료일을 입력해주세요.");
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
 <body>
  	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  			<td align="center"><h2>EVENT * PROMOTION</h2></td>
  		</tr>
  	</table>
  

	<form action="eventInsert.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">

       <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이벤트 종류</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="name" theme="simple" value="%{resultClass.name}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>

        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이벤트 시작</td>
          <td bgcolor="#FFFFFF">
          <input type="date" name="firstdate">

           <%--  <s:textfield name="firstdate" theme="simple" value="%{resultClass.firstdate}" cssStyle="width:100px" maxlength="20"/> --%>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이벤트 종료</td>
          <td bgcolor="#FFFFFF">
           <input type="date" name="lastdate">
           <%--  <s:textfield name="lastdate" theme="simple" value="%{resultClass.lastdate}" cssStyle="width:100px" maxlength="20"/> --%>
         
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="content" theme="simple" value="%{resultClass.content}" cols="50" rows="10" />
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input type="submit" value="작성완료" >
            <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='eventList.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
    </form>

  </body>
</html>