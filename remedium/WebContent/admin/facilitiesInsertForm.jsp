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
  <s:if test="%{resultClass.no != null}">
  		<tr>
  			<th align="center"><h2>편의시설 수정</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			</th>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
</table>	
<form action="facilitiesModifyAction.action" method="post" enctype="multipart/form-data">
</s:if>
<s:else>
  		<tr>
  			<th align="center"><h2>편의시설 추가</h2>
  			<hr align="center" width="50%" size="1" color="gray">
  			</th>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
</table>
<form action="facilitiesInsert.action" method="post" enctype="multipart/form-data">
</s:else>
		<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr bgcolor="#777777">
       		<td height="1" colspan="2"></td>	
       	</tr>
		<tr>
		<td width="100" bgcolor="#202f58"><font color="white">번호</font></td>
		<td align="left">&nbsp;<s:textfield name="no" theme="simple" value="%{resultClass.no}"/></td>
		</tr>
		<tr bgcolor="#777777">
       		<td height="1" colspan="2"></td>	
       	</tr>
		<tr>
		<td width="100" bgcolor="#202f58"><font color="white">시설이름</font></td>
		<td align="left">&nbsp;<s:textfield name="name" theme="simple" value="%{resultClass.name}"/></td>
		</tr>
		<tr bgcolor="#777777">
       		<td height="1" colspan="2"></td>	
       	</tr>
		<tr>
		<td width="100" bgcolor="#202f58"><font color="white">정보</font></td>
		<td align="left" style="padding-top:10px;" >&nbsp;<s:textarea name="content" cols="50" rows="5" theme="simple" value="%{resultClass.content}"></s:textarea>
		</td> 
		</tr>
		<tr bgcolor="#777777">
       		<td height="1" colspan="2"></td>	
       	</tr>
		<tr>
		<td width="100" bgcolor="#202f58"><font color="white">운영시간</font></td>
		<td align="left">&nbsp;<s:textfield name="time" theme="simple" value="%{resultClass.time}"/></td>
		</tr>
		<tr bgcolor="#777777">
       		<td height="1" colspan="2"></td>	
       	</tr>
		<tr>
		<td width="100" bgcolor="#202f58"><font color="white">이미지</font></td>
		<td align="left">&nbsp;<s:file name="upload" theme="simple"/>
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
		<td colspan="2" align="right">
		<s:if test="%{resultClass.no != null}">
		<input class="button" type="submit" value="시설수정">
		</s:if>
		<s:else>
		<input class="button" type="submit" value="시설추가">
		</s:else>
		</td>
		</tr>
		</table>
</form>
</div>
</body>
</html>