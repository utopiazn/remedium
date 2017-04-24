<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.cash
{
float: center; margin-top: 200px; width: 1200px; height: 150px;  line-height: 100px;
font-family: '돋움', sans-serif; font-size: 20px; font-weight: bolder;
}

</style>
</head>
<body>

<div>
캐쉬 충전
</div>

<div class="cash">

<form action="myPageCash" method="post" enctype="mutipart/form-data">
<input type="radio" name="cash" value="50000"/> 50,000 CASH
<input type="radio" name="cash" value="100000"/> 100,000 CASH
<input type="radio" name="cash" value="200000"/> 200,000 CASH
<input type="radio" name="cash" value="300000"/> 300,000 CASH
<br>
<input type="text" name="cash"/>
<input type="submit" value="충전하기">
<!-- <input type="radio" name="cash" value="500000CASH"/> 500,000 CASH
<input type="radio" name="cash" value="100000CASH"/> 1000,000 CASH
 -->
 </form>
</div>



</body>
</html>