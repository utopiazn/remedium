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
  			<th align="center" class="title"><h2>EVENT * PROMOTION</h2></th>
  		</tr>
  	</table>
  

	<form action="eventInsert.action" method="post" enctype="multipart/form-data" onsubmit="return validation();">

       <table width="700" border="0" cellspacing="0" cellpadding="0" align="center">
        <tr>
          <th align="right" colspan="2" class="info"><font color="#FF0000">*</font>는 필수 입력사항입니다.</th>
        </tr>
    
        <tr>
          <td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이벤트 종류</td>
          <td width="550" bgcolor="#FFFFFF">
            <s:textfield name="name" theme="simple" value="%{resultClass.name}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
     <tr>
	<td width="150" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이미지</td>
	<td><s:file name="upload" theme="simple"/>
	</td>
	</tr> 							

        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이벤트 시작</td>
          <td bgcolor="#FFFFFF">
          <input type="date" name="firstdate">

           <%--  <s:textfield name="firstdate" theme="simple" value="%{resultClass.firstdate}" cssStyle="width:100px" maxlength="20"/> --%>
          </td>
        </tr>

        
        <tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  이벤트 종료</td>
          <td bgcolor="#FFFFFF">
           <input type="date" name="lastdate">
           <%--  <s:textfield name="lastdate" theme="simple" value="%{resultClass.lastdate}" cssStyle="width:100px" maxlength="20"/> --%>
         
          </td>
        </tr>

        
        
	<tr>
          <td bgcolor="#F4F4F4"><font color="#FF0000">*</font>  내용 </td>
          <td bgcolor="#FFFFFF">
            <s:textarea name="content" theme="simple" value="%{resultClass.content}" cols="50" rows="10" />
          </td>
        </tr>
    
        
        <tr>
          <th align="center" colspan="2" class="btnArea">
          	<input type="submit" value="작성완료" >
            <input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='eventList.action?currentPage=<s:property value="currentPage" />'">
          </th>
        </tr>

    </table>
    </form>

  </body>
</html>