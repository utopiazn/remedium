<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="util.*" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"> 
<title></title>
<link href="css/header.css" rel="stylesheet" style="text/css">
<style type="text/css">
a /* 링크 속성 */
	{text-decoration: none; color: white; }  
	
	</style>
</head>
<body>

<div class="top">

<div id="navi">


<%-- <s:if test="${ session.userAdmin == '1' }"> <!-- 아이디가 관리자 아이디일 경우 -->
<a href="memberAdminList.action">회원관리 </a>
&nbsp;
</s:if> --%>
<s:if test="${session.memberId != null}"> <!-- 아이디가 null이 아닌 경우 -->
<a href="myPageMain.action">마이페이지</a>
&nbsp;
<a href="logout.action">로그아웃</a>
&nbsp;
</s:if>
<s:else>
<a href="joinForm.action">회원가입</a>
&nbsp;
<a href="loginForm.action">로그인</a>
&nbsp;

</s:else>
</div>

<div id="logo">
<img alt="호텔로고" src="/remedium/image/logo2.png" width="200" height="100" onclick="location.href='/remedium/main.action'" >


</div>

<div id="menu" >
	<a href="info.action">Remedium</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <!-- <a href="roomInfoView.action?room_class='1'">객실 소개   </a> -->
    <a href="roomInfoView.action?roomClass=1">Room</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="facilitiesList.action">Facility</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="eventList.action">Event</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="boardList.action">QnA</a>
</div>
<form action="roomList.action" method="post" enctype="multipart/formdata" onsubmit="return ReservationCH(this);">
<div id="res">
<c:set var="cDate" value="<%=new ProjectUtil()%>"/> 
<input type="hidden" name="curDate" value="${cDate.currentDate}">
체크인:
<input type="date" name="firstDate">
~
<input type="date" name="lastDate">

고객 수:
<select name="people">
<option value="1">1명</option>
<option value="2">2명</option>
<option value="3">3명</option>
<option value="4">4명</option>
<option value="0">단체(5인 이상)</option>
</select>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<input type="submit" value="검색">
<s:if test="${ session.userAdmin == '1' }"> <!-- 아이디가 관리자 아이디일 경우 -->
<input type="button" value="전체" name="search" onclick="location.href='roomAllList.action'">
</s:if>


</div>
</form>
</div>

    
   
</body>
<script type="text/javascript">

function ReservationCH(userinput){
	if(userinput.firstDate.value==""){
		alert("입실날짜를 적어주세요!");
		return false;
	}
	
	if(userinput.lastDate.value==""){
		alert("퇴실날짜를 적어주세요!");
		return false;
	}
	
	var fd = userinput.firstDate.value;
	var ld = userinput.lastDate.value;
	var cd = userinput.curDate.value;
	if(fd == ld){
		alert("당일치기금지");
		return false;
	}
	
	if(fd > ld){
		alert("???");
		return false;
	}
	
	if(fd < cd){
		alert("과거로 돌아가지 못해용\n 입력하신 검색날짜:"+fd+" / 현재날짜:"+cd);
		return false;
	}
}

</script>

</html>