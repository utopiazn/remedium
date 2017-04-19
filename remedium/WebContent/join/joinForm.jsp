<%@ page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html>
<?xml version="1.0" encoding="UTF-8" ?>
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" >
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	


	<script type="text/javascript">		
	
		function setChildValue(name){	
		     document.getElementById("memberID").value = name;	
		}
		
	</script>	
	<script type="text/javascript">	
		function validation2(userinput){

		
			if(userinput.memberID.value==""){
				alert("아이디를 입력하세요");
				return false;
			}
				
		 	if(userinput.memberPassword.value== ""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			else if (userinput.memberPassword2.value==""){
				alert("비밀번호 확인을 입력하세요");
				return false;
			}
			
			else if(userinput.memberPassword.value != userinput.memberPassword2.value){
				alert("비밀번호 와 확인 비밀번호가 서로 다릅니다.");
				return false;
			}
			
			if(userinput.memberName.value==""){
				alert("이름을 확인을 입력하세요");
				return false;
			}
			
			if(userinput.birthday.value==""){
				alert("생년월일을 입력하세요");
				return false;
			}
			
			if(userinput.birthday.value==""){
				alert("생년월일을 입력하세요");
				return false;
			}
			
			if(userinput.email.value==""){
				alert("이메일을 입력하세요");
				return false;
			}
			
			if(userinput.zipcode.value==""){
				alert("우편번호 입력하세요");
				return false;
			}
			
			
			if(userinput.addr1.value==""){
				alert("주소를 입력하세요");
				return false;
			}
			
			if(userinput.addr2.value==""){
				alert("상세주소를 입력하세요");
				return false;
			}
			
			return true;
		}
		</script>	
	 	<script type="text/javascript">	

		//아이디 중복 여부를 판다
		function openConfirmid(userinput){
			//아이디를 입력했는지 검사
			if(userinput.memberID.value==""){
				alert("아이디를 입력하세요");
				return;
			}
	
			
			//url과 사용자 입력 id를 조합합니다.			
			url="idCheck.action?memberID="+userinput.memberID.value;
			
			//새로운 윈도우를 엽니다.
			open(url,"confirm",
			 "toolbar=no, location=no,status=no,menubar=no,scrollbars=no,resizable=no,width=400, height=200");
	
		}
		
	
	</script>
	
	
	
	
</head>
<body>

	
	<table width="600" border="0" cellspacing="0" cellpadding="2">
	
		<tr>
			<td align="center">
				<h2>회원 가입</h2>
			</td>
		</tr>	
		
		<tr>
			<td align="right">
				<font color="#FF0000">*</font>는 필수 입력 사항입니다.
			</td>
		</tr>
	
	</table>


	<!-- 로그인폼으로 이동 -->
	<form name="myForm" action="join.action"  method="post" enctype="multipart/form-data" onsubmit="return validation2(this);">

	
		<table width="600" border="0" cellspacing="0" cellpadding="0">
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>아이디
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
				
					<%-- <s:textfield name="memberID" theme="simple" value="%{resultClass.memberID}" cssStyle="width:270px" maxlength="50"/> --%>
					<s:textfield name="memberID" theme="simple"  cssStyle="width:270px" maxlength="50"/>				
					<!-- <input type="text" name="memberID" size="40" > -->
			
					<input type="button" name="confirm_id" value="ID중복확인"  onclick="openConfirmid(this.form)">
			
					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>비밀번호
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="memberPassword" theme="simple" value="%{paramClass.memberPassword}" cssStyle="width:270px" maxlength="50"/>					 
					
					
					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>비밀번호 확인
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="memberPassword2" theme="simple"  cssStyle="width:270px" maxlength="50"/>					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>이름
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="memberName" theme="simple" value="%{paramClass.memberName}" cssStyle="width:270px" maxlength="50"/>					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>성별
				</td>
				
			
			
				<td width="50" bgcolor="#FFFFFF">
									
					<input type="radio" name="gender" value="M"  checked="checked" />남자
					<input type="radio" name="gender" value="W"/>여자

				
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>생년월일
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="birthday" theme="simple" value="%{paramClass.birthday}" cssStyle="width:270px" maxlength="50"/> 예)20140407					
				</td>
			</tr>
			
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>전화 번호
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="phone" theme="simple" value="%{resultClass.phone}" cssStyle="width:270px" maxlength="50"/> 	'-' 제외				
				</td>
			</tr>
			
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>이메일
				</td>
			
				<td width="50" bgcolor="#FFFFFF">
					<s:textfield name="email" theme="simple" value="%{resultClass.email}" cssStyle="width:270px" maxlength="50"/> 					
				</td>
			</tr>
			
			<tr>
				<td width="100" bgcolor="#F4F4F4">
					<font color="#FF0000">*</font>주소
				</td>
			
			
				<td width="50" bgcolor="#FFFFFF">
				
					<input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()"  value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" name="addr1"  placeholder="주소">
					<input type="text" id="sample6_address2" name="addr2" placeholder="상세주소">
				</td>
			</tr>
		
		</table>	
		
		<br/>
		
		<input type="submit" value="가입" >	
		<button type="button" onclick="location.href='loginForm.action' ">취소</button>
	</form>
	
	


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
	
	
	<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
	&nbsp;
	
	
	

</body>
</html>