<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">

<style type="text/css">
	
	

	
	/*초기화와 메뉴폭 지정*/
	 #navi3{
	 	padding: 0;
	 	margin: 40PX;
	 	width: 80%;	 	
	 	text-align: center;	 
	 }
	 
	  
	 #navi3 h2{
	 	margin: 0;
	 	padding:0;		
	}
	
	/*메인메뉴 스타일 지정*/	
	 #navi3 h2 a{
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
	 #navi3 h2 a,
	 #navi3 h2 a:focus,
	 #navi3 h2 a:hover,
	 #navi3 he a:active{
	 
	 	background: #202f58;	 	 
	 	background: linear-gradient(#1a1a1a 0%,#202f58 100%);
	 	 color: #ffffff;
	 	text-shadow: 0 1px 1px #000;
	 
	}	
	
	
	</style>
	
<title></title>

</head>
<body>



		<div id="navi3">
			<h2>
				<a href="boardList.action" >문의 게시판 </a>
			</h2>
		</div>
		
		
		
		<div id="navi3">
			<h2>
				<a href="faqList.action" >자주 묻는 질문 </a>
			</h2>
		</div>
		


<!-- 
	<table width="100%" height="100%" border="0" cellspacing="0"	cellpadding="0">
		<tr height="50%">
			<td> 
			
				<table width="100%" height="200px" border="0" cellspacing="0"
					cellpadding="0">
					<tr height="100px">
						<td align="center"><a href="boardList.action" style="color: black;">문의 게시판 </a></td>
					</tr>

					<tr height="100px">
						<td align="center"><a href="faqList.action" style="color: black;">자주 묻는 질문 </a></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr height="50%">
			<td></td>
		</tr>
	</table> -->

</body>
</html>