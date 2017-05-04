<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!DOCTYPE html>
<html lang="ko" >
<head>
	<meta charset="UTF-8">
	<title></title>
	
	<style type="text/css">
	
	

	
	/*초기화와 메뉴폭 지정*/
	 #navi2{
	 	padding: 0;
	 	margin: 40PX;
	 	width: 80%;	 	
	 	text-align: center;	 
	 }
	 
	  
	 #navi2 h2{
	 	margin: 0;
	 	padding:0;		
	}
	
	/*메인메뉴 스타일 지정*/	
	 #navi2 h2 a{
	 	display: block;
	 	font-weight: bold;
	 	text-decoration: none;
	 	margin: 0;
	 	padding: 10px;
	 	font-family: '돋음', sans-serif;
	 	font-size: 14px;
	 	color: #ffffff;
	 	text-shadow: 0 1px 1px #000;	 	
	 	
	 	background: #1d4ab3; 
	 	background: linear-gradient(#1d4ab3 0%, #163887 100%);
	 
	 	
	}
	
	  /*메인 메뉴에 대한 마우스 이벤트에 대한 효과 지정*/
	 #navi2 h2 a,
	 #navi2 h2 a:focus,
	 #navi2 h2 a:hover,
	 #navi2 he a:active{
	 
	 	background: #202f58;	 	 
	 	background: linear-gradient(#1a1a1a 0%,#202f58 100%);
	 	color:#ffffff;
	 	text-shadow: 0 1px 1px #000;
	 
	}	
	
	
	</style>
	
</head>
<!-- <body style="background-color: black;" > -->
<body>

 <s:if test="list.size() <= 0">				
		객실 클래스 정보가 없습니다					
</s:if>	 

<s:else>
	
	<s:if test='%{ session.userAdmin.equals("1") }'>
	
		<div id="navi2">
			<h2>
				<a href="roomInfoList.action?roomClass=0" >객실 소개  관리 </a>
			</h2>
		</div>
		
	</s:if>
	
	<s:iterator value="list">
	
		<div id="navi2">
			<h2>
				 <a href='roomInfoView.action?roomClass=<s:property value="room_class"/>'><s:property value="name"/></a>
			</h2>
		</div>
	
	</s:iterator>
	
</s:else>





		 
<%-- 	 <s:if test="list.size() <= 0">
				
		객실 클래스 정보가 없습니다
					
	</s:if>	 
	 <s:else>
	 <table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" >
		<tr height="50%"><td >
		
		
			<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">				
				
				<!-- 아이디가 관리자 아이디일 경우 -->
				<s:if test='%{ session.userAdmin.equals("1") }'> <!-- 아이디가 관리자 아이디일 경우 -->
				
				<s:if test='${ session.userAdmin=="1" }'>
					<tr height="10%">
						<td align="center">
							<a href="roomInfoList.action?roomClass=0" >객실 소개  관리 </a>
						</td>
					</tr>
				</s:if>
						 	
	
				<s:iterator value="list">
					<tr  height="10%">
				 		
				 		
				 		
				 		<td align="center">
				 			  <a href='roomInfoView.action?roomClass=<s:property value="room_class"/>'style="color: black;"><font size=2><b><s:property value="name"/></b></font></a>
				 			
				 		<td>	
				 
					
					</tr>	
				</s:iterator>
			</table>
				
	</td></tr>
		<tr height="50%">
			<td ></td>
		</tr>
	</table>			
	</s:else>
	
	
	 --%>
 
</body>
</html>