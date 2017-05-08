<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<script type="text/javascript">		
	
		function checkCash(userinput){
			
			var m = parseInt(userinput.money.value);
			var c = parseInt(userinput.cash.value);
			
			if(m > c){
				alert("현재 충전하신 Cash가 부족합니다.\n잔여Cash : "+c);
				
				var del = confirm("지금 바로 충전 하시겠습니까?");
				
				if(del == true){			
					document.location.href='myPageCashForm.action';
				}
				else{
				}
		 		return false;
			}
			
			if(m <= c){
				alert("객실 예약을 성공적으로 마쳤습니다.");
		 		return true;
			}
		}
</script>
<style type="text/css">
a{
color: black;
}
.content{
margin : 5% auto; 
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
 <div class="content">
<table width="900" border="0" cellspacing="0" cellpadding="0" align="center">
		<tr>
			<td align="center"><h2>호텔 객실 예약</h2>
			<hr align="center" width="60%" size="1" color="gray">
			<br/>
			</td>
		</tr>
	</table>
<form action="roomReservation.action" method="post" enctype="multipart/form-data" onsubmit="return checkCash(this);">
	<table width="600" border="0" align="center" cellspacing="0" cellpadding="0">
			<img height="400" alt="객실사진" src="/remedium/image/roomClassImage/${image}" >
			
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td bgcolor="#202f58"><font color="white">객실번호</font></td>
				<td>${num }호</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td bgcolor="#202f58"><font color="white">객실정원</font></td>
				<td>
				<s:if test='%{room_capacity==0}'>
				단체
				</s:if>
				<s:else>
				<s:property value="room_capacity"/>
				</s:else>
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<%-- <tr>
				<td bgcolor="#202f58"><font color="white">예약인원</font></td>
				<td>
				<s:if test='%{session.people==0}'>
				단체
				</s:if>
				<s:else>
				<s:property value="people"/>
				</s:else>
				</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr> --%>
			<tr>
				<td bgcolor="#202f58"><font color="white">입실날짜</font></td>
				<td>${firstDate }</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>			
			<tr>
				<td bgcolor="#202f58"><font color="white">퇴실날짜</font></td>
				<td>${lastDate }</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td bgcolor="#202f58"><font color="white">필요Cash</font></td>
				<td>${price }Cash</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>
			<tr>
				<td bgcolor="#202f58"><font color="white">잔여Cash</font></td>
				<td>${session.cash}Cash</td>
			</tr>
			<tr bgcolor="#777777">
				<td height="1" colspan="2"></td>
			</tr>			
	</table>
	
	<br>
<input type="hidden" name="no" value="${num}">
<input type="hidden" name="firstDate" value="${firstDate}">
<input type="hidden" name="lastDate" value="${lastDate}">
<input type="hidden" name="money" value="${price}">
<input type="hidden" name="memberID" value="${session.memberId}">
<input type="hidden" name="people" value="${session.people}">
<input type="hidden" name="cash" value="${session.cash}">



<input class="button" type="submit" value="예약하기">
<input class="button" type="button" value="뒤로가기" onclick="javascript:history.back()" />
</form>
</div>
</body>
</html>