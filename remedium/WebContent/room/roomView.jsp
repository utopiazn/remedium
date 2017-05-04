<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style type="text/css">
#image /* 사진 이미지 */
{
	width:600px; height:420px; text-align:center;
}
#room /* 객실 정보 */
{
 width: 600px; font-family: "돋움", sans-serif; text-align: left; line-height: 1.7em; display:inline-block;  float: left;
clear: left;
}
#semi /* 객실 구성 */
{
 width: 600px; height: 284px; float: right; display:inline-block;
}
#intro /* 객실 소개 */
{
font-weight: bolder; font-family: "돋움", sans-serif; text-align: left;
}
#all
{
width:100%; height: 500px;
}

a{
color: black;
}
.content{
margin-top : 5% auto; 
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
<center>
<div class="content">
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td align="center"><h2>${resultClass.class_name}(${resultClass.no}호)</h2>
		<hr align="center" width="60%" size="1" color="gray">
		</td>
	</tr>
</table>
</div>

<div id="image">

<img height="400" alt="호텔로고" src="/remedium/image/roomClassImage/<s:property value='resultClass.savImage'/>" >
<%-- <img height="400" alt="호텔로고" src="/remedium/image/roomImage/<s:property value='resultClass.savImage'/>" > --%>
</div>


<div id="room">
객실 번호 :
<s:property value="resultClass.no"/>호<br>
객실 이름 :
<s:property value="resultClass.name"/><br>
객실 종류 :
<s:property value="resultClass.class_name"/><br>
객실 정원 :
<s:if test="%{resultClass.room_capacity==0}">
단체(5~20명 수용가능)<br>
</s:if>
<s:else>
<s:property value="resultClass.room_capacity"/>명<br>
</s:else>
객실 소개:<br>
<s:property value="resultClass.room_comment"/><br>


<br>
<form action="roomReservationForm.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="${num }"/>
<input type="hidden" name="firstDate" value="${firstDate }"/>
<input type="hidden" name="lastDate" value="${lastDate }"/>
<input type="hidden" name="room_capacity" value="${resultClass.room_capacity}"/>
<input type="hidden" name="price" value="${resultClass.price}"/>
<input type="hidden" name="people" value="${people}"/>
<input type="hidden" name="image" value="${resultClass.savImage}"/>
<s:if test="${session.memberId == null}">
<font color="blue">로그인후 이용해 주십시오.</font>
</s:if>
<s:elseif test="${ session.userAdmin == '1' }"> <!-- 아이디가 admin일 경우 객실 수정과 삭제 보여주기 -->
<input class="button" type="button" value="객실수정" onclick="location.href='/remedium/roomUpdateForm.action?no=<s:property value="resultClass.no"/>'" />
<input class="button" type="button" value="객실삭제" onclick="location.href='/remedium/roomDelete.action?no=<s:property value="resultClass.no"/>'" />
<input class="button" type="button" value="객실목록" onclick="javascript:history.back()" />
</s:elseif>
<s:else>
<input class="button" type="submit" value="객실예약"/>
</s:else>
</form>
</div>

<div id="semi">
<s:property value="resultClass.room_construction"/>
<img width="100%" alt="호텔로고" src="/remedium/image/roomClassImage/<s:property value='classInfo'/>" >
</div>

</body>
</html>