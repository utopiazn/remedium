<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>관리자 이벤트 글쓰기 폼</title>

<style>
	
	table td{padding: 10px 0px; border-bottom: 1px solid #ccc; text-align: left; font-size: 14px; padding-left: 15px;   }
	table .title{border-bottom: 1px solid #777; }
	table .info{padding-top: 10px; padding-bottom: 30px; border-bottom: 2px solid #202f58; font-size: 12px; }
	table .btnArea{padding: 30px 0px; }
	table .btnArea input{padding: 10px 20px; margin: 0px 5px; cursor: pointer; }
	table .btnArea input:first-child{background: #202f58; color: #fff; border: none; }
	table .btnArea input:last-child{background: #ccc; color: #000; border: none; }
</style>


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
<div class="event">
  	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
<<<<<<< HEAD
  			<th align="center" class="title"><h2>EVENT * PROMOTION</h2></th>
=======
  			<td align="center"><h2>EVENT * PROMOTION</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			</td>
>>>>>>> 76e0d3c764509b23588102a9d513016c292e7f70
  		</tr>
  	</table>
  

	<form action="eventInsert.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">

       <table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <th align="right" colspan="2" class="info"><font color="#FF0000">*</font>는 필수 입력사항입니다.</th>
        </tr>
    
        <tr>
<<<<<<< HEAD
          <td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이벤트 종류</td>
          <td width="550" bgcolor="#FFFFFF">
            <s:textfield name="name" theme="simple" value="%{resultClass.name}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
     <tr>
	<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이미지</td>
	<td><s:file name="upload" theme="simple"/>
=======
          <td width="100" bgcolor="#202f58"><font color="white">*  이벤트 종류</font></td>
          <td align="left" width="500" bgcolor="#FFFFFF">
           &nbsp; <s:textfield name="name" theme="simple" value="%{resultClass.name}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
     <tr>
	<td align="left" width="100" bgcolor="#202f58"><font color="white">*  이미지</font></td>
	<td align="left">&nbsp; <s:file name="upload" theme="simple"/>
>>>>>>> 76e0d3c764509b23588102a9d513016c292e7f70
	</td>
	</tr> 							

        <tr>
          <td bgcolor="#202f58"><font color="white">*  이벤트 시작</font></td>
          <td align="left" bgcolor="#FFFFFF">
         &nbsp; <input type="date" name="firstdate">

           <%--  <s:textfield name="firstdate" theme="simple" value="%{resultClass.firstdate}" cssStyle="width:100px" maxlength="20"/> --%>
          </td>
        </tr>

        
        <tr>
          <td bgcolor="#202f58"><font color="white">* 이벤트 종료</font></td>
          <td align="left" bgcolor="#FFFFFF">
          &nbsp; <input type="date" name="lastdate">
           <%--  <s:textfield name="lastdate" theme="simple" value="%{resultClass.lastdate}" cssStyle="width:100px" maxlength="20"/> --%>
         
          </td>
        </tr>

        
        
	<tr>
          <td bgcolor="#202f58"><font color="white">*  내용</font> </td>
          <td align="left" bgcolor="#FFFFFF">
           &nbsp; <s:textarea name="content" theme="simple" value="%{resultClass.content}" cols="50" rows="10" />
          </td>
        </tr>
    
        
        <tr>
<<<<<<< HEAD
          <th align="center" colspan="2" class="btnArea">
          	<input type="submit" value="작성완료" >
            <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='eventList.action?currentPage=<s:property value="currentPage" />'">
          </th>
=======
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input class="button" type="submit" value="작성완료" >
            <input class="button" name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='eventList.action?currentPage=<s:property value="currentPage" />'">
          </td>
>>>>>>> 76e0d3c764509b23588102a9d513016c292e7f70
        </tr>

    </table>
    </form>
   </div>
  </body>
</html>