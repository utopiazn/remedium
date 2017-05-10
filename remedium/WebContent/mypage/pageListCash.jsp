<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/board.css" rel="stylesheet" style="text/css">
<style type="text/css">
.cash {
    margin-top: 103px;
    width: 100%;
    height: 140px;
    line-height: 120px;
    font-family: '맑은 고딕', sans-serif;
    font-size: 17px;
    font-weight: bolder;
    border: 2px solid #202f58;
}

.info/* 회원가입 부분 */
{
text-align: center; 
margin: 3% auto; 
width:70%; 
font-weight: bold;
font-size: 22px;
}
</style>

<script type="text/javascript">
function cashok(userinput) {
	if(userinput.cash.value != 0){
		alert("캐쉬가 충전되었습니다.");
		return false;
	}
	return true;
}
</script>


</head>
<body>

<div class="info">
캐쉬 충전<br/><br/>
<hr align="center" width="50%" size="1" color="gray">

<div class="cash">

<form action="myPageCash.action" method="post" enctype="mutipart/form-data" onsubmit="cashok(this)">
<input type="radio" name="cash" value="100000"/> 100,000 CASH
<input type="radio" name="cash" value="200000"/> 200,000 CASH
<input type="radio" name="cash" value="300000"/> 300,000 CASH
<input type="radio" name="cash" value="500000"/> 500,000 CASH
<input type="radio" name="cash" value="1000000"/> 1,000,000 CASH <br/>

<input type="hidden" value="${session.memberId }" name="memberId">

<input class="button" type="submit" value="충전">
<input type="button" value="취소" class="button"  onClick="javascript:location.href='myPageMain.action'">

 </form>
</div>

</div>

</body>




</html>