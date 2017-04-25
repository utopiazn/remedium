<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>FAQ * 문의사항 상세보기</title>
<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>FAQ * 문의사항</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
		
<table width="500" border="1" cellspacing="0" cellpadding="0">
      
			
      <tr>
        <td width="100" bgcolor="#F4F4F4">질문 유형 </td>
        <td width="100" bgcolor="#FFFFFF">
          &nbsp;<s:property value="resultClass.type" />
        </td>
        
        <td width="100" bgcolor="#F4F4F4">제 목</td>
        <td bgcolor="#FFFFFF">
          &nbsp;<s:property value="resultClass.subject" />
        </td>    
      </tr> 
      
      <tr>    
       	<td  width="100" height="400"bgcolor="#F4F4F4">내 용 </td>
        <td colspan="3"bgcolor="#FFFFFF">
          &nbsp;<s:property value="resultClass.content" />
        </td>
       </tr>
  </table>
</body>
</html>