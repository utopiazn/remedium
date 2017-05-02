<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<s:if test="resultClass ==null">
<form action="roomInsert.action" method="post" enctype="multipart/form-data">
	<table>
			<tr>
				<td>객실번호</td><td> <input type="text" name="no"></td>
			</tr>
</s:if>
<s:else>
<form action="roomUpdate.action" method="post" enctype="multipart/form-data">
	<table>
			<tr>
				<s:hidden name="no" value="%{resultClass.no}" />
				<s:hidden name="savImage" value="%{resultClass.savImage}" />
				<td>객실번호&nbsp;</td><td>${resultClass.no}호</td>
			</tr>
			
</s:else>
			<tr>
				<td>객실이름&nbsp;</td><td> <s:textfield name="name" theme="simple" value="%{resultClass.name}"/></td>
			</tr>
			<tr>
				<td>객실크기&nbsp;</td><td> 
				<s:textfield name="room_size" theme="simple" value="%{resultClass.room_size}"/></td>
			</tr>
			<tr>
				<td>객실정원&nbsp;</td><td> 
				<s:textfield name="room_capacity" theme="simple" value="%{resultClass.room_capacity}"/></td>
			</tr>
			<tr>
				<td>객실구성&nbsp;</td><td> 
				<s:textfield name="construction" theme="simple" value="%{resultClass.construction}"/></td>
			</tr>
			<tr>
				<td>객실소개&nbsp;</td><td> 
				<s:textarea name="room_comment" theme="simple" value="%{resultClass.room_comment}"/></td>
			</tr>
			<tr>
				<td>객실요금</td><td> 
				<s:textfield name="price" theme="simple" value="%{resultClass.price}"/></td>
			</tr>
			<tr>
				<td>객실종류</td><td> <select name="room_class">
						<s:iterator value="%{session.RClist}">
						<option value='<s:property value="room_class"/>'
						<s:if test="${resultClass.room_class==room_class}"> 
						selected="selected"
						</s:if>
						><s:property value="name"/></option>
						</s:iterator>
					  </select></td>
			</tr>
			<tr>		  
				<td align="right" colspan=2><input type="submit" name="추가"></td>
			</tr>
		</table>
	</form>
</body>
</html>