<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

 <style type="text/css">
 #reslist /* 예약리스트 */
 {
 background-color:#FFFFF; float: left; width: 200px; height: 200px; border: 1px solid #000000; margin: 100px 50px 50px;  display:table-cell; border-radius: 5px;
 }
  #cash /* 캐쉬 충전 */
 {
 background-color:#FFFFF; float: left; width: 200px; height: 200px; border: 1px solid #000000; margin: 100px 50px 50px; display:table-cell; border-radius: 5px;
 }
  #modify /* 정보 수정*/
 {
 background-color:#FFFFF; float: left; width: 200px; height: 200px; border: 1px solid #000000; margin: 100px 50px 50px; display:table-cell; border-radius: 5px;
 }
  #out /*회원 탈퇴*/
 {
 background-color:#FFFFF; float: left; width: 200px; height: 200px; border: 1px solid #000000; margin: 100px 50px 50px; display:table-cell; border-radius: 5px;
}
.mainBox{width: 700px; margin: 0 auto; display: table-row; float: center;} 
 

 
 </style>

</head>
<body>

<div class="mainBox">
	<div id="modify">
 	<img alt="회원정보 수정" src="/remedium/image/modify.png" width="100%" height="100%"  onclick="location.href='myPageList.action'" > 
  
 	</div>
  
 	<div id="out">
 	<img alt="회원 탈퇴" src="/remedium/image/out.png" width="100%" height="100%"  onclick="location.href='loginDelete.action'" > 
  
  
 	</div>
</div>
 	
 <s:if test="${ session.userAdmin != '1'}">	<!-- 관리자일 경우 보이지 않음 -->
 <div class="mainBox">	
 	<div id="reslist">
 	<img alt="나의 예약 페이지" src="/remedium/image/reslist.png" width="100%" height="100%"  onclick="location.href='LoginModifyForm.action'" > 
 	</div>
  
 	<div id="cash">
  	<img alt="캐쉬 충전" src="/remedium/image/cash.png" width="100%" height="100%"  onclick="location.href='myPageCash.action'" > 
	</div>
	
</div>
</s:if>

</body>
</html>