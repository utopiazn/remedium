<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<?xml version="1.0" encoding="UTF-8" ?>
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" >
	<script type="text/javascript">
	  
	function button_event(url){
		var del = confirm("이 회원을 정말로 삭제 하시겠습니까??");
		
		if(del == true){
			alert("삭제하였습니다.");			
			document.location.href=url;
		}
		else{
			alert("취소하셧습니다.");
			return
		}
		
	}
	</script>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="css/board.css" rel="stylesheet" style="text/css">
<style type="text/css">
a{
color: black;
}
.event{
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
.top{
	background-color:#202f58;
	color: white;
}


</style>
</head>
<body>
<div class="event">
	
	<table align="center" width="600" border="0" cellspacing="0" cellpadding="0">
	
		<tr>
			<td align="center">
				<h2>회원 상세 보기</h2>
				<hr align="center" width="50%" size="1" color="gray">
				<br>
			</td>
		</tr>	
		
	
	</table>


	<!-- 로그인폼으로 이동 -->
		<table align="center" width="600" border="1" cellspacing="0" cellpadding="0">	
			<tr>
				<td width="50" bgcolor="#202f58"><font color="white">* 아이디</font>
				</td>
			
				<td  bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.memberID}"/> 
				</td>
				<td width="100" bgcolor="#202f58"><font color="white">* 가입일</font>
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.regdate}"/>					 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 비밀 번호</font>
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan="0">
					<s:property value="%{resultClass.memberPassword}"/>					 
				</td>
				<td width="100" bgcolor="#202f58"><font color="white">* 탈퇴일</font>
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.deldate}"/>					 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 이 름</font>
				</td>
			
				<td width="50" bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.memberName}"/>					
				</td>
					<td width="100" bgcolor="#202f58"><font color="white">* 보유 Cash</font>
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.cash}"/>					 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 성 별</font>
				</td>
				<td width="50" bgcolor="#FFFFFF">
					
					<s:if test='resultClass.gender.equals("M")'>
						남자
					</s:if>
					<s:else>
						여자
					</s:else>	
								
				</td>
					<td width="100" bgcolor="#202f58"><font color="white">* 사용 여부</font>
				</td>
				<td bgcolor="#FFFFFF" >
					<s:property value="%{resultClass.userCheck}"/>					 
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 생년 월일</font>
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan="3">
					<s:property value="%{resultClass.birthday}" />				
				</td>
			</tr>
			
			
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 전화 번호</font>
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan="3">
					<s:property  value="%{resultClass.phone}" /> 			
				</td>
			</tr>
			
			
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 이메일</font>
				</td>
			
				<td width="50" bgcolor="#FFFFFF" colspan="3">
					<s:property value="%{resultClass.email}"/> 					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 우편 번호</font>
				</td>
				<td width="50" bgcolor="#FFFFFF" colspan="3">
				<s:property value="%{resultClass.zipcode}" /> 	
				</td>
			</tr> 
			<tr>
				<td width="100" bgcolor="#202f58"><font color="white">* 주 소</font>
				</td>
				<td width="200"bgcolor="#FFFFFF">
				<s:property value="%{resultClass.addr1}" /> 
				</td>
				<td colspan="2">
				<s:property value="%{resultClass.addr2}" /> 
				</td>
			</tr>
		
		</table>
		<br>
		<br>
		<input class="button" name="list" type="button" value="회원 목록" class="inputb" onClick="javascript:location.href='memberAdminList.action'">
    	<input class="button" name="modify" type="button" value="회원 수정" class="inputb" onClick="javascript:location.href='memberAdminModifyForm.action?memberID=<s:property value="resultClass.memberID" />&currentPage=<s:property value="currentPage" />'"> 
		<input class="button" type="button" value="회원 삭제" class="inputb" onClick="javascript:button_event('memberAdminDelete.action?memberID=<s:property value="resultClass.memberID" />')">
</div>


</body>
</html>