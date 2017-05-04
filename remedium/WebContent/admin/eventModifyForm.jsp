<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 수정 폼</title>

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
	<link href="css/board.css" rel="stylesheet" style="text/css">
<style type="text/css">
a{
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
  	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  			<td align="center"><h2>EVENT * PROMOTION</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			</td>
  		</tr>
  	</table>
  

	<form action="eventModify.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">
			<s:hidden name="no" value="%{resultClass.no}" />
       <table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
				
        <tr>
          <td width="100" bgcolor="#202f58"><font color="white">*  이벤트 종류</font></td>
          <td align="left" width="500" bgcolor="#FFFFFF">
            <s:textfield name="name" theme="simple" value="%{resultClass.name}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
          <tr>
	<td align="left" width="100" bgcolor="#202f58"><font color="white">*  이미지 </font></td>
	<td align="left"><s:file name="upload" theme="simple"/>
	<s:if test="%{resultClass.image!=null}"><br/>
	<small>사진이 등록되어있습니다. ${resultClass.image}</small>
	<s:hidden name="image" value="%{resultClass.image}"/>
	</s:if>
	</td>
	</tr> 							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>

        <tr>
          <td bgcolor="#202f58"><font color="white">*  이벤트 시작</font></td>
          <td align="left" bgcolor="#FFFFFF">
          <input type="date" name="firstdate">

           <%--  <s:textfield name="firstdate" theme="simple" value="%{resultClass.firstdate}" cssStyle="width:100px" maxlength="20"/> --%>
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td bgcolor="#202f58"><font color="white">*  이벤트 종료</font></td>
          <td align="left" bgcolor="#FFFFFF">
           <input type="date" name="lastdate">
           <%--  <s:textfield name="lastdate" theme="simple" value="%{resultClass.lastdate}" cssStyle="width:100px" maxlength="20"/> --%>
         
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        
	<tr>
          <td bgcolor="#202f58"><font color="white">*  내용</font></td>
          <td align="left" bgcolor="#FFFFFF">
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
          	<input class="button" type="submit" value="수정" >
            <input class="button" name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='eventList.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
    </form>
   </div>
  </body>
</html>