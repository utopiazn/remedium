<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
	<style type="text/css">
	#top{
	width: 100%; height: 100%; background-color: #C0C0C0; float: center;
	}
	#navi {
	margin: 0 10px; font-family: "돋음",sans-serif;
	font-size: 18px; color: #FFFFFF;
	float: right;
	}
	#menu{
	 height:300; background-color:#C0C0C0; float: center; 
	 font-family: "돋움",sans-serif; color: #FFFFFF; line-height: 3em; text-align: center;
	}
	#res{
	height: 50px; background-color:#8EA8DB; font-family:"돋움",sans-serif;
	color: #FFFFFF; text-align: center; line-height: 3em;
	}
	#logo{
	margin: 0 auto;
	}
	
	
	</style>
</head>
<body>

<div id="top">

<div id="navi">
<a href="login.join.JoinAction">회원가입</a>
<a href="login.LoinAction">로그인</a>
</div>

<div id="logo">
<img alt="호텔로고" src="/remedium/image/logo2.png" width="200" height="100">
</div>

<div id="menu">
	<a href="main.infoAction">호텔 정보   </a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="room.infoAction">객실 소개   </a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href=service.FacilitiesListAction">편의 시설   </a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="service.EventListAction.java">이 벤 트   </a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <a href="board.ListAction">문의사항</a>
</div>

<div id="res">
숙박 날짜:
<select name="years">
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
</select>

고객 수:
<select name="people">
<option>1명</option>
<option>2명</option>
<option>3명</option>
<option>4명</option>
<option>5명</option>
<option>단체</option>
</select>

<input type="checkbox" name="unknow" id="unknow">
<label for="unknow">일정미정</label>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<input type="submit" value="검색" name="search">


</div>
</div>



    

    
   
</body>
</html>