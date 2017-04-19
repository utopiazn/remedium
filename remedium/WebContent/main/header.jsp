<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
	<style type="text/css">
	#top /* 상단 */
	{ 
	width: 100%; height: 100%; background-color: #C0C0C0;
	}
	#navi  /* 회원가입 로그인 부분 */
	{
	margin: 0 10px; font-family: "돋음",sans-serif; text-decoration: none; 
	font-size: 15px; color: #FFFFFF; float: right; padding-top: 50px; padding-right: 20px; font-weight: bolder;
	}
	#menu /* 메뉴(카테고리) */
	{
	 background-color:#C0C0C0; float: center; text-decoration: none; 
	 font-family: "돋움",sans-serif; color: #FFFFFF; line-height: 3em; text-align: center; font-weight: bolder;
	}
	#res /* 예약 부분 */
	{
	height: 50px; background-color:#8EA8DB; font-family:"돋움",sans-serif; 
	color: #FFFFFF; text-align: center; font-weight: bolder; line-height: 3em; float: center;
	}
	#logo /* 로고 */
	{
	margin: 0 auto; float: center; cursor: pointer; padding-left: 50px;
	}
	a /* 링크 속성 */
	{text-decoration: none; color: #000000; } 
	
	</style>
</head>
<body>

<div id="top">

<div id="navi">


<s:if test="${ session.userAdmin == '1' }"> <!-- 아이디가 관리자 아이디일 경우 -->
<a href="memberAdminList.action">회원관리 </a>
&nbsp;
<a href="logout.action">로그아웃</a>
&nbsp;
</s:if>
<s:if test="${session.memberId != null}"> <!-- 아이디가 null이 아닌 경우 -->
<a href="myPageMain.action">마이페이지</a>
&nbsp;
<a href="loginModifyForm.action">회원수정</a>
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
	<a href="info.action">호텔 정보   </a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="roomInfoView.action?room_class='1'">객실 소개   </a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="facilitiesList.action">편의 시설   </a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="eventList.action">이 벤 트   </a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="faqList.action">문의사항</a>
</div>
<form action="roomList.action" method="post" enctype="multipart/formdata" onsubmit="return ReservationCH(this);">
<div id="res">

숙박 날짜:
<input type="date" name="firstdate">
~
<input type="date" name="lastdate">


<%-- <select name="years">
<option>2017년</option>
<option>2016년</option>
</select>

<select name="month">
<option>1월</option>
<option>2월</option>
<option>3월</option>
<option>4월</option>
<option>5월</option>
<option>6월</option>
<option>7월</option>
<option>8월</option>
<option>9월</option>
<option>10월</option>
<option>11월</option>
<option>12월</option>
</select>

<select name="day">
<option>1일</option>
<option>2일</option>
<option>3일</option>
<option>4일</option>
<option>5일</option>
<option>6일</option>
<option>7일</option>
<option>8일</option>
<option>9일</option>
<option>10일</option>
<option>11일</option>
<option>12일</option>
<option>13일</option>
<option>14일</option>
<option>15일</option>
<option>16일</option>
<option>17일</option>
<option>18일</option>
<option>19일</option>
<option>20일</option>
<option>21일</option>
<option>22일</option>
<option>23일</option>
<option>24일</option>
<option>25일</option>
<option>26일</option>
<option>27일</option>
<option>28일</option>
<option>29일</option>
<option>30일</option>
<option>31일</option>
</select>

숙박일수:
<select name="sleep">
<option>1박</option>
<option>2박</option>
<option>3박</option>
<option>4박</option>
</select> --%>

고객 수:
<select name="people">
<option>1</option>
<option>2</option>
<option>3</option>
<option>4</option>
<option>5</option>
<option>단체</option>
</select>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


<input type="submit" value="검색">

<input type="button" value="전체" name="search" onclick="location.href='roomAllList.action'">



</div>
</form>
</div>



    

    
   
</body>
<script type="text/javascript">

function ReservationCH(userinput){
	alert("실행되고");
	if(userinput.firstdate.value==""){
		alert("처음이 공백");
		return false;
	}
	
	if(userinput.lastdate.value==""){
		alert("마지막이 공백");
		return false;
	}
	
	var fd =userinput.firstdate.value;
	var ld =userinput.lastdate.value;
	
	if(fd==ld){
		alert("당일치기금지");
		return false;
	}
	
	if(fd>ld){
		alert("???");
		return false;
	}
}

</script>

</html>