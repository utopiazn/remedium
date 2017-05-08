<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko"  xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/form.css" rel="stylesheet" style="text/css">
<link href="css/board.css" rel="stylesheet" style="text/css">

<script type="text/javascript">	
		function validation2(userinput){

		 	if(userinput.memberPassword.value== ""){
				alert("비밀번호를 입력하세요");
				return false;
			}
			
			else if (userinput.memberPassword2.value==""){
				alert("비밀번호 확인을 입력하세요");
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
</head>
<body>
<div class="join">


	
<table width="600" border="0" cellspacing="0" cellpadding="2">
<tr>
<td align="center">
<h2>회원 정보 수정</h2>
<hr align="center" width="50%" size="1" color="gray">
</td>
</tr>		
</table>

<br>

<form action="loginModify.action"  method="post" enctype="multipart/form-data">
	<s:hidden name="memberID" value="${memberID}" />
	<s:hidden name="regdate" value="%{resultClass.regdate}" />
	<s:hidden name="zipcode" value="%{resultClass.zipcode}" />
	<s:hidden name="addr1" value="%{resultClass.addr1}" />
	<s:hidden name="addr2" value="%{resultClass.addr2}" />
	<s:hidden name="currentPage" value="%{currentPage}" />
	<s:hidden name="memberName" value="%{resultClass.memberName}" />
	<s:hidden name="gender" value="%{resultClass.gender}" />
<table width="550" border="0" cellspacing="0" cellpadding="0">
 <tr>
 <td width="100" bgcolor="#202f58" align="left">
 <font color="#FFFFFF">* 새 비밀번호</font>
</td>
			
<td width="60" bgcolor="#FFFFFF"align="left">
&nbsp;<s:password name="memberPassword" theme="simple" value="%{resultClass.memberPassword}" cssStyle="width:270px" maxlength="50"/>										
</td></tr>

 <tr bgcolor="#777777">
<td height="1" colspan="2"></td>	
  </tr>
<tr>
<td width="100" bgcolor="#202f58" align="left">
<font color="#FFFFFF">* 새 비밀번호 확인</font>
</td>
			
<td width="50" bgcolor="#FFFFFF"align="left">

&nbsp;<s:password name="memberPassword2" theme="simple"  cssStyle="width:270px" maxlength="50"/>					
</td>
</tr>
 <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>			
<tr>
<td width="100" bgcolor="#202f58" align="left">
<font color="#FFFFFF">* 생년 월일 </font>
</td>
			
<td width="50" bgcolor="#FFFFFF"align="left">

&nbsp;<s:textfield name="birthday" theme="simple" value="%{resultClass.birthday}" cssStyle="width:270px" maxlength="50"/> 예)20140407					
</td>
</tr>
 <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>			
<tr>
<td width="100" bgcolor="#202f58" align="left">
<font color="#FFFFFF">* 전화 번호</font>
</td>
			
<td width="50" bgcolor="#FFFFFF"align="left">

&nbsp;<s:textfield name="phone" theme="simple" value="%{resultClass.phone}" cssStyle="width:270px" maxlength="50"/> 	'-' 제외				
</td>
</tr>
			
 <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>			
<tr>
<td width="100" bgcolor="#202f58" align="left">
<font color="#FFFFFF">* 이메일</font>
</td>
			
<td width="50" bgcolor="#FFFFFF" align="left">

&nbsp;<s:textfield name="email" theme="simple" value="%{resultClass.email}" cssStyle="width:270px" maxlength="50"/> 					
</td>
</tr>
 <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>			
<tr>
<td width="100" bgcolor="#202f58" align="left">
<font color="#FFFFFF">* 주 소</font>
</td>
			
			
<td width="50" bgcolor="#FFFFFF"align="left">
 
&nbsp;<input type="text" id="sample6_postcode" name="zipcode1" placeholder="${resultClass.zipcode}">

&nbsp; <input type="button" onclick="sample6_execDaumPostcode()"  value="우편번호 찾기"><br>

&nbsp;<input type="text" id="sample6_address" name="addr11"  placeholder="${resultClass.addr1}">
 
&nbsp;<input type="text" id="sample6_address2" name="addr22" placeholder="${resultClass.addr2}">
</td></tr>
 <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
</table>	
<br/>
		
<input type="submit" value="수 정" class="button">	
		
	
</form>
</div> 
	
	


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