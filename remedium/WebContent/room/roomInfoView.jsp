<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">


	<style type="text/css">
		
		#MainImag img{
		
			width: 80%;
			text-align: center;	 	
			/*  clear: both; */
		}
		
			
	
		
	/* 	#SubImage a img{
			
			float: left;			
			width: 10%;
			height: 10%;			
			margin: 1PX;
			display: block;
			
		}
		 */
		#InfoImage img{
		
			width: 10%;
			text-align: center;	 	
			clear: both;
		}
		
		.container{
			display: table;
			width:100%;
			height: 10%;			
			margin: 40px auto;
		}
		
		.outer{
			display: table;
			width:100%;
			height: 100%;
			
		}
	
		.inner{
			display: table-cell;
			vertical-align: middle;
			text-align:center;
		
			
		}
	
		.inner a img{
			
						
			width: 10%;
			height: 10%;			
			margin: 1PX;
			
			
		}
		
	</style>

</head>
<body>

<p><h3>${resultClass.name}</h3></p>


 <div id="MainImage">

	<img alt="메인 이미지" src="/remedium/image/roomClassImage/${imageMain}" >

</div>


<div class="container">
<div class="outer">
<div class="inner">

		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_01}">
		</a>
	
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_02}">
		</a>
		
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_03}">
		</a>
		
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_04}">
		</a>
		
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_05}">
		</a>	
</div>
</div>
</div>


 <div id="MainImage">

	<img alt="메인 이미지" src="/remedium/image/roomClassImage/${resultClass.image2}" >

</div>




<%-- <div id="MainImage">

	<img alt="메인 이미지" src="/remedium/image/roomClassImage/${imageMain}" >

</div>
 --%>

<%-- 

	<div id="SubImage">
	
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_01}">
		</a>
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_02}">
		</a>
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_03}">
		</a>
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_04}">
		</a>
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_05}">
		</a>
	
		
		
	</div> 
 --%><%-- 	
	<div id="SubImage">
	
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_02}">
		</a>
		
	</div>
	
	<div id="SubImage" style="height: 80px;">
	
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_03}">
		</a>
		
	</div>
	
	<div id="SubImage" style="height: 80px;">
	
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_04}">
		</a>
		
	</div>
	
	
	<div id="SubImage" style="height: 80px;">
	
		<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
			<img  alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_05}">
		</a>
		
	</div>
	
	
<div id="InfoImage">

	<img alt="메인 이미지" src='/remedium/image/roomClassImage/${resultClass.image2}' >

</div>
 --%>	

<%-- 
<div class="img">
  <a target="_blank" href="fjords.jpg">
    <img height="510" alt="호텔로고" src='/remedium/image/roomClassImage/${imageMain}' >
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="img">
  <a target="_blank" href="forest.jpg">
    <img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_01}">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="img">
  <a target="_blank" href="lights.jpg">
    <img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_02}">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>

<div class="img">
  <a target="_blank" href="mountains.jpg">
   <img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_03}">
  </a>
  <div class="desc">Add a description of the image here</div>
</div>
 --%>
<%-- 
<p><h3>${resultClass.name}</h3></p>
	
<img height="510" alt="호텔로고" src='/remedium/image/roomClassImage/${imageMain}' >


<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=1">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_01}">
</a>

<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=2">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_02}">
</a>

<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=3">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_03}">
</a>

<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=4">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_04}">
</a>

<a href="roomInfoView.action?roomClass=${roomClass}&imageNum=5">
	<img height="100" alt="메인 이미지1" src="/remedium/image/roomClassImage/${image_05}">
</a>



<p><h3>${resultClass.content}</h3></p>


	<img height="200" alt="메인 이미지1" src="/remedium/image/roomClassImage/${resultClass.image2}">


 --%>


</body>
</html>