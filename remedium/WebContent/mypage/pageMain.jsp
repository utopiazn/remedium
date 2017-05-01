   <%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
	<link href="css/mypage.css" rel="stylesheet" style="text/css">

<%-- <script type="text/javascript">
function open_win_noresizable(url, name) {
	var oWin = window.open(url, name,"scrollbars=no, status=no, resizable=no, width=300, height=150");
	
	
}
</script> --%>

</head>
<body>

<div class="mainBox">
	<div id="modify">
  	<s:if test="${ session.userAdmin == '1' }"> <!-- 아이디가 관리자 아이디일 경우 -->
	<img alt="회원정보 수정" src="/remedium/image/modify2.png" width="100%" height="100%"  onclick="location.href='memberAdminList.action'" > 
	</s:if>
	<s:else>
 	<img alt="회원정보 수정" src="/remedium/image/modify.png" width="100%" height="100%"  onclick="location.href='loginModifyForm.action?memberID=${session.memberId}'" > 
	</s:else>
 	</div>
  
 	<div id="out">
 	<img alt="회원 탈퇴" src="/remedium/image/out.png" width="100%" height="100%"  onClick="location.href='loginDeleteForm.action?memberID=${session.memberId}'">
  
 	</div>
</div>
 	

 <div class="mainBox">	
 	<div id="reslist">
 	<s:if test="${ session.userAdmin == '1' }"> <!-- 아이디가 관리자 아이디일 경우 -->
 	<img alt="나의 예약 페이지" src="/remedium/image/reslist.png" width="100%" height="100%"  onclick="location.href='roomAdminList.action'" > 
 	</s:if>
 	<s:else>
 	<img alt="나의 예약 페이지" src="/remedium/image/reslist.png" width="100%" height="100%"  onclick="location.href='myPageList.action?memberID=${session.memberId}'" > 
  	</s:else>
 	</div>
  
  	<s:if test="${ session.userAdmin != '1'}">	<!-- 관리자일 경우 보이지 않음 -->
 	<div id="cash">
  	<img alt="캐쉬 충전" src="/remedium/image/cash.png" width="100%" height="100%"  onclick="location.href='myPageCashForm.action'" > 
	</div>
	</s:if>
	<s:elseif test="${session.userAdmin == '1'}">
	<div id="cash">
  	<img alt="객실 리스트" src="/remedium/image/roomlist.png" width="100%" height="100%"  onclick="location.href='roomAllList.action'" > 
	</div>
	</s:elseif>
	
</div>


</body>
