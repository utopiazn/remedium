<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��й�ȣ ã��</title>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function windowclose() {
	  opener.document.loginform.memberId.value="${resultClass.memberID}";
	  opener.document.loginform.memberPasswd.value="${resultClass.memberPassword}";
  self.close();
}
</script>

</head>
<body>

<center>

<br>
    
<table width="100%" height="250" border="0" cellpadding="0" cellspacing="0" >
<tr>
  <td valign="top" align="center" bgcolor="#c1e4fa">
  <table width="450" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="50" valign="top"></td>
    <td width="400" valign="top">
  
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td height="40"></td>
    </tr>
    <tr>
      <td align="center" class="body_indigo13"><font size="3"><strong>��й�ȣ ã�� ���</strong></td>
    </tr>
    <tr><td height="10"></td></tr>
    </table>
  
    <table width="100%" border="0" cellpadding="2" cellspacing="0">
    <tr>
      <td align="center">
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="1070">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr height="10">
          <td></td>
          <td></td>
        </tr>
        <!-- 
        <tr height="30">
          <td width="100" align="left">���̵�</td>
          &nbsp;<td>${memresultClass.mem_id}</td>
        </tr>
        -->
      
        <tr height="100">
          <td width="1000" align="center">��й�ȣ�� &nbsp; [${resultClass.memberPassword}] &nbsp; �Դϴ�.
        </tr>
       
        <tr height="10">
          <td></td>
          <td></td>
        </tr>
        </table>
        </td>
        <tr>
        <td width="1000" align="center">
          <a href="loginForm.action"><font size=2><b>�α���</b></font></a>&nbsp;  | &nbsp; 
          <a href="main.action"><font size=2><b>��������</b></font></a>
        </td>
      </tr>
      </table>
      </td>
    </tr>
    </table>
    </td>
  </tr>
  </table>
  
  </td>
</tr>
</table>
</center>

</body>
</html>