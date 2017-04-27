<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>이벤트 상세보기</title>
<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  			<td align="center"><h2>EVENT * PROMOTION</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
		
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
      
      <tr bgcolor="#777777">
        <td height="1" colspan="4"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  번호 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.no" />
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="4"></td>	
      </tr>
      
      <tr>
        <td width="100" bgcolor="#F4F4F4"> 이벤트 종류</td>
        <td width="500" bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.name" />
        </td>
      </tr>
      					
      <tr bgcolor="#777777">
        <td height="1" colspan="4"></td>	
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  내용 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.content" />
        </td>
      </tr>
  
      <tr bgcolor="#777777">
        <td height="1" colspan="4"></td>	
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  이벤트 시작 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.firstdate" />
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="4"></td>	
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  이벤트 종료 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.lastdate" />
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="4"></td>	
      </tr>
      

      <tr bgcolor="#777777">
        <td height="1" colspan="4"></td>	
      </tr>
      
      <tr>
        <td height="10" colspan="4"></td>
      </tr>
      
      
      <tr>
        <td align="right" colspan="4">
       
        </td>
      </tr>
      <img height="400" alt="이벤트사진" src="/remedium/image/eventImage/<s:property value='resultClass.image'/>" >

  </table>
</body>
</html>