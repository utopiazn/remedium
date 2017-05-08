<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type="text/css">

.content{ margin-top: 20px;  
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
<div class="content">
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
  		<tr>
  			<th align="center"><h2>객실 추가</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			</th>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
</table>

<s:if test="resultClass ==null">
<form action="roomInsert.action" method="post" enctype="multipart/form-data">
</s:if>
<s:else>
<form action="roomUpdate.action" method="post" enctype="multipart/form-data">
</s:else>
	<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">객실번호</font></td>
				<td align="left">&nbsp;<s:textfield name="no" theme="simple" value="%{resultClass.no}"/></td>
			</tr>
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">객실이름</font></td>
				<td align="left">&nbsp;<s:textfield name="name" theme="simple" value="%{resultClass.name}"/></td>
			</tr>
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">객실크기</font></td>
				<td align="left">&nbsp;<s:textfield name="room_size" theme="simple" value="%{resultClass.room_size}"/></td>
			</tr>
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">객실정원</font></td>
				<td align="left">&nbsp;<s:textfield name="room_capacity" theme="simple" value="%{resultClass.room_capacity}"/></td>
			</tr>
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">객실구성</font></td>
				<td align="left">&nbsp;<s:textfield name="construction" theme="simple" value="%{resultClass.construction}"/></td>
			</tr>
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">객실소개</font></td>
				<td align="left" style="padding-top:10px;" >&nbsp;<s:textarea name="room_comment" cols="50" rows="5" theme="simple" value="%{resultClass.room_comment}"/></td>
			</tr>
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">객실요금</font></td>
				<td align="left">&nbsp;<s:textfield name="price" theme="simple" value="%{resultClass.price}"/></td>
			</tr>
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">객실종류</font></td>
				<td align="left">&nbsp;<select name="room_class">
						<s:iterator value="%{session.RClist}">
						<option value='<s:property value="room_class"/>'
						<s:if test="${resultClass.room_class==room_class}"> 
						selected="selected"
						</s:if>
						><s:property value="name"/></option>
						</s:iterator>
					  </select></td>
			</tr>
			<tr bgcolor="#777777">
        		<td height="1" colspan="2"></td>	
        	</tr>
			<tr>		  
				<td align="right" colspan=2><input class="button" type="submit" name="추가"></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>