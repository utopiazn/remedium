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
	width:700; height:500; float: center;
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

	

</style>

</head>
<body>


<div id="image">

<img alt="호텔로고" src="/remedium/image/roomImage/<s:property value='resultClass.savImage'/>" > <!-- 이미지 파일 받으면 이부분 삭제 후 적용 되는 지 봐야함! -->
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
<s:property value="resultClass.room_class"/><br>
객실 정원 :
<s:property value="resultClass.room_capacity"/>명<br>
객실 소개:<br>
<s:property value="resultClass.room_comment"/><br>
이용 요금:
<s:property value="resultClass.price"/>원

<br>

<s:if test="${ session.memberId =='admin' }"> <!-- 아이디가 admin일 경우 객실 수정과 삭제 보여주기 -->
<a href='/remedium/roomUpdateForm.action?no=<s:property value="resultClass.no"/>' >객실수정</a>
<a href='/remedium/roomDelete.action?no=<s:property value="resultClass.no"/>' >객실삭제</a>
</s:if>

</div>

 
 <div id="semi">
<s:property value="resultClass.room_construction"/>
<img alt="호텔로고" src="/remedium/image/semi.jpg" >

</div>

</div>







	<%-- <table>
	<tr>
			<td align="right"><s:property value="resultClass.no"/>호</td>
	</tr>
	<tr>
			<td align="center"><s:property value="resultClass.name"/></td>
	</tr>
	<tr>
			<td><s:property value="resultClass.room_class"/></td>
	</tr>
	<tr>
			<td align="right"><s:property value="resultClass.room_capacity"/>명</td>
	</tr>
	<tr>
			<td align="right"><s:property value="resultClass.price"/>원</td>
	</tr>
	</table> --%>

</body>
</html>