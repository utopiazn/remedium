<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#image /* 사진 이미지 */
{
	width:700; height:5000; float: center;
}
#room /* 객실 정보 */
{
 border: "1"; font-family: "돋움", sans-serif; text-align: left; line-height: 1.7em; display:inline-block;  float: left;
}
#semi /* 객실 구성 */
{
 width: 300px; height: 284px; float: right; display:inline-block;
}
#intro /* 객실 소개 */
{
font-weight: bolder; font-family: "돋움", sans-serif; text-align: left;
}
#all
{
display:inline; 
}

	

</style>

</head>
<body>


<div id="image">

<img height="400" alt="호텔로고" src="/remedium/image/roomImage/<s:property value='resultClass.savImage'/>" >
</div>



<div id="all">
<div id="room">
객실 번호 :
<s:property value="resultClass.no"/>호<br>
객실 이름 :
<s:property value="resultClass.name"/><br>
객실 크기 :
<s:property value="resultClass.room_size"/><br>
객실 종류 :
<s:if test="%{resultClass.room_class==1}">
기본 방
</s:if>
<s:elseif test="%{resultClass.room_class==2}">
좋은 방
</s:elseif>
<s:elseif test="%{resultClass.room_class==3}">
독방...?
</s:elseif>
<s:elseif test="%{resultClass.room_class==4}">
사막ㅠㅠ
</s:elseif>
<s:elseif test="%{resultClass.room_class==5}">
툰드라 ㄷㄷ
</s:elseif>
<s:else>여기가 그유명한 지옥이라네요!</s:else><br>
객실 정원 :
<s:if test="%{resultClass.room_capacity==0}">
단체(5~20명 수용가능)<br>
</s:if>
<s:else>
<s:property value="resultClass.room_capacity"/>명<br>
</s:else>
객실 소개:<br>
<s:property value="resultClass.room_comment"/><br>
이용 요금:
<s:property value="resultClass.price"/>원

<br>
<form action="roomReservationForm.action" method="post" enctype="multipart/form-data">
<input type="hidden" name="num" value="${num }"/>
<input type="hidden" name="firstDate" value="${firstDate }"/>
<input type="hidden" name="lastDate" value="${lastDate }"/>
<input type="hidden" name="room_capacity" value="${resultClass.room_capacity}"/>
<input type="hidden" name="price" value="${resultClass.price}"/>
<input type="hidden" name="people" value="${people}"/>
<s:if test="${session.memberId != null}">
<input type="submit"value="객실예약"/>
</s:if>
</form>
<s:if test="${ session.userAdmin == '1' }"> <!-- 아이디가 admin일 경우 객실 수정과 삭제 보여주기 -->
<input type="button" value="객실수정" onclick="location.href='/remedium/roomUpdateForm.action?no=<s:property value="resultClass.no"/>'" />
<input type="button" value="객실삭제" onclick="location.href='/remedium/roomDelete.action?no=<s:property value="resultClass.no"/>'" />

</s:if>
</div>

 
 <div id="semi">
<s:property value="resultClass.room_construction"/>
<img alt="호텔로고" src="/remedium/image/semi.jpg" >

</div>

</div>
</body>
</html>